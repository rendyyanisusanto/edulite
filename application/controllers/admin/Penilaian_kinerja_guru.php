<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class Penilaian_kinerja_guru extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman indikator_pkg',
			'table'				=>	'penilaian_kinerja_guru',
	];

	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		$data['param']		=	$this->arr;
		$data['account']	=	$this->get_user_account();
		$data['tahun_ajaran'] = 	$this->my_where('tahun_ajaran', [])->result_array();
		$data['guru'] 		= 	$this->my_where('guru', [])->result_array();
		$this->my_view(['role/admin/page/penilaian_kinerja_guru/index_page/index','role/admin/page/penilaian_kinerja_guru/index_page/js'],$data);
	}

	public function proses_data()
	{
		$data['guru'] 				= 	$this->my_where('guru', ['id_guru'=>$_POST['id_guru']])->row_array();
		$data['tahun_ajaran'] 		= 	$this->my_where('tahun_ajaran', ['id_tahun_ajaran'=>$_POST['id_tahun_ajaran']])->row_array();
		$data['periode']			=	$_POST['periode'];
		$kompetensi_pkg				=	$this->my_where('kompetensi_pkg',[])->result_array();
		$data['indikator_pkg']		=	[];
		foreach ($kompetensi_pkg as $key => $value) {
			$subkompetensi_pkg = $this->my_where('subkompetensi_pkg', ['idkompetensipkg_fk'=>$value['id_kompetensi_pkg']])->result_array();	

			$data['indikator_pkg'][] = [
				'kompetensi_pkg' => $value,
				'subkompetensi_pkg' => $subkompetensi_pkg
			];
		}
		$this->my_view(['role/admin/page/penilaian_kinerja_guru/index_page/proses_data'],$data);
	}
}