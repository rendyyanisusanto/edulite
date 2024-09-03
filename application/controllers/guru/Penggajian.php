<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class penggajian extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman penggajian',
			'table'				=>	'penggajian',
			'column'			=>	['bulan','tahun', 'keterangan'],
			'column_order'		=>	[ 'id_penggajian','bulan','tahun', 'keterangan'],
			'column_search'		=>	[ 'id_penggajian','bulan','tahun', 'keterangan'],
			'order'				=>	['id_penggajian'	=>	'DESC'],
			'id'				=>	'id_penggajian',
			'parents_link'		=>	'role/guru/page/penggajian'
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
		$data['penggajian']	=	$this->db->query('select * from penggajian where idguru_fk='.$data['guru']['guru']['id_guru'].' limit 10')->result_array();

 		if ($this->agent->is_mobile()) {
 			$this->my_view(['role/guru/page_mobile/penggajian/index_page/index','role/guru/page_mobile/penggajian/index_page/js'],$data);
 		}else{
 			$this->my_view(['role/guru/page/penggajian/index_page/index','role/guru/page/penggajian/index_page/js'],$data);
 		}
		
	}

	function get_data_hr(){
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['guru']		=	$this->get_guru();
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', [])->result_array();
		$data['penggajian']	=	$this->db->query('select * from penggajian where idguru_fk='.$data['guru']['guru']['id_guru'].' order by id_penggajian desc limit 10')->result_array();
		$this->my_view(['role/guru/page_mobile/penggajian/index_page/get_data'],$data);
	}
	function print_nota($id='', $bulan='', $tahun = '')
	{
		$data['guru']	=	$this->my_where('guru', ['id_guru'=>$id])->row_array();
		$data['penggajian']	=	$this->my_where('penggajian', ['idguru_fk'=>$id, 'bulan'=>$bulan, 'tahun'=>$tahun])->row_array();
		$data['detail_komponen_penggajian_deb']	=	$this->my_where('v_detail_komponen_penggajian', [ 'idpenggajian_fk'=>$data['penggajian']['id_penggajian'], 'saldo'=>'D'])->result_array();
		$data['detail_komponen_penggajian_kred']	=	$this->my_where('v_detail_komponen_penggajian', [ 'idpenggajian_fk'=>$data['penggajian']['id_penggajian'], 'saldo'=>'K'])->result_array();
		$data['detail_tambahan_penggajian_deb']	=	$this->my_where('detail_tambahan_penggajian', [ 'idpenggajian_fk'=>$data['penggajian']['id_penggajian'], 'saldo'=>'D'])->result_array();
		$data['detail_tambahan_penggajian_kred']	=	$this->my_where('detail_tambahan_penggajian', [ 'idpenggajian_fk'=>$data['penggajian']['id_penggajian'], 'saldo'=>'K'])->result_array();
		$data['bulan']	=	$bulan;
		$data['tahun']	=	$tahun;
		$this->load->view('role/guru/page/penggajian/print/index', $data);
	}

}