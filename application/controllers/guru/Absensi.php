<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class absensi extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman siswa_kelas',
			'table'				=>	'absensi',
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
		$data['dt_guru']	=	$this->get_guru();
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', [])->result_array();
		$data['mapel'] 		= 	$this->my_where('v_guru_mapel', ['id_guru'=>$data['account']['anggota_id']])->result_array();
		$this->my_view(['role/guru/page/absensi/index_page/index','role/guru/page/absensi/index_page/js'],$data);
	}
	public function proses_absensi($value='')
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', ['id_tahun_ajaran'=>$_POST['idtahunajaran_fk']])->row_array();
		$siswa		=	$this->my_where('siswa', ['idkelas_fk'=>$_POST['idkelas_fk']])->result_array();
		$data['kelas']		=	$this->my_where('kelas', ['id_kelas'=>$_POST['idkelas_fk']])->row_array();
		$data['siswa'] = [];
		foreach ($siswa as $key => $value) {
			$presensi = $this->my_where('presensi_rapor', [
				'idsiswa_fk' => $value['id_siswa'],
				'idtahunajaran_fk'=>$_POST['idtahunajaran_fk'],
				'idkelas_fk'=>$_POST['idkelas_fk']
			])->row_array();

			$data['siswa'][] = [
				'siswa' => $value,
				'presensi' => !empty($presensi) ? $presensi : []
			];
 		}
		$this->my_view(['role/guru/page/absensi/index_page/list_siswa'],$data);
	}
	public function download_file($id_kelas='', $id_tahun_ajaran ='')
	{
		$reader = new \PhpOffice\PhpSpreadsheet\Reader\Xlsx();
		$spreadsheet = $reader->load("include/template/excel/format_absensi.xlsx");
		// $spreadsheet = \PhpOffice\PhpSpreadsheet\IOFactory::load();
		$kelas 		=	$this->my_where('kelas', ['id_kelas'=>$id_kelas])->row_array();
		$tahun_ajaran 		=	$this->my_where('tahun_ajaran', ['id_tahun_ajaran'=>$id_tahun_ajaran])->row_array();
		$siswa		=	$this->my_where('siswa', ['idkelas_fk'=>$id_kelas])->result_array();
		//change it
		$sheet = $spreadsheet->getActiveSheet();
		$sheet->setCellValue('A10', $kelas['kelas']);
		foreach ($siswa as $key => $value) {
			$cek = $this->my_where('presensi_rapor', [
					'idsiswa_fk' => $value['id_siswa'],
					'idkelas_fk' => $id_kelas,
					'idtahunajaran_fk' => $id_tahun_ajaran
				]);
			
			$sheet->setCellValue('B'.($key+14), $value['nama']);
			$sheet->setCellValue('C'.($key+14), (($cek->num_rows() > 0) ? $cek->row_array()['sakit'] : ''));
			$sheet->setCellValue('D'.($key+14), (($cek->num_rows() > 0) ? $cek->row_array()['ijin'] : ''));
			$sheet->setCellValue('E'.($key+14), (($cek->num_rows() > 0) ? $cek->row_array()['alpha'] : ''));
			$spreadsheet->getActiveSheet()->getStyle('D'.($key+14))->getFont()->getColor()->setARGB(\PhpOffice\PhpSpreadsheet\Style\Color::COLOR_RED);
			$sheet->getStyle('F'.($key+14))->getProtection()->setLocked(\PhpOffice\PhpSpreadsheet\Style\Protection::PROTECTION_PROTECTED);
			$sheet->setCellValue('F'.($key+14), $value['id_siswa']);
		}
		

		//write it again to Filesystem with the same name (=replace)
		$writer = new Xlsx($spreadsheet);
		$fileName = "ABSENSI_KELAS_".$kelas['kelas']."_TAHUN_AJARAN_".$tahun_ajaran['tahun_ajaran'].$tahun_ajaran['semester'].".xlsx";
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
				$cek = $this->my_where('presensi_rapor', [
					'idsiswa_fk' => $sheetData->getCell('F'.($key+14))->getValue(),
					'idkelas_fk' => $_POST['idkelas_fk'],
					'idtahunajaran_fk' => $_POST['idtahunajaran_fk']
				]);
				// insert
				$data_set = [
					'idsiswa_fk' 			=> $sheetData->getCell('F'.($key+14))->getValue(),
					'sakit'					=>	(!empty($sheetData->getCell('C'.($key+14))->getValue())) ? $sheetData->getCell('C'.($key+14))->getValue() : "",
					'ijin'					=>	(!empty($sheetData->getCell('D'.($key+14))->getValue())) ? $sheetData->getCell('D'.($key+14))->getValue() : "",
					'alpha'					=>	(!empty($sheetData->getCell('E'.($key+14))->getValue())) ? $sheetData->getCell('E'.($key+14))->getValue() : "",
					'idkelas_fk'			=>	$_POST['idkelas_fk'],
					'idtahunajaran_fk'		=>	$_POST['idtahunajaran_fk']
				];

				if ($cek->num_rows() > 0) {
					$this->my_update('presensi_rapor', $data_set, ['idsiswa_fk'=>$sheetData->getCell('F'.($key+14))->getValue()]);
				}else{
					$send [] = $data_set;
				}
				
				
			}
			if (count($send) > 0) {
				$this->save_data_batch('presensi_rapor', $send);
			}
		    echo json_encode($send);
		}
	}

}