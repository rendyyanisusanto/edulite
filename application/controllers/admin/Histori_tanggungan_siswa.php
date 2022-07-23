<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class histori_tanggungan_siswa extends MY_Controller {


	public $arr = [
			'title'				=>	'Halaman Data Tanggungan Siswa',
			'table'				=>	'penerimaan',
			'column'			=>	[ 'idsiswa_fk','idjenispenerimaan_fk','metode_pembayaran','tanggal','jumlah','catatan','create_at','invoice','diskon'],
			'column_order'		=>	[ 'id_penerimaan','idsiswa_fk','idjenispenerimaan_fk','metode_pembayaran','tanggal','jumlah','catatan','create_at','invoice','diskon'],
			'column_search'		=>	[ 'id_penerimaan','idsiswa_fk','idjenispenerimaan_fk','metode_pembayaran','tanggal','jumlah','catatan','create_at','invoice','diskon'],
			'order'				=>	['id_penerimaan'	=>	'DESC'],
			'id'				=>	'id_penerimaan'
	];

	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$this->my_view(['role/admin/page/histori_tanggungan_siswa/index_page/index','role/admin/page/histori_tanggungan_siswa/index_page/js'],$data);
	}
}
?>