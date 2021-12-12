<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Catatan extends MY_Controller {
	public function get_data()
	{
		$data = [];

		$data['account']	=	$this->get_user_account();
		$data['siswa'] = $this->my_where('siswa', ['id_siswa' => $data['account']['anggota_id']])->row_array();

        $data['catatan'] =   $this->my_where('v_pelanggaran_siswa', ['idsiswa_fk'=>$data['siswa']['id_siswa']])->result_array();

		$this->my_view(['role/ortu/page/catatan/index_page/index','role/ortu/page/catatan/index_page/js'],$data);
	}
}
