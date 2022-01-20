<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class Indikator_pkg extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman indikator_pkg',
			'table'				=>	'indikator_pkg',
			
	];

	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		$data['param']		=	$this->arr;
		$data['account']	=	$this->get_user_account();
		$data['tahun_ajaran'] = 	$this->my_where('tahun_ajaran', [])->result_array();
		$this->my_view(['role/admin/page/indikator_pkg/index_page/index','role/admin/page/indikator_pkg/index_page/js'],$data);
	}

	public function proses_data()
	{

		$data['param']		=	$this->arr;
		$data['tahun_ajaran_get']	=	$this->my_where('tahun_ajaran', ['id_tahun_ajaran'=>$_POST['idtahunajaran_fk']])->row_array();
		$data['indikator_pkg'] = $this->my_where('kompetensi_pkg', ['idtahunajaran_fk'=>$_POST['idtahunajaran_fk']])->result_array();


		$this->my_view(['role/admin/page/indikator_pkg/index_page/indikator_pkg'],$data);
	}

	public function save_indikator()
	{
		$ins = [
			'idtahunajaran_fk' => $_POST['idtahunajaran_fk'],
			'kompetensi'		=>	$_POST['kompetensi']
 		];

 		if ($this->save_data('kompetensi_pkg', $ins)) {
 			$data['param']		=	$this->arr;
			$data['tahun_ajaran_get']	=	$this->my_where('tahun_ajaran', ['id_tahun_ajaran'=>$_POST['idtahunajaran_fk']])->row_array();
			$data['indikator_pkg'] = $this->my_where('kompetensi_pkg', ['idtahunajaran_fk'=>$_POST['idtahunajaran_fk']])->result_array();

			$this->my_view(['role/admin/page/indikator_pkg/index_page/indikator_pkg'],$data);
 		}
	}

	public function save_subindikator()
	{
		$ins = [
			'idkompetensipkg_fk' => $_POST['idkompetensipkg_fk'],
			'subkompetensi'		=>	$_POST['subkompetensi']
 		];

 		if ($this->save_data('subkompetensi_pkg', $ins)) {
 			$data['param']		=	$this->arr;
			$id = $_POST['idkompetensipkg_fk'];
			$data['indikator_pkg'] 	= 	$this->my_where('kompetensi_pkg', ['id_kompetensi_pkg'=>$id])->row_array();
			$data['subindikator']	=	$this->my_where('subkompetensi_pkg', ['idkompetensipkg_fk'=>$id])->result_array();

			$this->my_view(['role/admin/page/indikator_pkg/index_page/subindikator_pkg'],$data);
 		}
	}

	public function sub_indikator()
	{
		$data['param']		=	$this->arr;
		$id = $_POST['id'];
		$data['indikator_pkg'] 	= 	$this->my_where('kompetensi_pkg', ['id_kompetensi_pkg'=>$id])->row_array();
		$data['subindikator']	=	$this->my_where('subkompetensi_pkg', ['idkompetensipkg_fk'=>$id])->result_array();

		$this->my_view(['role/admin/page/indikator_pkg/index_page/subindikator_pkg'], $data);
	}
}