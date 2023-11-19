<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class event extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman event',
			'table'				=>	'event',
			'column'			=>	['kode_arsip','pengirim','tanggal_surat','perihal','no_surat'],
			'column_order'		=>	[ 'id_event','kode_arsip','pengirim','tanggal_surat','perihal','no_surat'],
			'column_search'		=>	[ 'id_event','kode_arsip','pengirim','tanggal_surat','perihal','no_surat'],
			'order'				=>	['id_event'	=>	'DESC'],
			'id'				=>	'id_event'
	];

	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/BK/page/event/index_page/index','role/BK/page/event/index_page/js'],$data);
	}

	function aspirasi(){
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['guru']		=	$this->my_where('guru', ['is_active'=>1])->result_array();
		$this->my_view(['role/siswa/page/event/aspirasi/index','role/siswa/page/event/aspirasi/js'],$data);
	}

	function get_ev_guru(){
		$id = $_POST['id'];
		$data['guru']	=	$this->my_where('guru', ['id_guru'=>$id])->row_array();
		$this->my_view(['role/siswa/page/event/aspirasi/ev_page'],$data);
	}
	
	
}