<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class Uts extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman siswa_kelas',
			'table'				=>	'siswa_kelas',
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
		$data['kelas']		=	$this->my_where('kelas',[])->result_array();
		$data['guru']		=	$this->my_where('guru', ['id_guru'=>$data['account']['anggota_id']])->row_array();
		$data['mata_pelajaran']		=	$this->my_where('mata_pelajaran',[])->result_array();
		$data['jam']		=	$this->my_where('jam',[])->result_array();
		$data['dt_guru']	=	$this->get_guru();
		$data['mapel'] 		= 	$this->my_where('v_guru_mapel', ['id_guru'=>$data['account']['anggota_id']])->result_array();
		$this->my_view(['role/guru/page/uts/index_page/index','role/guru/page/uts/index_page/js'],$data);
	}

	public function input_nilai($id_kelas='', $id_mata_pelajaran='')
	{
		if ($id_kelas !== '' && $id_mata_pelajaran !== '') {

			$data['account']	=	$this->get_user_account();
			$data['param'] 		= 	$this->arr;
			$data['kelas']		=	$this->my_where('kelas', ['id_kelas'=>$id_kelas])->row_array();
			$data['siswa']		=	$this->my_where('siswa', ['idkelas_fk'=>$id_kelas])->result_array();
			$this->my_view(['role/guru/page/uts/input_nilai/index','role/guru/page/uts/input_nilai/js'],$data);
		}
	}

}