<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class presensi_harian extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman siswa_kelas',
			'table'				=>	'presensi_harian',
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
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', [])->result_array();
		$data['mata_pelajaran']		=	$this->my_where('mata_pelajaran', [])->result_array();
		$data['kelas']		=	$this->my_where('kelas', [])->result_array();
		$this->my_view(['role/kesiswaan/page/presensi_harian/index_page/index','role/kesiswaan/page/presensi_harian/index_page/js'],$data);
	}
	public function rekap()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', [])->result_array();
		$data['mata_pelajaran']		=	$this->my_where('mata_pelajaran', [])->result_array();
		$data['kelas']		=	$this->my_where('kelas', [])->result_array();
		$this->my_view(['role/kesiswaan/page/presensi_harian/rekap/index','role/kesiswaan/page/presensi_harian/rekap/js'],$data);
	}
	public function proses_presensi_harian($value='')
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', ['id_tahun_ajaran'=>$_POST['idtahunajaran_fk']])->row_array();
		$siswa		=	$this->my_where('siswa', ['idkelas_fk'=>$_POST['idkelas_fk']])->result_array();
		$data['kelas']		=	$this->my_where('kelas', ['id_kelas'=>$_POST['idkelas_fk']])->row_array();
		$data['siswa'] = [];
		$data['mata_pelajaran'] = $this->my_where('mata_pelajaran', ['id_mata_pelajaran'=>$_POST['idmatapelajaran_fk']])->row_array();
		$data['tanggal'] = $_POST['tanggal'];
		$data['idkelas_fk'] = $_POST['idkelas_fk'];
		foreach ($siswa as $key => $value) {
			$presensi = $this->my_where('presensi_harian', [
				'idsiswa_fk' 			=> 	$value['id_siswa'],
				'idtahunajaran_fk'		=>	$_POST['idtahunajaran_fk'],
				'idkelas_fk'			=>	$_POST['idkelas_fk'],
				'tanggal'				=>	$_POST['tanggal'],
				'idmatapelajaran_fk' 	=> 	$_POST['idmatapelajaran_fk'],
			])->row_array();

			$data['siswa'][] = [
				'siswa' => $value,
				'presensi' => !empty($presensi) ? $presensi : []
			];
 		}
		$this->my_view(['role/kesiswaan/page/presensi_harian/index_page/list_siswa'],$data);
	}
	public function proses_rekap()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', ['id_tahun_ajaran'=>$_POST['idtahunajaran_fk']])->row_array();
		$siswa		=	$this->my_where('siswa', ['idkelas_fk'=>$_POST['idkelas_fk']])->result_array();
		$data['kelas']		=	$this->my_where('kelas', ['id_kelas'=>$_POST['idkelas_fk']])->row_array();
		$data['siswa'] = [];
		$data['mata_pelajaran'] = $this->my_where('mata_pelajaran', ['id_mata_pelajaran'=>$_POST['idmatapelajaran_fk']])->row_array();
		$data['bulan'] = $_POST['tanggal'];
		$data['idkelas_fk'] = $_POST['idkelas_fk'];
		$data['all_day'] 	= cal_days_in_month(CAL_GREGORIAN, date_format(date_create($_POST['tanggal']), "m"), date_format(date_create($_POST['tanggal']), "Y"));

		if ($_POST['tipe'] == 0) {
			foreach ($siswa as $key => $value) {
				$all_day 		= cal_days_in_month(CAL_GREGORIAN, date_format(date_create($_POST['tanggal']), "m"), date_format(date_create($_POST['tanggal']), "Y"));
				$presensi = [];
				for ($i=1; $i <= $all_day ; $i++) { 
					$presensi[$i] = $this->my_where('presensi_harian', [
								'idsiswa_fk' 			=> 	$value['id_siswa'],
								'idtahunajaran_fk'		=>	$_POST['idtahunajaran_fk'],
								'idkelas_fk'			=>	$_POST['idkelas_fk'],
								'MONTH(tanggal)'		=>	date_format(date_create($_POST['tanggal']), "m"),
								'YEAR(tanggal)'			=>	date_format(date_create($_POST['tanggal']), "Y"),
								'DAY(tanggal)'			=>	$i,
								'idmatapelajaran_fk' 	=> 	$_POST['idmatapelajaran_fk'],
							])->row_array();
				}
				

				$data['siswa'][] = [
					'siswa' => $value,
					'presensi' => !empty($presensi) ? $presensi : []
				];
	 		}
			$this->my_view(['role/kesiswaan/page/presensi_harian/rekap/list_siswa'],$data);
		} elseif($_POST['tipe'] == 1){
			foreach ($siswa as $key => $value) {
				$a = $this->my_where('presensi_harian', [
								'idsiswa_fk' 			=> 	$value['id_siswa'],
								'idtahunajaran_fk'		=>	$_POST['idtahunajaran_fk'],
								'idkelas_fk'			=>	$_POST['idkelas_fk'],
								'MONTH(tanggal)'		=>	date_format(date_create($_POST['tanggal']), "m"),
								'YEAR(tanggal)'			=>	date_format(date_create($_POST['tanggal']), "Y"),
								'idmatapelajaran_fk' 	=> 	$_POST['idmatapelajaran_fk'],
								'presensi'				=>	'A'
							])->num_rows();
				$m = $this->my_where('presensi_harian', [
								'idsiswa_fk' 			=> 	$value['id_siswa'],
								'idtahunajaran_fk'		=>	$_POST['idtahunajaran_fk'],
								'idkelas_fk'			=>	$_POST['idkelas_fk'],
								'MONTH(tanggal)'		=>	date_format(date_create($_POST['tanggal']), "m"),
								'YEAR(tanggal)'			=>	date_format(date_create($_POST['tanggal']), "Y"),
								'idmatapelajaran_fk' 	=> 	$_POST['idmatapelajaran_fk'],
								'presensi'				=>	'M'
							])->num_rows();
				$s = $this->my_where('presensi_harian', [
								'idsiswa_fk' 			=> 	$value['id_siswa'],
								'idtahunajaran_fk'		=>	$_POST['idtahunajaran_fk'],
								'idkelas_fk'			=>	$_POST['idkelas_fk'],
								'MONTH(tanggal)'		=>	date_format(date_create($_POST['tanggal']), "m"),
								'YEAR(tanggal)'			=>	date_format(date_create($_POST['tanggal']), "Y"),
								'idmatapelajaran_fk' 	=> 	$_POST['idmatapelajaran_fk'],
								'presensi'				=>	'S'
							])->num_rows();
				$i = $this->my_where('presensi_harian', [
								'idsiswa_fk' 			=> 	$value['id_siswa'],
								'idtahunajaran_fk'		=>	$_POST['idtahunajaran_fk'],
								'idkelas_fk'			=>	$_POST['idkelas_fk'],
								'MONTH(tanggal)'		=>	date_format(date_create($_POST['tanggal']), "m"),
								'YEAR(tanggal)'			=>	date_format(date_create($_POST['tanggal']), "Y"),
								'idmatapelajaran_fk' 	=> 	$_POST['idmatapelajaran_fk'],
								'presensi'				=>	'I'
							])->num_rows();
				$data['siswa'][] = [
					'siswa' => $value,
					'm' => 	$m,
					's'	=>	$s,
					'i'	=>	$i,
					'a'	=>	$a
				];
			}
			$this->my_view(['role/kesiswaan/page/presensi_harian/rekap/list_total'],$data);
		}
		
	}
	public function save_presensi_harian()
	{
		if (count($_POST['data']) > 0) {
			foreach ($_POST['data'] as $key => $value) {
				$data = [
					'idmatapelajaran_fk' 	=> 	$_POST['idmatapelajaran_fk'],
					'idsiswa_fk'			=>	$value['idsiswa_fk'],
					'presensi'				=>	$value['presensi'],
					'keterangan'			=>	"",
					'tanggal'				=>	$_POST['tanggal'],
					'idtahunajaran_fk'		=>	$_POST['idtahunajaran_fk'],
					'idkelas_fk'			=>	$_POST['idkelas_fk'],
				];

				$presensi = $this->my_where('presensi_harian', [
					'idsiswa_fk' 			=> 	$value['idsiswa_fk'],
					'idtahunajaran_fk'		=>	$_POST['idtahunajaran_fk'],
					'idkelas_fk'			=>	$_POST['idkelas_fk'],
					'tanggal'				=>	$_POST['tanggal'],
					'idmatapelajaran_fk' 	=> 	$_POST['idmatapelajaran_fk'],
				]);

				if ($presensi->num_rows() > 0) {
					 $this->my_update('presensi_harian', $data, ['id_presensi_harian'=>$presensi->row_array()['id_presensi_harian']]);
				}else{
					$this->save_data('presensi_harian', $data);
				}

				
			}
		}
		echo json_encode($_POST);
	}
	public function download_file($id_kelas='', $id_tahun_ajaran ='', $id_mata_pelajaran ='', $tanggal='')
	{
		$reader = new \PhpOffice\PhpSpreadsheet\Reader\Xlsx();
		$spreadsheet = $reader->load("include/template/excel/format_presensi_harian.xlsx");
		// $spreadsheet = \PhpOffice\PhpSpreadsheet\IOFactory::load();
		$kelas 		=	$this->my_where('kelas', ['id_kelas'=>$id_kelas])->row_array();
		$mata_pelajaran 		=	$this->my_where('mata_pelajaran', ['id_mata_pelajaran'=>$id_mata_pelajaran])->row_array();
		$tahun_ajaran 		=	$this->my_where('tahun_ajaran', ['id_tahun_ajaran'=>$id_tahun_ajaran])->row_array();
		$siswa		=	$this->my_where('siswa', ['idkelas_fk'=>$id_kelas])->result_array();
		//change it
		$sheet = $spreadsheet->getActiveSheet();
		$sheet->setCellValue('A9', $mata_pelajaran['mata_pelajaran']);
		$sheet->setCellValue('D9', $tanggal);
		$sheet->setCellValue('A10', $kelas['kelas']);
		$sheet->setCellValue('D10', base64_encode($mata_pelajaran['id_mata_pelajaran']));
		foreach ($siswa as $key => $value) {
			$cek = $this->my_where('presensi_harian', [
					'idsiswa_fk' => $value['id_siswa'],
					'idkelas_fk' => $id_kelas,
					'tanggal'				=>	$tanggal,
					'idtahunajaran_fk' 		=> $id_tahun_ajaran,
					'idmatapelajaran_fk' 	=> 	$id_mata_pelajaran,
				]);



			
			$sheet->setCellValue('B'.($key+14), $value['nama']);
			$sheet->setCellValue('C'.($key+14), (($cek->num_rows() > 0) ? $cek->row_array()['presensi'] : ''));
			$sheet->getStyle('D'.($key+14))->getProtection()->setLocked(\PhpOffice\PhpSpreadsheet\Style\Protection::PROTECTION_PROTECTED);
			$sheet->setCellValue('D'.($key+14), $value['id_siswa']);
		}
		

		//write it again to Filesystem with the same name (=replace)
		$writer = new Xlsx($spreadsheet);
		$fileName = "presensi_harian_KELAS_".$kelas['kelas']."_TAHUN_AJARAN_".$tahun_ajaran['tahun_ajaran'].$tahun_ajaran['semester'].".xlsx";
		header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment; filename="'. urlencode($fileName).'"');
        $writer->save('php://output');
	}

	public function impor_presensi_rapor()
	{
		$file_mimes = array('application/octet-stream', 'application/vnd.ms-excel', 'application/x-csv', 'text/x-csv', 'text/csv', 'application/csv', 'application/excel', 'application/vnd.msexcel', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
 
		if(isset($_FILES['file_upload']['name']) && in_array($_FILES['file_upload']['type'], $file_mimes)) {
		 	
		 	$kelas 		=	$this->my_where('kelas', ['id_kelas'=>$_POST['idkelas_fk']])->row_array();
			$tahun_ajaran 		=	$this->my_where('tahun_ajaran', ['id_tahun_ajaran'=>$_POST['idtahunajaran_fk']])->row_array();
			$siswa		=	$this->my_where('siswa', ['idkelas_fk'=>$_POST['idkelas_fk']])->result_array();
		    $arr_file = explode('.', $_FILES['file_upload']['name']);
		    $extension = end($arr_file);
		 
		    if($extension == 'csv'){
                    $reader = new \PhpOffice\PhpSpreadsheet\Reader\Csv();
                } elseif($extension == 'xlsx') {
                    $reader = new \PhpOffice\PhpSpreadsheet\Reader\Xlsx();
                } else {
                    $reader = new \PhpOffice\PhpSpreadsheet\Reader\Xls();
            }
		 
		    $spreadsheet = $reader->load($_FILES['file_upload']['tmp_name']);
		    $send = [];
		    $sheetData = $spreadsheet->getActiveSheet();
			
			foreach ($siswa as $key => $value) {
				// cek
				$cek = $this->my_where('presensi_harian', [
					'idsiswa_fk' => $value['id_siswa'],
					'idkelas_fk' => $_POST['idkelas_fk'],
					'tanggal'				=>	$_POST['tanggal'],
					'idtahunajaran_fk' 		=>  $_POST['idtahunajaran_fk'],
					'idmatapelajaran_fk' 	=> 	$_POST['idmatapelajaran_fk'],
				]);
				
				$data_set = [
					'idmatapelajaran_fk' 	=> 	$_POST['idmatapelajaran_fk'],
					'idsiswa_fk'			=>	$sheetData->getCell('d'.($key+14))->getValue(),
					'presensi'				=>	(!empty($sheetData->getCell('C'.($key+14))->getValue())) ? $sheetData->getCell('C'.($key+14))->getValue() : "",
					'keterangan'			=>	"",
					'tanggal'				=>	$_POST['tanggal'],
					'idtahunajaran_fk'		=>	$_POST['idtahunajaran_fk'],
					'idkelas_fk'			=>	$_POST['idkelas_fk'],
				];

				if ($cek->num_rows() > 0) {
					$this->my_update('presensi_harian', $data_set, ['idsiswa_fk'=>$sheetData->getCell('d'.($key+14))->getValue()]);
				}else{
					$send [] = $data_set;
				}
				


				
			}
			if (count($send) > 0) {
				$this->save_data_batch('presensi_harian', $send);
			}
		    echo json_encode($send);
		}
	}

}