<?php

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
defined('BASEPATH') OR exit('No direct script access allowed');
class nilai extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman nilai',
			'table'				=>	'nilai',
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
		$this->my_view(['role/guru/page/uts/index_page/index','role/guru/page/uts/index_page/js'],$data);
	}
	public function import_all($id_kelas='', $id_mata_pelajaran='', $id_tahun_ajaran ='')
	{
		if ($id_kelas !== '' && $id_mata_pelajaran !== '' && $id_tahun_ajaran !=='') {
			$data['account']	=	$this->get_user_account();
			$data['param'] 		= 	$this->arr;
			$data['kelas']		=	$this->my_where('kelas', ['id_kelas'=>$id_kelas])->row_array();
			$data['guru']		=	$this->my_where('guru', ['id_guru'=>$data['account']['anggota_id']])->row_array();
			$data['mata_pelajaran']		=	$this->my_where('mata_pelajaran', ['id_mata_pelajaran'=>$id_mata_pelajaran])->row_array();
			$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', ['id_tahun_ajaran'=>$id_tahun_ajaran])->row_array();
			$data['siswa']		=	$this->my_where('siswa', ['idkelas_fk'=>$id_kelas])->result_array();
			$data['jenis_nilai']		=	$this->my_where('jenis_pengetahuan', [])->result_array();
			
			$this->my_view(['role/guru/page/nilai/input_all/index','role/guru/page/nilai/input_all/js'],$data);
		}
	}
	public function cek_nilai($id_kelas='', $id_mata_pelajaran='', $id_tahun_ajaran ='')
	{
		if ($id_kelas !== '' && $id_mata_pelajaran !== '' && $id_tahun_ajaran !=='') {
			$data['account']	=	$this->get_user_account();
			$data['param'] 		= 	$this->arr;
			$data['kelas']		=	$this->my_where('kelas', ['id_kelas'=>$id_kelas])->row_array();
			$data['guru']		=	$this->my_where('guru', ['id_guru'=>$data['account']['anggota_id']])->row_array();
			$data['mata_pelajaran']		=	$this->my_where('mata_pelajaran', ['id_mata_pelajaran'=>$id_mata_pelajaran])->row_array();
			$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', ['id_tahun_ajaran'=>$id_tahun_ajaran])->row_array();
			$data['siswa']		=	$this->my_where('siswa', ['idkelas_fk'=>$id_kelas])->result_array();
			$data['jenis_nilai']		=	$this->my_where('jenis_pengetahuan', [])->result_array();
			$input_nilai_pas	=	$this->my_where('input_nilai_pas', [
					'idmatapelajaran_fk'		=>	$id_mata_pelajaran,
					'idkelas_fk'				=>	$id_kelas,
					'idtahunajaran_fk'			=>	$id_tahun_ajaran,
					'idguru_fk'					=>	$data['account']['anggota_id'],
				]
			);
			$input_nilai_pts	=	$this->my_where('input_nilai_pts', [
					'idmatapelajaran_fk'		=>	$id_mata_pelajaran,
					'idkelas_fk'				=>	$id_kelas,
					'idtahunajaran_fk'			=>	$id_tahun_ajaran,
					'idguru_fk'					=>	$data['account']['anggota_id'],
				]
			);
			$input_nilai_pengetahuan	=	$this->my_where('input_nilai_pengetahuan', [
					'idmatapelajaran_fk'		=>	$id_mata_pelajaran,
					'idkelas_fk'				=>	$id_kelas,
					'idtahunajaran_fk'			=>	$id_tahun_ajaran,
					'idguru_fk'					=>	$data['account']['anggota_id'],
				]
			);
			$input_nilai_keterampilan	=	$this->my_where('input_nilai_keterampilan', [
					'idmatapelajaran_fk'		=>	$id_mata_pelajaran,
					'idkelas_fk'				=>	$id_kelas,
					'idtahunajaran_fk'			=>	$id_tahun_ajaran,
					'idguru_fk'					=>	$data['account']['anggota_id'],
				]
			);

				$arrSiswa 	= [];
				$qnilai 	= $input_nilai_pas -> row_array();
				$qnilaip 	= $input_nilai_pengetahuan -> row_array();
				$qnilaik 	= $input_nilai_keterampilan -> row_array();
				$qnilaipts 	= $input_nilai_pts -> row_array();
				foreach ($data['siswa'] as $key => $value) {
					$nilai_pas 	= (!empty($qnilai)) ?$this->my_where('nilai_pas', ['idinputnilaipas_fk'=>$qnilai['id_input_nilai_pas'], 'idsiswa_fk'=>$value['id_siswa']])->row_array():[];
					$nilai_pts 	= (!empty($qnilaipts)) ? $this->my_where('nilai_pas', ['idinputnilaipts_fk'=>$qnilai['id_input_nilai_pts'], 'idsiswa_fk'=>$value['id_siswa']])->row_array() : [];
					$nilai_pengetahuan = (!empty($qnilaip)) ? $this->db->query("select avg(nilai) as nilai from nilai_pengetahuan where idinputnilaipengetahuan_fk=".$qnilaip['id_input_nilai_pengetahuan']." and idsiswa_fk=".$value['id_siswa'])->row_array():[];
					$nilai_keterampilan = (!empty($qnilaik)) ? $this->db->query("select avg(nilai) as nilai from nilai_keterampilan where idinputnilaiketerampilan_fk=".$qnilaik['id_input_nilai_keterampilan']." and idsiswa_fk=".$value['id_siswa'])->row_array():[];
					$arrSiswa[] = [
						'nama' => $value['nama'],
						'id_siswa'=> $value['id_siswa'],
						'nilai_pts'=>(!empty($nilai_pts)) ? $nilai_pts['nilai'] : 0,
						'nilai_pas'=>((!empty($nilai_pas)) ? $nilai_pas['nilai'] : 0),
						'nilai_pengetahuan'=>((!empty($nilai_pengetahuan)) ? number_format($nilai_pengetahuan['nilai']) : 0),
						'nilai_keterampilan'=>((!empty($nilai_keterampilan)) ? number_format($nilai_keterampilan['nilai']) : 0),
					];
				}
				$data['siswa'] = $arrSiswa;
			
			$this->my_view(['role/guru/page/nilai/cek_nilai/index','role/guru/page/nilai/cek_nilai/js'],$data);
		}
	}
	public function input_nilai_harian($id_kelas='', $id_mata_pelajaran='', $id_tahun_ajaran ='')
	{
		if ($id_kelas !== '' && $id_mata_pelajaran !== '' && $id_tahun_ajaran !=='') {
			$data['account']	=	$this->get_user_account();
			$data['param'] 		= 	$this->arr;
			$data['kelas']		=	$this->my_where('kelas', ['id_kelas'=>$id_kelas])->row_array();
			$data['guru']		=	$this->my_where('guru', ['id_guru'=>$data['account']['anggota_id']])->row_array();
			$data['mata_pelajaran']		=	$this->my_where('mata_pelajaran', ['id_mata_pelajaran'=>$id_mata_pelajaran])->row_array();
			$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', ['id_tahun_ajaran'=>$id_tahun_ajaran])->row_array();
			$data['siswa']		=	$this->my_where('siswa', ['idkelas_fk'=>$id_kelas])->result_array();
			$data['jenis_nilai']		=	$this->my_where('jenis_pengetahuan', [])->result_array();
			
			$this->my_view(['role/guru/page/nilai/input_nilai_harian/index','role/guru/page/nilai/input_nilai_harian/js'],$data);
		}
	}
	public function input_nilai_keterampilan($id_kelas='', $id_mata_pelajaran='', $id_tahun_ajaran ='')
	{
		if ($id_kelas !== '' && $id_mata_pelajaran !== '' && $id_tahun_ajaran !=='') {
			$data['account']	=	$this->get_user_account();
			$data['param'] 		= 	$this->arr;
			$data['kelas']		=	$this->my_where('kelas', ['id_kelas'=>$id_kelas])->row_array();
			$data['guru']		=	$this->my_where('guru', ['id_guru'=>$data['account']['anggota_id']])->row_array();
			$data['mata_pelajaran']		=	$this->my_where('mata_pelajaran', ['id_mata_pelajaran'=>$id_mata_pelajaran])->row_array();
			$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', ['id_tahun_ajaran'=>$id_tahun_ajaran])->row_array();
			$data['siswa']		=	$this->my_where('siswa', ['idkelas_fk'=>$id_kelas])->result_array();
			
			$data['jenis_nilai']		=	$this->my_where('jenis_keterampilan', [])->result_array();
			$this->my_view(['role/guru/page/nilai/input_nilai_keterampilan/index','role/guru/page/nilai/input_nilai_keterampilan/js'],$data);
		}
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
			
			$this->my_view(['role/guru/page/uts/input_nilai/index','role/guru/page/uts/input_nilai/js'],$data);
		}
	}
	public function input_nilai_pas($id_kelas='', $id_mata_pelajaran='', $id_tahun_ajaran ='')
	{
		if ($id_kelas !== '' && $id_mata_pelajaran !== '' && $id_tahun_ajaran !=='') {
			$data['account']	=	$this->get_user_account();
			$data['param'] 		= 	$this->arr;
			$data['kelas']		=	$this->my_where('kelas', ['id_kelas'=>$id_kelas])->row_array();
			$data['guru']		=	$this->my_where('guru', ['id_guru'=>$data['account']['anggota_id']])->row_array();
			$data['mata_pelajaran']		=	$this->my_where('mata_pelajaran', ['id_mata_pelajaran'=>$id_mata_pelajaran])->row_array();
			$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', ['id_tahun_ajaran'=>$id_tahun_ajaran])->row_array();
			$data['siswa']		=	$this->my_where('siswa', ['idkelas_fk'=>$id_kelas])->result_array();
			$input_nilai_pas	=	$this->my_where('input_nilai_pas', [
					'idmatapelajaran_fk'		=>	$id_mata_pelajaran,
					'idkelas_fk'				=>	$id_kelas,
					'idtahunajaran_fk'			=>	$id_tahun_ajaran,
					'idguru_fk'					=>	$data['account']['anggota_id'],
				]
				);

			if ($input_nilai_pas->num_rows() > 0) {
				$arrSiswa 	= [];
				$qnilai 	= $input_nilai_pas -> row_array();
				foreach ($data['siswa'] as $key => $value) {
					$nilai_pas 	= $this->my_where('nilai_pas', ['idinputnilaipas_fk'=>$qnilai['id_input_nilai_pas'], 'idsiswa_fk'=>$value['id_siswa']])->row_array();
					$arrSiswa[] = [
						'nama' => $value['nama'],
						'id_siswa'=> $value['id_siswa'],
						'nilai_pas'=>$nilai_pas['nilai']
					];
				}
				$data['siswa'] = $arrSiswa;
			}
			$this->my_view(['role/guru/page/nilai/input_nilai_pas/index','role/guru/page/nilai/input_nilai_pas/js'],$data);
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

	public function simpan_pas()
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
		$this->save_data('input_nilai_pas', $data_input_nilai);

		$input_nilai_pts_get = $this->my_where('input_nilai_ptas', $data_input_nilai)->row_array();
		foreach ($data_set['data'] as $key => $value) {
			if (!empty($value['idsiswa_fk'])) {
				$data_add_to_db[] = [
					'idsiswa_fk' 			=> $value['idsiswa_fk'],
					'nilai'					=>	(!empty($value['nilai'])) ? $value['nilai'] : 0,
					'trans_code'			=>	$key,
					'idinputnilaipas_fk'	=>	$input_nilai_pts_get['id_input_nilai_pas']
				];
			}
		}
		$this->save_data_batch('nilai_pas', $data_add_to_db);

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

	public function import_pas()
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
				'idkelas_fk'			=>	$data_set['idkelas_fk'],
				'idtahunajaran_fk'		=>	$data_set['idtahunajaran_fk'],
				'trans_code'			=>	$trans_code
			];
			$this->save_data('input_nilai_pas', $data_input_nilai);

			$input_nilai_pts_get = $this->my_where('input_nilai_pas', $data_input_nilai)->row_array();

			foreach ($siswa as $key => $value) {
				$send [] = [
					'idsiswa_fk' 			=> $sheetData->getCell('D'.($key+14))->getValue(),
					'nilai'					=>	(!empty($sheetData->getCell('C'.($key+14))->getValue())) ? $sheetData->getCell('C'.($key+14))->getValue() : 0,
					'trans_code'			=>	$key,
					'idinputnilaipas_fk'	=>	$input_nilai_pts_get['id_input_nilai_pas']
				];
				
			}

			$this->save_data_batch('nilai_pas', $send);
		    echo json_encode($send);
		}
	}

	public function import_pengetahuan($id_kd)
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
				'idkelas_fk'			=>	$data_set['idkelas_fk'],
				'idtahunajaran_fk'		=>	$data_set['idtahunajaran_fk'],
				'trans_code'			=>	$trans_code,
				'idjenispengetahuan_fk' => 	$data_set['idjenispengetahuan_fk']
			];
			$this->save_data('input_nilai_pengetahuan', $data_input_nilai);

			$input_nilai_pengetahuan_get = $this->my_where('input_nilai_pengetahuan', $data_input_nilai)->row_array();

			foreach ($siswa as $key => $value) {
				$send [] = [
					'idsiswa_fk' 			=> $sheetData->getCell('D'.($key+14))->getValue(),
					'nilai'					=>	(!empty($sheetData->getCell('C'.($key+14))->getValue())) ? $sheetData->getCell('C'.($key+14))->getValue() : 0,
					'trans_code'			=>	$key,
					'idinputnilaipengetahuan_fk'	=>	$input_nilai_pengetahuan_get['id_input_nilai_pengetahuan'],
					'idkd_fk'				=> $id_kd
				];
				
			}

			$this->save_data_batch('nilai_pengetahuan', $send);
		    echo json_encode($send);
		}
	}

	public function import_keterampilan($id_kd)
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
				'idkelas_fk'			=>	$data_set['idkelas_fk'],
				'idtahunajaran_fk'		=>	$data_set['idtahunajaran_fk'],
				'idjenisketerampilan_fk' => 	$data_set['idjenisketerampilan_fk'],
				'trans_code'			=>	$trans_code
			];
			$this->save_data('input_nilai_keterampilan', $data_input_nilai);

			$input_nilai_keterampilan_get = $this->my_where('input_nilai_keterampilan', $data_input_nilai)->row_array();

			foreach ($siswa as $key => $value) {
				$send [] = [
					'idsiswa_fk' 			=> $sheetData->getCell('D'.($key+14))->getValue(),
					'nilai'					=>	(!empty($sheetData->getCell('C'.($key+14))->getValue())) ? $sheetData->getCell('C'.($key+14))->getValue() : 0,
					'trans_code'			=>	$key,
					'idinputnilaiketerampilan_fk'	=>	$input_nilai_keterampilan_get['id_input_nilai_keterampilan'],
					'idkd_fk'				=> $id_kd
				];
				
			}

			$this->save_data_batch('nilai_keterampilan', $send);
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

	public function download_file_pas($id_kelas='', $id_mata_pelajaran='', $id_tahun_ajaran ='')
	{
		$reader = new \PhpOffice\PhpSpreadsheet\Reader\Xlsx();
		$spreadsheet = $reader->load("include/template/excel/format_nilai_pas.xlsx");
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
		$fileName = "PAS_KELAS_".$kelas['kelas']."_MAPEL_".$mapel['mata_pelajaran']."_TAHUN_AJARAN_".$tahun_ajaran['tahun_ajaran'].$tahun_ajaran['semester'].".xlsx";
		header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment; filename="'. urlencode($fileName).'"');
        $writer->save('php://output');
	}

	public function download_file_all($id_kelas='', $id_mata_pelajaran='', $id_tahun_ajaran ='')
	{
		
		$data['account']	=	$this->get_user_account();
		$reader = new \PhpOffice\PhpSpreadsheet\Reader\Xlsx();
		$spreadsheet = $reader->load("include/template/excel/template_all.xlsx");
		// $spreadsheet = \PhpOffice\PhpSpreadsheet\IOFactory::load();
		$kelas 		=	$this->my_where('kelas', ['id_kelas'=>$id_kelas])->row_array();
		$tahun_ajaran 		=	$this->my_where('tahun_ajaran', ['id_tahun_ajaran'=>$id_tahun_ajaran])->row_array();
		$mapel 		=	$this->my_where('mata_pelajaran', ['id_mata_pelajaran'=>$id_mata_pelajaran])->row_array();
		$siswa		=	$this->my_where('siswa', ['idkelas_fk'=>$id_kelas])->result_array();
		//change it
		$sheet = $spreadsheet->getActiveSheet();
		$sheet->setCellValue('D5', $mapel['mata_pelajaran']);
		$sheet->setCellValue('N5', $kelas['kelas']);
		$sheet->setCellValue('D6', $tahun_ajaran['tahun_ajaran'].'/'.$tahun_ajaran['semester']);
		$sheet->mergeCells('A8:A11');
		$sheet->setCellValue('A8', 'NO');
		$sheet->mergeCells('B8:B11');
		$sheet->setCellValue('B8', 'Nama');

		// header
		$range_sheet = range('A', 'Z');
		$jenis_pengetahuan = $this->my_where('jenis_pengetahuan',[])->result_array();
		$jum = 0;
		foreach ($jenis_pengetahuan as $key => $value) {
			$kd = $this->my_where('kd', 
				[
				'idjenispenilaian_fk'=>3, 
				'idguru_fk' 			=>	$data['account']['anggota_id'],
				'idmatapelajaran_fk'	=>	$id_mata_pelajaran,
				'idkelas_fk'			=>	$id_kelas,
				'idtahunajaran_fk'		=>	$id_tahun_ajaran]);
			$jml_ans = $kd->num_rows();
			$kd_set = $kd->result_array();
			if ( $jml_ans> 0) {
				$sheet->mergeCells('C9:'.$range_sheet[(3+$jml_ans)].'9');
				$sheet->setCellValue('C9', 'BOBOT');
				$sheet->mergeCells('C10:'.$range_sheet[(3+$jml_ans)].'10');
				$sheet->setCellValue('C10', $value['jenis_pengetahuan']);

				foreach ($kd_set as $key_kd => $value_kd) {
					
				$sheet->setCellValue($range_sheet[(2+$key_kd)].'11', $value['jenis_pengetahuan']);
				}
			}

		}

		foreach ($siswa as $key => $value) {
			
			$sheet->setCellValue('B'.($key+9), $value['nama']);
			
		}
		

		//write it again to Filesystem with the same name (=replace)
		$writer = new Xlsx($spreadsheet);
		$fileName = "ALL_KELAS_".$kelas['kelas']."_MAPEL_".$mapel['mata_pelajaran']."_TAHUN_AJARAN_".$tahun_ajaran['tahun_ajaran'].$tahun_ajaran['semester'].".xlsx";
		header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment; filename="'. urlencode($fileName).'"');
        $writer->save('php://output');
	}
	public function download_file_pengetahuan($id_kelas='', $id_mata_pelajaran='', $id_tahun_ajaran ='', $id_kd = '',$id_jenis_pengetahuan='')
	{
		$reader = new \PhpOffice\PhpSpreadsheet\Reader\Xlsx();
		$spreadsheet = $reader->load("include/template/excel/format_nilai_pengetahuan.xlsx");
		// $spreadsheet = \PhpOffice\PhpSpreadsheet\IOFactory::load();
		$kelas 		=	$this->my_where('kelas', ['id_kelas'=>$id_kelas])->row_array();
		$tahun_ajaran 		=	$this->my_where('tahun_ajaran', ['id_tahun_ajaran'=>$id_tahun_ajaran])->row_array();
		$mapel 		=	$this->my_where('mata_pelajaran', ['id_mata_pelajaran'=>$id_mata_pelajaran])->row_array();
		$jenis_pengetahuan 		=	$this->my_where('jenis_pengetahuan', ['id_jenis_pengetahuan'=>$id_jenis_pengetahuan])->row_array();
		$kd 		=	$this->my_where('kd', ['id_kd'=>$id_kd])->row_array();
		$siswa		=	$this->my_where('siswa', ['idkelas_fk'=>$id_kelas])->result_array();
		//change it
		$sheet = $spreadsheet->getActiveSheet();
		$sheet->setCellValue('A10', $kelas['kelas']);
		$sheet->setCellValue('A11', $jenis_pengetahuan['jenis_pengetahuan']);
		$sheet->setCellValue('E10', $mapel['mata_pelajaran']);
		$sheet->setCellValue('E11', $kd['ringkasan']);
		foreach ($siswa as $key => $value) {
			$sheet->setCellValue('B'.($key+14), $value['nama']);
			$spreadsheet->getActiveSheet()->getStyle('D'.($key+14))->getFont()->getColor()->setARGB(\PhpOffice\PhpSpreadsheet\Style\Color::COLOR_RED);
			$sheet->getStyle('D'.($key+14))->getProtection()->setLocked(\PhpOffice\PhpSpreadsheet\Style\Protection::PROTECTION_PROTECTED);
			$sheet->setCellValue('D'.($key+14), $value['id_siswa']);
		}
		

		//write it again to Filesystem with the same name (=replace)
		$writer = new Xlsx($spreadsheet);
		$fileName = "NP_KELAS_".$kelas['kelas']."_MAPEL_".$mapel['mata_pelajaran']."_TAHUN_AJARAN_".$tahun_ajaran['tahun_ajaran'].$tahun_ajaran['semester'].".xlsx";
		header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment; filename="'. urlencode($fileName).'"');
        $writer->save('php://output');
	}
	public function download_file_keterampilan($id_kelas='', $id_mata_pelajaran='', $id_tahun_ajaran ='', $id_kd = '', $id_jenis_keterampilan='')
	{
		$reader = new \PhpOffice\PhpSpreadsheet\Reader\Xlsx();
		$spreadsheet = $reader->load("include/template/excel/format_nilai_keterampilan.xlsx");
		// $spreadsheet = \PhpOffice\PhpSpreadsheet\IOFactory::load();
		$kelas 		=	$this->my_where('kelas', ['id_kelas'=>$id_kelas])->row_array();
		$tahun_ajaran 		=	$this->my_where('tahun_ajaran', ['id_tahun_ajaran'=>$id_tahun_ajaran])->row_array();
		$mapel 		=	$this->my_where('mata_pelajaran', ['id_mata_pelajaran'=>$id_mata_pelajaran])->row_array();
		$kd 		=	$this->my_where('kd', ['id_kd'=>$id_kd])->row_array();
		$siswa		=	$this->my_where('siswa', ['idkelas_fk'=>$id_kelas])->result_array();
		$jenis_keterampilan 		=	$this->my_where('jenis_keterampilan', ['id_jenis_keterampilan'=>$id_jenis_keterampilan])->row_array();
		//change it
		$sheet = $spreadsheet->getActiveSheet();
		$sheet->setCellValue('A10', $kelas['kelas']);
		$sheet->setCellValue('E10', $mapel['mata_pelajaran']);
		$sheet->setCellValue('A11', $jenis_keterampilan['jenis_keterampilan']);
		$sheet->setCellValue('E11', $kd['ringkasan']);
		foreach ($siswa as $key => $value) {
			$sheet->setCellValue('B'.($key+14), $value['nama']);
			$spreadsheet->getActiveSheet()->getStyle('D'.($key+14))->getFont()->getColor()->setARGB(\PhpOffice\PhpSpreadsheet\Style\Color::COLOR_RED);
			$sheet->getStyle('D'.($key+14))->getProtection()->setLocked(\PhpOffice\PhpSpreadsheet\Style\Protection::PROTECTION_PROTECTED);
			$sheet->setCellValue('D'.($key+14), $value['id_siswa']);
		}
		

		//write it again to Filesystem with the same name (=replace)
		$writer = new Xlsx($spreadsheet);
		$fileName = "NK_KELAS_".$kelas['kelas']."_MAPEL_".$mapel['mata_pelajaran']."_TAHUN_AJARAN_".$tahun_ajaran['tahun_ajaran'].$tahun_ajaran['semester'].".xlsx";
		header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment; filename="'. urlencode($fileName).'"');
        $writer->save('php://output');
	}
	public function get_kd()
	{
		$searchTerm = $this->input->post('searchTerm');
      // Get users
		$guru  =	$this->get_user_account();
      	 $this->db->select('*');
      	 $this->db->where("idkelas_fk",$_POST['idkelas']);
      	 $this->db->where("idmatapelajaran_fk",$_POST['idmapel']);

      	 $this->db->where("idguru_fk",$guru['anggota_id']);
      	 $this->db->where("idjenispenilaian_fk",3);
	     $this->db->where("ringkasan like '%".$searchTerm."%' ")->limit(5);
	     $fetched_records = $this->db->get('kd');
	     $users = $fetched_records->result_array();

	     // Initialize Array with fetched data
	     $data = array();
	     foreach($users as $user){
	        $data[] = array("id"=>$user['id_kd'], "text"=>$user['ringkasan']);
	     }

      	echo json_encode($data);
	}
	public function get_kd_keterampilan()
	{
		$searchTerm = $this->input->post('searchTerm');
      // Get users
		$guru  =	$this->get_user_account();
      	 $this->db->select('*');
      	 $this->db->where("idkelas_fk",$_POST['idkelas']);
      	 $this->db->where("idmatapelajaran_fk",$_POST['idmapel']);

      	 $this->db->where("idguru_fk",$guru['anggota_id']);
      	 $this->db->where("idjenispenilaian_fk",4);
	     $this->db->where("ringkasan like '%".$searchTerm."%' ")->limit(5);
	     $fetched_records = $this->db->get('kd');
	     $users = $fetched_records->result_array();

	     // Initialize Array with fetched data
	     $data = array();
	     foreach($users as $user){
	        $data[] = array("id"=>$user['id_kd'], "text"=>$user['ringkasan']);
	     }

      	echo json_encode($data);
	}
	public function proses_nilai_harian($value='')
	{
			$data['account']	=	$this->get_user_account();
			$data['param'] 		= 	$this->arr;
			$data['kelas']		=	$this->my_where('kelas', ['id_kelas'=>$_POST['idkelas_fk']])->row_array();
			$data['guru']		=	$this->my_where('guru', ['id_guru'=>$data['account']['anggota_id']])->row_array();
			$data['mata_pelajaran']		=	$this->my_where('mata_pelajaran', ['id_mata_pelajaran'=>$_POST['idmatapelajaran_fk']])->row_array();
			$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', ['id_tahun_ajaran'=>$_POST['idtahunajaran_fk']])->row_array();
			$data['siswa']		=	$this->my_where('siswa', ['idkelas_fk'=>$_POST['idkelas_fk']])->result_array();
			$data['kd']			=	$this->my_where('kd', ['id_kd'=>$_POST['idkd_fk']])->row_array();
			$data['jenis_pengetahuan']			=	$this->my_where('jenis_pengetahuan', ['id_jenis_pengetahuan'=>$_POST['idjenispengetahuan_fk']])->row_array();
			$data['siswa_fix'] = [];
			$data_input_nilai = [
				'idguru_fk' 			=>	$data['account']['anggota_id'],
				'idmatapelajaran_fk'	=>	$_POST['idmatapelajaran_fk'],
				'idkelas_fk'			=>	$_POST['idkelas_fk'],
				'idtahunajaran_fk'		=>	$_POST['idtahunajaran_fk'],
				'idjenispengetahuan_fk' => 	$_POST['idjenispengetahuan_fk']
			];
			$input_nilai_pengetahuan_get = $this->my_where('input_nilai_pengetahuan', $data_input_nilai)->row_array();
			foreach ($data['siswa'] as $key => $value) {
				$nilai = $this->my_where("nilai_pengetahuan", ['idsiswa_fk'=>$value['id_siswa'], 'idinputnilaipengetahuan_fk'=>$input_nilai_pengetahuan_get['id_input_nilai_pengetahuan']])->row_array();
				$data['siswa_fix'][] = [
					'siswa' => $value,
					'nilai' => $nilai
				];
			}

		$this->my_view(['role/guru/page/nilai/input_nilai_harian/index_nilai_harian','role/guru/page/nilai/input_nilai_harian/js_nilai_harian'],$data);
	}

	public function proses_nilai_keterampilan($value='')
	{
			$data['account']	=	$this->get_user_account();
			$data['param'] 		= 	$this->arr;
			$data['kelas']		=	$this->my_where('kelas', ['id_kelas'=>$_POST['idkelas_fk']])->row_array();
			$data['guru']		=	$this->my_where('guru', ['id_guru'=>$data['account']['anggota_id']])->row_array();
			$data['mata_pelajaran']		=	$this->my_where('mata_pelajaran', ['id_mata_pelajaran'=>$_POST['idmatapelajaran_fk']])->row_array();
			$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', ['id_tahun_ajaran'=>$_POST['idtahunajaran_fk']])->row_array();
			$data['siswa']		=	$this->my_where('siswa', ['idkelas_fk'=>$_POST['idkelas_fk']])->result_array();
			$data['kd']			=	$this->my_where('kd', ['id_kd'=>$_POST['idkd_fk']])->row_array();
			$data['jenis_keterampilan']			=	$this->my_where('jenis_keterampilan', ['id_jenis_keterampilan'=>$_POST['idjenisketerampilan_fk']])->row_array();
			$data['siswa_fix'] = [];
			$data_input_nilai = [
				'idguru_fk' 			=>	$data['account']['anggota_id'],
				'idmatapelajaran_fk'	=>	$_POST['idmatapelajaran_fk'],
				'idkelas_fk'			=>	$_POST['idkelas_fk'],
				'idtahunajaran_fk'		=>	$_POST['idtahunajaran_fk'],
				'idjenisketerampilan_fk' => 	$_POST['idjenisketerampilan_fk'],
			];
			$input_nilai_keterampilan_get = $this->my_where('input_nilai_keterampilan', $data_input_nilai)->row_array();
			foreach ($data['siswa'] as $key => $value) {
				$nilai = $this->my_where("nilai_keterampilan", ['idsiswa_fk'=>$value['id_siswa'], 'idinputnilaiketerampilan_fk'=>$input_nilai_keterampilan_get['id_input_nilai_keterampilan']])->row_array();
				$data['siswa_fix'][] = [
					'siswa' => $value,
					'nilai' => $nilai
				];
			}
		$this->my_view(['role/guru/page/nilai/input_nilai_keterampilan/index_nilai_keterampilan','role/guru/page/nilai/input_nilai_keterampilan/js_nilai_keterampilan'],$data);
	}
}