<?php

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
defined('BASEPATH') OR exit('No direct script access allowed');
class Laporan_presensi_siswa extends MY_Controller {
	
	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['dt_guru']	=	$this->get_guru();
		$this->my_view(['role/guru/page_mobile/laporan_presensi_siswa/index_page/index','role/guru/page_mobile/laporan_presensi_siswa/index_page/js'],$data);
	}
    public function laporan_per_kelas(){

    }

    function laporan_per_siswa(){
        $data['account']	=	$this->get_user_account();
        $data['dt_guru']	=	$this->get_guru();
        $this->my_view(['role/guru/page_mobile/laporan_presensi_siswa/laporan_per_siswa/index','role/guru/page_mobile/laporan_presensi_siswa/laporan_per_siswa/js'],$data);
    }

    function proses_laporan_per_siswa(){
        $start = new DateTime($_POST['tanggal_mulai']);
        $end = new DateTime($_POST['tanggal_selesai']);
        $end = $end->modify('+1 day'); // Biar tanggal akhir ikut ter-loop

        $periode = new DatePeriod($start, new DateInterval('P1D'), $end);

        foreach ($periode as $tanggal) {
            // echo $tanggal->format("Y-m-d") . "<br>";

            $absen = $this->db->query("SELECT * FROM presensi_rfid WHERE idsiswa_fk = '".$_POST['idsiswa_fk']."' AND tanggal = '".$tanggal->format("Y-m-d")."'");
            $absen_masuk = $this->db->query("SELECT * FROM presensi_rfid WHERE idsiswa_fk = '".$_POST['idsiswa_fk']."' AND tanggal = '".$tanggal->format("Y-m-d")."' AND status = 'MASUK' ORDER BY id_presensi_rfid ASC LIMIT 1")->row_array();
            $absen_pulang = $this->db->query("SELECT * FROM presensi_rfid WHERE idsiswa_fk = '".$_POST['idsiswa_fk']."' AND tanggal = '".$tanggal->format("Y-m-d")."' AND status = 'PULANG' ORDER BY id_presensi_rfid DESC LIMIT 1")->row_array();
            $jumlah_ijin = $this->db->query("SELECT * FROM presensi_rfid WHERE idsiswa_fk = '".$_POST['idsiswa_fk']."' AND tanggal = '".$tanggal->format("Y-m-d")."' AND status = 'IJIN KELUAR'")->num_rows();
            
            $data['dt_absen'][$tanggal->format("Y-m-d")]['absen'] = ($absen->num_rows() > 0) ? "MASUK" : "TIDAK MASUK";
            $data['dt_absen'][$tanggal->format("Y-m-d")]['jam_masuk'] = ($absen_masuk) ? $absen_masuk : "-";
            $data['dt_absen'][$tanggal->format("Y-m-d")]['jam_pulang'] = ($absen_pulang) ? $absen_pulang : "-";
            $data['dt_absen'][$tanggal->format("Y-m-d")]['jumlah_ijin'] = $jumlah_ijin;
            
        }

        $this->my_view(['role/guru/page_mobile/laporan_presensi_siswa/laporan_per_siswa/result'],$data);
    }
    public function get_siswa()
	{
		$searchTerm = $this->input->post('searchTerm');

      // Get users

      	 $this->db->select('*');
	     $this->db->where("nama like '%".$searchTerm."%' ")->limit(5);
	     $fetched_records = $this->db->get('v_siswa_jurusan');
	     $users = $fetched_records->result_array();

	     // Initialize Array with fetched data
	     $data = array();
	     foreach($users as $user){
	        $data[] = array("id"=>$user['id_siswa'], "text"=>$user['nama'].'('.$user['kelas'].')');
	     }

      	echo json_encode($data);
	}
}