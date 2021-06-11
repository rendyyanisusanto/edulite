<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Jurnal_guru extends MY_Controller {

	
	public function jurnal($idjadwal)
	{
		$data				=	$this->get_guru();
		$data['cek_kd']		=	$this->cek_kd();
		$data['tahun_ajaran']	=	$this->tahun_ajaran_aktif();
		$data['mapel_hari_ini']	=	$this->my_where('v_jadwal_pelajaran', ['id_jadwal_pelajaran' => $idjadwal])->row_array();
		$this->my_view(['role/guru/page/jurnal/index_page/index','role/guru/page/jurnal/index_page/js'],$data);
	}
}