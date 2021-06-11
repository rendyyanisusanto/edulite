<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Dashboard extends MY_Controller {

	
	public function get_data()
	{
		$data				=	$this->get_guru();
		$data['mapel_hari_ini']	=	$this->my_where('v_jadwal_pelajaran', ['idguru_fk' => $data['guru']['id_guru'], 'code' => date('N')])->result_array();
		$data['cek_kd']		=	$this->cek_kd();
		$data['tahun_ajaran']	=	$this->tahun_ajaran_aktif();
		$this->my_view(['role/guru/page/dashboard/index_page/index','role/guru/page/dashboard/index_page/js'],$data);
	}
}