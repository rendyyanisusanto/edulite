<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Presensi extends MY_Controller {
	public function get_data()
	{
		$data = [];

		$data['account']	=	$this->get_user_account();
		$data['siswa'] = $this->my_where('siswa', ['id_siswa' => $data['account']['anggota_id']])->row_array();

        $data['presensi_siswa'] =   $this->my_where('presensi_harian', ['tanggal'=>date('Y-m-d'),'idsiswa_fk'=>$data['siswa']['id_siswa']])->row_array();

		$this->my_view(['role/ortu/page/presensi/index_page/index','role/ortu/page/presensi/index_page/js'],$data);
	}
}
