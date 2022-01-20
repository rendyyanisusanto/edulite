<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class persentase_guru extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman siswa_kelas',
			'table'				=>	'persentase_guru',
			'column'			=>	[ 'siswa_kelas'],
			'column_order'		=>	[ 'id_siswa_kelas','siswa_kelas'],
			'column_search'		=>	[ 'id_siswa_kelas','siswa_kelas'],
			'order'				=>	['id_siswa_kelas'	=>	'DESC'],
			'id'				=>	'id_siswa_kelas'
	];

	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran',['is_active'=>1])->row_array();
		$guru				=	$this->my_where('guru',[])->result_array();
		$data['guru']		=	[];
		foreach ($guru as $key => $value) {
			$persentase_guru = $this->my_where('persentase_guru', ['idguru_fk' => $value['id_guru'], 'idtahunajaran_fk'=>$data['tahun_ajaran']['id_tahun_ajaran']]);

			$data['persentase_guru'][] = [
				'guru' => $value,
				'persentase' => (($persentase_guru->num_rows() > 0) ? $persentase_guru->row_array() : [] )
			]; 
		}

		$this->my_view(['role/admin/page/persentase_guru/index_page/index','role/admin/page/persentase_guru/index_page/js'],$data);
	}

	function simpan_data()
	{

		$tahun_ajaran		=	$this->my_where('tahun_ajaran',['is_active'=>1])->row_array();
		
		foreach ($_POST['data'] as $key => $value) {
			$data_set = [
				'idguru_fk'			=>	$value['id_guru'],
				'persentase'		=>	$value['persentase'],
				'idtahunajaran_fk'	=>	$tahun_ajaran['id_tahun_ajaran']
			];

			if ($this->my_where('persentase_guru', [
				'idguru_fk'			=>	$value['id_guru'],
				'idtahunajaran_fk'	=>	$tahun_ajaran['id_tahun_ajaran']
			])->num_rows() < 1) {
				$this->save_data('persentase_guru', $data_set);
			}else{
				$data_query = $this->my_where('persentase_guru', 
			[
				'idguru_fk'			=>	$value['id_guru'],
				'idtahunajaran_fk'	=>	$tahun_ajaran['id_tahun_ajaran']
			])->row_array();

				$this->my_update('persentase_guru', $data_set, ['id_persentase_guru'=>$data_query['id_persentase_guru']]);
			}
		
		}

		echo json_encode($_POST);
	}

	function hapus_hari()
	{
		$this->db->delete('presensi_guru', ['id_presensi_guru'=>$_POST['id']]);
	}

	public function get_presensi()
	{

		$tahun_ajaran		=	$this->db->get_where('tahun_ajaran',['is_active'=>1])->row_array();
		$data['guru']		=	$this->db->get_where('guru', [])->result_array();
		$data['presensi'] 	= 	[];

		foreach ($data['guru'] as $key => $value) {
			$day = date('w', strtotime("now"));

			$cek_absen = $this->db->get_where('jadwal_guru', ['idguru_fk'=>$value['id_guru'], 'idhari_fk'=>$day]);

			if ($cek_absen->num_rows() > 0) {
				$cek = $this->db->get_where('presensi_guru', ['idguru_fk'=>$value['id_guru'],'idtahunajaran_fk'=>$tahun_ajaran['id_tahun_ajaran'],'tanggal'=>date('Y-m-d')])->row_array();

				$data['presensi'][] = [
					'guru' => $value,
					'presensi' => $cek
				];
			}
			
		}
		// print_r($data);
		$this->load->view('role/presensi_guru/presensi', $data);
		// $this->my_view(['role/admin/page/presensi_guru/index_page/presensi'],$data);

	}

	public function save_presensi_firebase()
	{
		if ($_POST['kode'] == date('Y-m-d')) {
			$tahun_ajaran		=	$this->my_where('tahun_ajaran',['is_active'=>1])->row_array();
			$data = [
				'idguru_fk'			=>	$_POST['id_guru'],
				'tanggal'			=>	date('Y-m-d'),
				'jam_masuk'			=>	($_POST['status'] == 0) ? date('H:i:s'):'',
				'jam_keluar'		=>	($_POST['status'] == 1) ? date('H:i:s'):'',
				'idtahunajaran_fk'	=>	$tahun_ajaran['id_tahun_ajaran']
			];

			$cek = $this->my_where('presensi_guru', [
				'idguru_fk'			=>	$_POST['id_guru'],
				'tanggal'			=>	date('Y-m-d'),
				'idtahunajaran_fk'	=>	$tahun_ajaran['id_tahun_ajaran']
			]);

			if ($cek->num_rows() == 0) {
				if ($this->save_data('presensi_guru', $data)) {
					# code...
				}
			}else{
				if ($_POST['status'] == 1) {
					if ($cek->row_array()['jam_keluar'] == '00:00:00') {
					
						$this->my_update('presensi_guru', ['jam_keluar'=>date('H:i:s')], [
							'idguru_fk'			=>	$_POST['id_guru'],
							'tanggal'			=>	date('Y-m-d'),
							'idtahunajaran_fk'	=>	$tahun_ajaran['id_tahun_ajaran']
						]);
					}
				}
				if ($_POST['status'] == 0) {
					if ($cek->row_array()['jam_masuk'] == '00:00:00') {
						$this->my_update('presensi_guru', ['jam_masuk'=>date('H:i:s')], [
							'idguru_fk'			=>	$_POST['id_guru'],
							'tanggal'			=>	date('Y-m-d'),
							'idtahunajaran_fk'	=>	$tahun_ajaran['id_tahun_ajaran']
						]);
					}
				}
				

				
			}
		}
	}
}