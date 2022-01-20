<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class wali_kelas extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman siswa_kelas',
			'table'				=>	'wali_kelas',
			'column'			=>	[ 'siswa_kelas'],
			'column_order'		=>	[ 'id_siswa_kelas','siswa_kelas'],
			'column_search'		=>	[ 'id_siswa_kelas','siswa_kelas'],
			'order'				=>	['id_siswa_kelas'	=>	'DESC'],
			'id'				=>	'id_siswa_kelas'
	];

	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$tahun_ajaran		=	$this->tahun_ajaran_aktif();
		$data['tahun_ajaran']	=	$tahun_ajaran;
		$kelas				=	$this->my_where('kelas',[])->result_array();
		$data['guru']		=	$this->db->query('select * from guru ')->result_array();
		$data['kelas']		=	[];
		foreach ($kelas as $key => $value) {
			$check_class = $this->my_where('wali_kelas', ['idkelas_fk'=>$value['id_kelas'], 'idtahunajaran_fk'=>$tahun_ajaran['id_tahun_ajaran']])->row_array();
			if (!empty($check_class) > 0) {
				$guru = $this->my_where('guru', ['id_guru'=>$check_class['idguru_fk']])->row_array();
			}
			$data['kelas'][] = [
				'kelas'	=>	$value,
				'guru'	=>	(!empty($check_class)>0) ? $guru : []
			];
		}
		$this->my_view(['role/admin/page/wali_kelas/index_page/index','role/admin/page/wali_kelas/index_page/js'],$data);
	}

	public function simpan_data()
	{

		$tahun_ajaran		=	$this->tahun_ajaran_aktif();
		$data = [
			'idguru_fk'				=>	$_POST['id_guru'],
			'idtahunajaran_fk'		=>	$tahun_ajaran['id_tahun_ajaran'],
			'idkelas_fk'			=>	$_POST['id_kelas']
		];

		if ($this->save_data('wali_kelas', $data)) {
			# code...
		}
	}
}