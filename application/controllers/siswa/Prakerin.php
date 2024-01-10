<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class prakerin extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman prakerin',
			'table'				=>	'prakerin',
			'column'			=>	['kode_arsip','pengirim','tanggal_surat','perihal','no_surat'],
			'column_order'		=>	[ 'id_prakerin','kode_arsip','pengirim','tanggal_surat','perihal','no_surat'],
			'column_search'		=>	[ 'id_prakerin','kode_arsip','pengirim','tanggal_surat','perihal','no_surat'],
			'order'				=>	['id_prakerin'	=>	'DESC'],
			'id'				=>	'id_prakerin'
	];

	/*
		CHANGE PAGE
	*/
	public function jurnal_harian()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/siswa/page/prakerin/index_page/index','role/siswa/page/prakerin/index_page/js'],$data);
	}
	function proses_prakerin(){
		$data['tanggal']	=	$_POST['tanggal'];
		$data['siswa']		=	$this->my_where('siswa', ['id_siswa'=>$this->get_user_account()['anggota_id']])->row_array();
		$data['kelompok']	=	$this->my_where('v_prakerin_siswa_kelompok', ['id_siswa'=>$this->get_user_account()['anggota_id']])->row_array();
		$data['prakerin_jurnal_harian']	=	$this->my_where('prakerin_jurnal_harian', ['idsiswa_fk'=>$this->get_user_account()['anggota_id']])->result_array();
		$this->my_view(['role/siswa/page/prakerin/index_page/proses'],$data);
	}
	function simpan_data_jurnal(){
		$data = [
			'idsiswa_fk'	=>	$this->get_user_account()['anggota_id'],
			'tanggal'		=>	$_POST['tanggal'],
			'kegiatan' 		=> 	$_POST['kegiatan']
		];

		if ($this->save_data('prakerin_jurnal_harian', $data)) {
			
		}
	}
	
}