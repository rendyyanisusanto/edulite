<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Laporan_siswa extends MY_Controller {

    public function rekap()
	{

		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['dt_guru']	=	$this->get_guru();
		$this->my_view(['role/guru/page_mobile/laporan_siswa/rekap/index','role/guru/page_mobile/laporan_siswa/rekap/js'],$data);

	}
}