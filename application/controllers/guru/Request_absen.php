<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class request_absen extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman request_absen',
			'table'				=>	'request_absen',
			'column'			=>	['bulan','tahun', 'keterangan'],
			'column_order'		=>	[ 'id_request_absen','bulan','tahun', 'keterangan'],
			'column_search'		=>	[ 'id_request_absen','bulan','tahun', 'keterangan'],
			'order'				=>	['id_request_absen'	=>	'DESC'],
			'id'				=>	'id_request_absen',
			'parents_link'		=>	'role/guru/page/request_absen'
	];

	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['guru']		=	$this->get_guru();
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', [])->result_array();
		$data['request_absen']	=	$this->db->query('select * from request_absen where idguru_fk='.$data['guru']['guru']['id_guru'].' limit 10')->result_array();

 		if ($this->agent->is_mobile()) {
 			$this->my_view(['role/guru/page_mobile/request_absen/index_page/index','role/guru/page_mobile/request_absen/index_page/js'],$data);
 		}else{
 			$this->my_view(['role/guru/page/request_absen/index_page/index','role/guru/page/request_absen/index_page/js'],$data);
 		}
		
	}
	public function add_page()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['guru']		=	$this->get_guru();
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', [])->result_array();
	
 		if ($this->agent->is_mobile()) {
 			$this->my_view(['role/guru/page_mobile/request_absen/add_page/index','role/guru/page_mobile/request_absen/add_page/js'],$data);
 		}else{
 			$this->my_view(['role/guru/page/request_absen/add_page/index','role/guru/page/request_absen/add_page/js'],$data);
 		}
		
	}

	function get_data_request(){
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['guru']		=	$this->get_guru();
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', [])->result_array();
		$data['request_absen']	=	$this->db->query('select * from request_absen where idguru_fk='.$data['guru']['guru']['id_guru'].' order by id_request_absen desc limit 10')->result_array();
		$this->my_view(['role/guru/page_mobile/request_absen/index_page/get_data'],$data);
	}

	public function simpan_data()
	{	
		$akun = $this->get_user_account();

		$foto = $this->save_media([
			'path'	=>	"./include/media/foto_request_absen/",
			'filename' => 'foto',
		]);
		$data = [
			'idguru_fk'			=>	$akun['anggota_id'],
			'tanggal'			=>	$_POST['tanggal'],
			'status_request'	=>	$_POST['status_request'],
			'jam_masuk'			=>	$_POST['jam_masuk'],
			'jam_pulang'		=>	$_POST['jam_pulang'],
			'foto'				=>	((isset($foto)) ? $foto['file_name'] : ''),
			'keterangan'		=>	$_POST['keterangan']
		];
		if ($this->save_data('request_absen', $data)) {
			$this->get_data();
		}	else 	{
			echo "error";
		}
	}

}