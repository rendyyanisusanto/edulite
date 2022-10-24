<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends MY_Controller {
	public function get_data()
	{
		$data				=	$this->get_guru();
		
		$data['cek_kd']		=	$this->cek_kd();
		$data['tahun_ajaran']	=	$this->tahun_ajaran_aktif();
		$data['total_pegawai']	=	$this->my_where('guru', [])->num_rows();
		$data['surat_masuk']	=	$this->db->query('SELECT * FROM `surat_masuk` where date(tanggal_surat) = curdate()', [])->num_rows();
		$data['surat_keluar']	=	$this->db->query('SELECT * FROM `surat_keluar` where date(tanggal_surat) = curdate()', [])->num_rows();
		$data['buku_tamu']		=	$this->db->query('SELECT * FROM `buku_tamu` where date(tanggal) = curdate()', [])->num_rows();
		$this->my_view(['role/tu/page/dashboard/index_page/index','role/tu/page/dashboard/index_page/js'],$data);
	}
}
