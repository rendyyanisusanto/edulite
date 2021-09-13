<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class catatan_siswa extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman pelanggaran_siswa',
			'table'				=>	'catatan_siswa',
			'column'			=>	['kode_arsip','tujuan','tanggal_surat','perihal','no_surat'],
			'column_order'		=>	[ 'id_pelanggaran_siswa','kode_arsip','tujuan','tanggal_surat','perihal','no_surat'],
			'column_search'		=>	[ 'id_pelanggaran_siswa','kode_arsip','tujuan','tanggal_surat','perihal','no_surat'],
			'order'				=>	['id_pelanggaran_siswa'	=>	'DESC'],
			'id'				=>	'id_pelanggaran_siswa'
	];

	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/guru/page/catatan_siswa/index_page/index','role/guru/page/catatan_siswa/index_page/js'],$data);
	}
	public function get_catatan()
	{
		$guru = $this->get_guru();

		// $catatan_siswa = $t
	}
}