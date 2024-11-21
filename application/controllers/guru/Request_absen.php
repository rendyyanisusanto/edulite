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
		$uuid = generate_uuid();
		$data = [
			'uuid'				=>  $uuid,
			'idguru_fk'			=>	$akun['anggota_id'],
			'tanggal'			=>	$_POST['tanggal'],
			'status_request'	=>	$_POST['status_request'],
			'jam_masuk'			=>	$_POST['jam_masuk'],
			'jam_pulang'		=>	$_POST['jam_pulang'],
			'foto'				=>	((isset($foto)) ? $foto['file_name'] : ''),
			'keterangan'		=>	$_POST['keterangan']
		];
		if ($this->save_data('request_absen', $data)) {

			$guru = $this->my_where('guru', ["id_guru"=>$akun['anggota_id']])->row_array();
			$dt = $this->my_where('request_absen', ['uuid'=>$uuid])->row_array();
			$msg = $requestAbsen = "Request Absen\n\n"
               . "\tNama  \t\t\t: " . str_pad($guru['nama'], 40) . "\n"
               . "\tTanggal \t\t\t: " . str_pad($_POST['tanggal'], 40) . "\n"
               . "\tJam masuk \t\t: " . str_pad($_POST['jam_masuk'], 40) . "\n"
               . "\tJam keluar \t\t: " . str_pad($_POST['jam_pulang'], 40) . "\n"
               . "\tKeterangan \t\t: " . str_pad($_POST['keterangan'], 40);

			$this->bot_wa('085894632505', $msg, 'request_absen', $dt['id_request_absen'], 'guru');
			// $this->bot_wa('085648649390', $msg);

			$this->get_data();
		}	else 	{
			echo "error";
		}
	}

}