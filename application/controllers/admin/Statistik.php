<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class Statistik extends MY_Controller {
	public function rekap()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', [])->result_array();
		$data['mata_pelajaran']		=	$this->my_where('mata_pelajaran', [])->result_array();
		$data['kelas']		=	$this->my_where('kelas', [])->result_array();
		$this->my_view(['role/admin/page/statistik/rekap/index','role/admin/page/statistik/rekap/js'],$data);
	}
	public function get_laporan_tipe($tipe='')
	{
		$data =[];
		$this->my_view(['role/admin/page/statistik/rekap/p'.$tipe], $data);
	}
	public function proses_rekap()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', ['id_tahun_ajaran'=>$_POST['idtahunajaran_fk']])->row_array();
		$siswa		=	$this->my_where('siswa', ['idkelas_fk'=>$_POST['idkelas_fk']])->result_array();
		$data['kelas']		=	$this->my_where('kelas', ['id_kelas'=>$_POST['idkelas_fk']])->row_array();
		$data['siswa'] = [];
		// $data['mata_pelajaran'] = $this->my_where('mata_pelajaran', ['id_mata_pelajaran'=>$_POST['idmatapelajaran_fk']])->row_array();
		$data['bulan'] = $_POST['tanggal'];
		$data['idkelas_fk'] = $_POST['idkelas_fk'];
		$data['all_day'] 	= cal_days_in_month(CAL_GREGORIAN, date_format(date_create($_POST['tanggal']), "m"), date_format(date_create($_POST['tanggal']), "Y"));

		if ($_POST['tipe'] == 0) {
			$tanggal_mulai = $_POST['tanggal_mulai'];
			$tanggal_selesai = $_POST['tanggal_selesai'];
			$data['tanggal_mulai']	=	$tanggal_mulai;
			$data['tanggal_selesai']=	$tanggal_selesai;
			$begin = new DateTime($tanggal_mulai);
			$end = new DateTime($tanggal_selesai);
			$interval = DateInterval::createFromDateString('1 day');
			$period = new DatePeriod($begin, $interval, $end);
			$data['tg']	=	$period;
			$data['tgl'] = [];
			foreach ($period as $dt) {
				    $tgl = $dt->format("Y").'-'.$dt->format("m").'-'.$dt->format("d");
				    $m=0;
				    $tm = 0;
				    $query = $this->db->query("Select 
									count(if(presensi='M', presensi, null)) as M,  
									count(if(presensi='S', presensi, null)) as S,  
									count(if(presensi='I', presensi, null)) as I,  
									count(if(presensi='A', presensi, null)) as A,  
									count(if(presensi<>'M', presensi, null)) as TM 
									 from presensi_harian where 
									idkelas_fk = ".$_POST['idkelas_fk']." and
									idtahunajaran_fk = ".$_POST['idtahunajaran_fk']." and
									DATE(tanggal) = '".($tgl)."'
									GROUP BY idsiswa_fk");

				    foreach ($query->result_array() as $key => $value) {
				    	$m += ($value['TM'] > 0) ? 0 : 1;
				    	$tm += ($value['TM'] > 0) ? 1 : 0;
				    }
				    $data['tgl'][] = $dt->format("d").'/'.$dt->format("m");
				    $data['m'][] = $m;
				    $data['tm'][] = $tm;

				    
			}

			// print_r($data['stats']);
			$this->my_view(['role/admin/page/statistik/rekap/stats0'], $data);
				
		}
	}
}
?>