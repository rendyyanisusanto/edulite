<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class jam_pelajaran extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman jam_pelajaran',
			'table'				=>	'jam_pelajaran',
			'column'			=>	[ 'nama'],
			'column_order'		=>	[ 'id_jam_pelajaran','nama'],
			'column_search'		=>	[ 'id_jam_pelajaran','nama'],
			'order'				=>	['id_jam_pelajaran'	=>	'DESC'],
			'id'				=>	'id_jam_pelajaran'
	];

	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran',[])->result_array();
		$this->my_view(['role/admin/page/jam_pelajaran/index_page/index','role/admin/page/jam_pelajaran/index_page/js'],$data);
	}

	public function get_jam($id_tahun_ajaran='')
	{
		$data['param'] 		= 	$this->arr;
		$data['jam_pelajaran'] = $this->my_where('jam_pelajaran', ['idtahunajaran_fk'=>$id_tahun_ajaran])->result_array();
		$this->my_view(['role/admin/page/jam_pelajaran/index_page/jam_pelajaran'],$data);
	}

	public function simpan_data()
	{
		$data = [
			'nama'				=>	$_POST['nama'],
			'jam_mulai'			=>	$_POST['jam_mulai'],
			'jam_selesai'		=>	$_POST['jam_selesai'],
			'idtahunajaran_fk'	=>	$_POST['idtahunajaran_fk']
		];

		if ($this->save_data('jam_pelajaran', $data)) {
			echo json_encode(['status'=>1]);
		}else{
			echo json_encode(['status'=>0]);
		}
	}

	public function update_data()
	{
		$data = [
			'nama'				=>	$_POST['nama'],
			'jam_mulai'			=>	$_POST['jam_mulai'],
			'jam_selesai'		=>	$_POST['jam_selesai'],
			'idtahunajaran_fk'	=>	$_POST['idtahunajaran_fk']
		];

		if ($this->my_update('jam_pelajaran', $data, ['id_jam_pelajaran'=>$_POST['id_jam_pelajaran']])) {
			echo json_encode(['status'=>1]);
		}else{
			echo json_encode(['status'=>0]);
		}
	}
	public function hapus_data($id='')
	{
		if ($this->db->delete('jam_pelajaran', ['id_jam_pelajaran'=>$id])) {
			echo json_encode(['status'=>1]);
		}else{
			echo json_encode(['status'=>0]);
		}
	}
}