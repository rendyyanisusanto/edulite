<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class laba_rugi extends MY_Controller {
	

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
		$this->my_view(['role/admin/page/laba_rugi/index_page/index','role/admin/page/laba_rugi/index_page/js'],$data);
	}

	function coa()
	{
		$coa = $this->db->where('id_coa', 4)->or_where('id_coa', 5)->get('coa')->result_array();
		$akun = [];
		foreach ($coa as $key => $value) {
			$akun [] = [
				'id_coa'=>	$value['id_coa'],
				'coa'	=>	$value['name'],
				'induk'	=>	$this->induk_akun($value)
			];
		}
		$data['akun']	=	$akun;
		
		$this->my_view(['role/admin/page/laba_rugi/index_page/table'],$data);
	}
	function induk_akun($data){
		$send = [];
		$induk = $this->my_where('induk_akun', ['idcoa_fk'=>$data['id_coa']])->result_array();
		foreach ($induk as $key => $value) {
			$send[] = [
				'nama'		=>	$value['nama'],
				'no_akun'	=>	$value['no_akun'],
				'akun'		=>	$this->akun_get($value)
			];
		}
		return $send;
	}

	function akun_get($data){
		
		$mulai = $_POST['mulai'];
		$sampai = $_POST['sampai'];
		$akun = $this->my_where('akun', ['idindukakun_fk'=>$data['id_induk_akun']])->result_array();
		$send = [];
		$akun_kosong		=	(isset($_POST['akun_kosong']))?1:0;
		foreach ($akun as $key => $value) {
			
			$cek = $this->db->select('sum(debit)-sum(kredit) as cash')->where('idakun_fk', $value['id_akun'])->where('DATE(create_at) >=', date_format(date_create($mulai),"Y/m/d"))->where('DATE(create_at) <=', date_format(date_create($sampai),"Y/m/d"))->get('jurnal_umum');
			$jurnal = $cek->row_array(); 

			$cash = (!empty($jurnal['cash']))?abs($jurnal['cash']):0;
			if ($cash == 0 && $akun_kosong == 0) {continue;}
			$send[] = [
				'no_ref'	=>	$value['no_ref'],
				'nama'		=>	$value['nama'],
				'cash'		=>	$cash
			];
		}
		return $send;
	}
	
}