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
		$walas = [];
		foreach ($guru['walas'] as $key => $value) {
			$walas[$key] = $value['idkelas_fk'];
		}
		$data['catatan']	=	$this->db->query('select * from v_catatan_siswa_new where idkelas_fk IN ('.implode(',', $walas).')')->result_array();
		
		$this->my_view(['role/guru/page/catatan_siswa/index_page/table_catatan'], $data);
	}

	function tindakan($id_catatan="")
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['catatan_siswa']	=	$this->my_where('v_catatan_siswa_new', ['id_catatan_siswa'=>$id_catatan])->row_array();
		$this->my_view(['role/guru/page/catatan_siswa/tindakan/index','role/guru/page/catatan_siswa/tindakan/js'],$data);	
	}
	function simpan_data(){
		$data = [
			'idcatatansiswa_fk'	=>	$_POST['idcatatansiswa_fk'],
			'tanggal'			=>	$_POST['tanggal'],
			'tindakan'			=>	$_POST['tindakan']
		];

		if ($this->save_data('tindakan_catatan_siswa', $data)) {
			// code...
		}
	}
	function get_data_catatan($id_catatan=""){
		$data['tindakan']	=	$this->my_where('tindakan_catatan_siswa', ['idcatatansiswa_fk'=>$id_catatan])->result_array();

		$this->my_view(['role/guru/page/catatan_siswa/tindakan/data_tindakan'], $data);
	}
}