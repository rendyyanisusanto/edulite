<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class buku_besar extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman Akun',
			'table'				=>	'akun',
			'column'			=>	[ 'no_ref', 'nama'],
			'column_order'		=>	[ 'id_akun','no_ref', 'nama'],
			'column_search'		=>	[ 'id_akun','no_ref', 'nama'],
			'order'				=>	['id_akun'	=>	'DESC'],
			'id'				=>	'id_akun'
	];

	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['param']		=	$this->arr;
		$data['akun']		=	$this->my_where('akun', [])->result_array();
		$this->my_view(['role/bendahara/page/buku_besar/index_page/index','role/bendahara/page/buku_besar/index_page/js'],$data);
	}

	function akun()
	{
		$akun = $this->db->get('akun')->result_array();
		$akun_set = [];
		$tampilkan_semua	=	(isset($_POST['semua_akun']))?1:0;
		$akun_kosong		=	(isset($_POST['akun_kosong']))?1:0;
		foreach ($akun as $key => $value) {
			if ($tampilkan_semua == 0 && !in_array($value['id_akun'], $_POST['idakun_fk'])) {continue;}
			$cek = $this->cek_jurnal_umum($value);
			if ($cek==0 && $akun_kosong == 0) {continue;}
				
				$akun_set [] = [
						'no_ref'		=>	$value['no_ref'],
						'nama'			=>	$value['nama'],
						'saldo_normal'	=>	$value['saldo_normal'],
						'jurnal_umum'	=>	$this->jurnal_umum($value)
				];
			
			
			
		}
		$data['akun']				=	$akun_set;
		// echo json_encode($data);
		$this->my_view(['role/bendahara/page/buku_besar/index_page/table'],$data);
	}
	function jurnal_umum($data){
		
		$mulai 		= 	$_POST['mulai'];
		$sampai 	= 	$_POST['sampai'];
		$send		=	[];

		$jurnal_umum	=	$this->db->where('idakun_fk', $data['id_akun'])->where('DATE(create_at) >=', date_format(date_create($mulai),"Y/m/d"))->where('DATE(create_at) <=', date_format(date_create($sampai),"Y/m/d"))->get('jurnal_umum')->result_array();
		return $jurnal_umum;
	}
	function cek_jurnal_umum($data){
		
		$mulai 		= 	$_POST['mulai'];
		$sampai 	= 	$_POST['sampai'];
		$tampilkan_semua	=	(isset($_POST['semua_akun']))?1:0;

		$send		=	[];

		$jurnal_umum	=	$this->db->where('idakun_fk', $data['id_akun'])->where('DATE(create_at) >=', date_format(date_create($mulai),"Y/m/d"))->where('DATE(create_at) <=', date_format(date_create($sampai),"Y/m/d"))->get('jurnal_umum')->num_rows();
		return $jurnal_umum;
	}
}