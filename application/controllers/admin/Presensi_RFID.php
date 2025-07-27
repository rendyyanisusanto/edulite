<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class Presensi_RFID extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman siswa_kelas',
			'table'				=>	'presensi_RFID',
			'column'			=>	[ 'siswa_kelas'],
			'column_order'		=>	[ 'id_siswa_kelas','siswa_kelas'],
			'column_search'		=>	[ 'id_siswa_kelas','siswa_kelas'],
			'order'				=>	['id_siswa_kelas'	=>	'DESC'],
			'id'				=>	'id_siswa_kelas'
	];

	/*
		CHANGE PAGE
	*/
	public function rekap()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', [])->result_array();
		$data['mata_pelajaran']		=	$this->my_where('mata_pelajaran', [])->result_array();
		$data['kelas']		=	$this->my_where('kelas', [])->result_array();
		$this->my_view(['role/admin/page/presensi_RFID/rekap/index','role/admin/page/presensi_RFID/rekap/js'],$data);
	}

    public function proses_presensi()
    {
        $tanggal_mulai = $this->input->post('tanggal_mulai');
        $tanggal_selesai = $this->input->post('tanggal_selesai');
        $kelas_id = $this->input->post('kelas');

        // Ambil data siswa per kelas
        $this->db->select('s.id_siswa, s.nama');
        $this->db->from('siswa s');
        $this->db->where('s.idkelas_fk', $kelas_id);
        $siswa_list = $this->db->get()->result_array();

        // Ambil data presensi per tanggal dan siswa
        $this->db->select('*');
        $this->db->from('presensi_rfid');
        $this->db->where('tanggal >=', $tanggal_mulai);
        $this->db->where('tanggal <=', $tanggal_selesai);
        if ($kelas_id) {
            $this->db->where_in('idsiswa_fk', array_column($siswa_list, 'id_siswa'));
        }
        $presensi = $this->db->get()->result_array();

        // Strukturkan data
        $rekap = [];
        foreach ($siswa_list as $siswa) {
            $id = $siswa['id_siswa'];
            $nama = $siswa['nama'];

            $tanggal_loop = new DateTime($tanggal_mulai);
            $tanggal_akhir = new DateTime($tanggal_selesai);

            while ($tanggal_loop <= $tanggal_akhir) {
                $tgl = $tanggal_loop->format('Y-m-d');

                // Filter presensi siswa pada tanggal ini
                $filter = array_filter($presensi, function ($p) use ($id, $tgl) {
                    return $p['idsiswa_fk'] == $id && $p['tanggal'] == $tgl;
                });

                $status_hari_ini = array_column($filter, 'status');

                $rekap[$id]['nama'] = $nama;
                $rekap[$id]['presensi'][$tgl] = [
                    'MASUK' => in_array('MASUK', $status_hari_ini),
                    'PULANG' => in_array('PULANG', $status_hari_ini),
                    'IJIN KELUAR' => in_array('IJIN KELUAR', $status_hari_ini),
                    'IJIN KEMBALI' => in_array('IJIN KEMBALI', $status_hari_ini),
                    'KEHADIRAN' => !empty($status_hari_ini) // kalau ada data, berarti hadir
                ];

                $tanggal_loop->modify('+1 day');
            }
        }

        $data['rekap'] = $rekap;
        $data['tanggal_mulai'] = $tanggal_mulai;
        $data['tanggal_selesai'] = $tanggal_selesai;

		$this->my_view(['role/admin/page/presensi_RFID/rekap/hasil_presensi'],$data);
    }

}

