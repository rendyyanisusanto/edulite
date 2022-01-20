<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends MY_Controller {
	public function get_data()
	{
		$data				=	$this->get_guru();
		
		$data['cek_kd']		=	$this->cek_kd();
		$data['tahun_ajaran']	=	$this->tahun_ajaran_aktif();
		$this->my_view(['role/koperasi/page/dashboard/index_page/index','role/koperasi/page/dashboard/index_page/js'],$data);
	}
}
