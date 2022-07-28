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

		$data['kelas']		=	$this->my_where('kelas', [])->result_array();
		$data['jurusan']	=	$this->my_where('jurusan', [])->result_array();
		$this->my_view(['role/admin/page/histori_tanggungan_siswa/index_page/index','role/admin/page/histori_tanggungan_siswa/index_page/js'],$data);
	}
	function get_setting()
	{
		$this->db->limit('50');
		$siswa				=	(!empty($_POST['idkelas'])) ? $this->my_where('v_siswa_jurusan', ['idkelas_fk'=>$_POST['idkelas']])->result_array() : $this->my_where('v_siswa_jurusan', [])->result_array();
		$jenis_penerimaan 	=	$this->my_where('jenis_penerimaan', [])->result_array();
		$data['siswa']		=	[];
		foreach ($siswa as $value) {
			$tanggungan = [];
			$total_tanggungan = 0;
			$tanggungan_siswa 				= 	$this->my_where('v_tanggungan_siswa', ['idsiswa_fk'=>$value['id_siswa']])->result_array();
			foreach ($tanggungan_siswa as $value_penerimaan) {
				$pembayaran = $this->db->select('sum(jumlah) as jml')->get_where('penerimaan', ['idsiswa_fk'=>$value['id_siswa'], 'idjenispenerimaan_fk'=>$value_penerimaan['id_jenis_penerimaan']])->row_array();
				$tanggungan[]	=	[
					'id_jenis_penerimaan'	=>	$value_penerimaan['id_jenis_penerimaan'],
					'jumlah'				=>	$value_penerimaan['jumlah'],
					'nama'					=>	$value_penerimaan['nama'],
					'pembayaran'			=>	$pembayaran['jml']
				];
				$total_tanggungan += ($value_penerimaan['jumlah']-$pembayaran['jml']);
			}
			$data['siswa'][]	=	[
				'siswa' 		=> $value,
				'tanggungan' 	=> $tanggungan,
				'total_tanggungan'  		=> $total_tanggungan
			];
		}	
		$this->my_view(['role/admin/page/histori_tanggungan_siswa/index_page/contentform'],$data);
	}
}
?>