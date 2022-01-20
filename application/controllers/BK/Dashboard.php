<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends MY_Controller {
	public function get_data()
	{
		$data				=	$this->get_guru();
		
		$data['cek_kd']		=	$this->cek_kd();
		$data['tahun_ajaran']	=	$this->tahun_ajaran_aktif();
		$this->db->limit(5);
		$data['catatan']	=	$this->my_where('v_catatan_siswa_harian', ['teruskan_ke'=>'BK'])->result_array();
		$this->db->limit(5);
		$this->db->order_by('poin', 'DESC');
		$data['poin_pelanggaran_siswa']	=	$this->my_where('v_poin_pelanggaran_siswa', [])->result_array();
		$this->my_view(['role/BK/page/dashboard/index_page/index','role/BK/page/dashboard/index_page/js'],$data);
	}
}
