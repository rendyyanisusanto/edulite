<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends MY_Controller {
	public function get_data()
	{
		$data					=	$this->get_guru();
		
		$data['cek_kd']			=	$this->cek_kd();
		$data['tahun_ajaran']	=	$this->tahun_ajaran_aktif();
		$data['kerjasama_dudi']	=	$this->my_where('kerjasama_dudi', [])->num_rows();
		$data['sosialisasi']	=	$this->my_where('sosialisasi', [])->num_rows();
		$data['dudi']			=	$this->my_where('dudi', [])->num_rows();
		$data['lowongan']		=	$this->my_where('lowongan', [])->num_rows();
		
		$this->my_view(['role/humas/page/dashboard/index_page/index','role/humas/page/dashboard/index_page/js'],$data);
	}
}
