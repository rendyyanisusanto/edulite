<?php

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
defined('BASEPATH') OR exit('No direct script access allowed');
class Uts extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman uts',
			'table'				=>	'uts',
			'column'			=>	[ 'uts'],
			'column_order'		=>	[ 'id_uts','uts'],
			'column_search'		=>	[ 'id_uts','uts'],
			'order'				=>	['id_uts'	=>	'DESC'],
			'id'				=>	'id_uts'
	];

	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['kelas']		=	$this->my_where('kelas',[])->result_array();
		$data['guru']		=	$this->my_where('guru', ['id_guru'=>$data['account']['anggota_id']])->row_array();
		$data['mata_pelajaran']		=	$this->my_where('mata_pelajaran',[])->result_array();
		$data['jam']		=	$this->my_where('jam',[])->result_array();
		$data['dt_guru']	=	$this->get_guru();
		$data['mapel'] 		= 	$this->my_where('v_guru_mapel', ['id_guru'=>$data['account']['anggota_id']])->result_array();
		$data['view_mapel']	= [];
		foreach ($data['dt_guru']['mapel'] as $key => $value) {
			$data['view_mapel'][] = [
				'mapel' 			=>	$value,
				'input_nilai_pts'	=>	$this->my_where('input_nilai_pts', [
					'idmatapelajaran_fk'		=>	$value['id_mata_pelajaran'],
					'idkelas_fk'				=>	$value['idkelas_fk'],
					'idtahunajaran_fk'			=>	$value['id_tahun_ajaran'],
					'idguru_fk'					=>	$data['account']['anggota_id'],
				]
				)->num_rows(),
				'input_nilai_pas'	=>	$this->my_where('input_nilai_pas', [
					'idmatapelajaran_fk'		=>	$value['id_mata_pelajaran'],
					'idkelas_fk'				=>	$value['idkelas_fk'],
					'idtahunajaran_fk'			=>	$value['id_tahun_ajaran'],
					'idguru_fk'					=>	$data['account']['anggota_id'],
				]
				)->num_rows(),
				'input_nilai_pengetahuan'	=>	$this->my_where('input_nilai_pengetahuan', [
					'idmatapelajaran_fk'		=>	$value['id_mata_pelajaran'],
					'idkelas_fk'				=>	$value['idkelas_fk'],
					'idtahunajaran_fk'			=>	$value['id_tahun_ajaran'],
					'idguru_fk'					=>	$data['account']['anggota_id'],
				]
				)->num_rows(),
				'input_nilai_keterampilan'	=>	$this->my_where('input_nilai_keterampilan', [
					'idmatapelajaran_fk'		=>	$value['id_mata_pelajaran'],
					'idkelas_fk'				=>	$value['idkelas_fk'],
					'idtahunajaran_fk'			=>	$value['id_tahun_ajaran'],
					'idguru_fk'					=>	$data['account']['anggota_id'],
				]
				)->num_rows(),
				'cek_kd'					=>	$this->cek_kd_mapel($value['idkelas_fk'],$value['id_mata_pelajaran'])
			];
		}
		$this->my_view(['role/guru/page/uts/index_page/index','role/guru/page/uts/index_page/js'],$data);
	}

	public function input_nilai_pts($id_kelas='', $id_mata_pelajaran='', $id_tahun_ajaran ='')
	{
		if ($id_kelas !== '' && $id_mata_pelajaran !== '' && $id_tahun_ajaran !=='') {
			$data['account']	=	$this->get_user_account();
			$data['param'] 		= 	$this->arr;
			$data['kelas']		=	$this->my_where('kelas', ['id_kelas'=>$id_kelas])->row_array();
			$data['guru']		=	$this->my_where('guru', ['id_guru'=>$data['account']['anggota_id']])->row_array();
			$data['mata_pelajaran']		=	$this->my_where('mata_pelajaran', ['id_mata_pelajaran'=>$id_mata_pelajaran])->row_array();
			$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', ['id_tahun_ajaran'=>$id_tahun_ajaran])->row_array();
			$data['siswa']		=	$this->my_where('siswa', ['idkelas_fk'=>$id_kelas])->result_array();

			$input_nilai_pts	=	$this->my_where('input_nilai_pts', [
					'idmatapelajaran_fk'		=>	$id_mata_pelajaran,
					'idkelas_fk'				=>	$id_kelas,
					'idtahunajaran_fk'			=>	$id_tahun_ajaran,
					'idguru_fk'					=>	$data['account']['anggota_id'],
				]
				);

			if ($input_nilai_pts->num_rows() > 0) {
				$arrSiswa 	= [];
				$qnilai 	= $input_nilai_pts -> row_array();
				foreach ($data['siswa'] as $key => $value) {
					$nilai_pts 	= $this->my_where('nilai_pts', ['idinputnilaipts_fk'=>$qnilai['id_input_nilai_pts'], 'idsiswa_fk'=>$value['id_siswa']])->row_array();
					$arrSiswa[] = [
						'nama' => $value['nama'],
						'id_siswa'=> $value['id_siswa'],
						'nilai_pts'=>$nilai_pts['nilai']
					];
				}
				$data['siswa'] = $arrSiswa;
			}
			$this->my_view(['role/guru/page/uts/input_nilai/index','role/guru/page/uts/input_nilai/js'],$data);
		}
	}
	public function simpan_pts()
	{
		$data_set = $_POST;
		$data_add_to_db = [];
		$trans_code = rand(0,99999).rand(0,99999);
		$data_input_nilai = [
			'idguru_fk' 			=>	$data_set['idguru_fk'],
			'idmatapelajaran_fk'	=>	$data_set['idmatapelajaran_fk'],
			'idtahunajaran_fk'		=>	$data_set['idtahunajaran_fk'],
			'idkelas_fk'			=>	$data_set['idkelas_fk'],
			'trans_code'			=>	$trans_code
		];
		$this->save_data('input_nilai_pts', $data_input_nilai);

		$input_nilai_pts_get = $this->my_where('input_nilai_pts', $data_input_nilai)->row_array();
		foreach ($data_set['data'] as $key => $value) {
			if (!empty($value['idsiswa_fk'])) {
				$data_add_to_db[] = [
					'idsiswa_fk' 			=> $value['idsiswa_fk'],
					'nilai'					=>	(!empty($value['nilai'])) ? $value['nilai'] : 0,
					'trans_code'			=>	$key,
					'idinputnilaipts_fk'	=>	$input_nilai_pts_get['id_input_nilai_pts']
				];
			}
		}
		$this->save_data_batch('nilai_pts', $data_add_to_db);

		echo json_encode($_POST);
	}

	public function import_pts()
	{
		$file_mimes = array('application/octet-stream', 'application/vnd.ms-excel', 'application/x-csv', 'text/x-csv', 'text/csv', 'application/csv', 'application/excel', 'application/vnd.msexcel', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
 
		if(isset($_FILES['file_upload']['name']) && in_array($_FILES['file_upload']['type'], $file_mimes)) {
		 	
		 	$kelas 		=	$this->my_where('kelas', ['id_kelas'=>$_POST['idkelas_fk']])->row_array();
			$tahun_ajaran 		=	$this->my_where('tahun_ajaran', ['id_tahun_ajaran'=>$_POST['idtahunajaran_fk']])->row_array();
			$mapel 		=	$this->my_where('mata_pelajaran', ['id_mata_pelajaran'=>$_POST['idmatapelajaran_fk']])->row_array();
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
			
			$data_set = $_POST;
			$trans_code = rand(0,99999).rand(0,99999);
			$data_input_nilai = [
				'idguru_fk' 			=>	$data_set['idguru_fk'],
				'idmatapelajaran_fk'	=>	$data_set['idmatapelajaran_fk'],
				'idtahunajaran_fk'		=>	$data_set['idtahunajaran_fk'],
				'idkelas_fk'			=>	$data_set['idkelas_fk'],
				'trans_code'			=>	$trans_code
			];
			$this->save_data('input_nilai_pts', $data_input_nilai);

			$input_nilai_pts_get = $this->my_where('input_nilai_pts', $data_input_nilai)->row_array();

			foreach ($siswa as $key => $value) {
				$send [] = [
					'idsiswa_fk' 			=> $sheetData->getCell('D'.($key+14))->getValue(),
					'nilai'					=>	(!empty($sheetData->getCell('C'.($key+14))->getValue())) ? $sheetData->getCell('C'.($key+14))->getValue() : 0,
					'trans_code'			=>	$key,
					'idinputnilaipts_fk'	=>	$input_nilai_pts_get['id_input_nilai_pts']
				];
				
			}

			$this->save_data_batch('nilai_pts', $send);
		    echo json_encode($send);
		}
	}
	public function download_file_pts($id_kelas='', $id_mata_pelajaran='', $id_tahun_ajaran ='')
	{
		$reader = new \PhpOffice\PhpSpreadsheet\Reader\Xlsx();
		$spreadsheet = $reader->load("include/template/excel/format_nilai_pts.xlsx");
		// $spreadsheet = \PhpOffice\PhpSpreadsheet\IOFactory::load();
		$kelas 		=	$this->my_where('kelas', ['id_kelas'=>$id_kelas])->row_array();
		$tahun_ajaran 		=	$this->my_where('tahun_ajaran', ['id_tahun_ajaran'=>$id_tahun_ajaran])->row_array();
		$mapel 		=	$this->my_where('mata_pelajaran', ['id_mata_pelajaran'=>$id_mata_pelajaran])->row_array();
		$siswa		=	$this->my_where('siswa', ['idkelas_fk'=>$id_kelas])->result_array();
		//change it
		$sheet = $spreadsheet->getActiveSheet();
		$sheet->setCellValue('A10', $kelas['kelas']);
		$sheet->setCellValue('E10', $kelas['kelas']);
		foreach ($siswa as $key => $value) {
			
			$sheet->setCellValue('B'.($key+14), $value['nama']);
			$spreadsheet->getActiveSheet()->getStyle('D'.($key+14))->getFont()->getColor()->setARGB(\PhpOffice\PhpSpreadsheet\Style\Color::COLOR_RED);
			$sheet->getStyle('D'.($key+14))->getProtection()->setLocked(\PhpOffice\PhpSpreadsheet\Style\Protection::PROTECTION_PROTECTED);
			$sheet->setCellValue('D'.($key+14), $value['id_siswa']);
		}
		

		//write it again to Filesystem with the same name (=replace)
		$writer = new Xlsx($spreadsheet);
		$fileName = "PTS_KELAS_".$kelas['kelas']."_MAPEL_".$mapel['mata_pelajaran']."_TAHUN_AJARAN_".$tahun_ajaran['tahun_ajaran'].$tahun_ajaran['semester'].".xlsx";
		header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment; filename="'. urlencode($fileName).'"');
        $writer->save('php://output');
	}
	

}