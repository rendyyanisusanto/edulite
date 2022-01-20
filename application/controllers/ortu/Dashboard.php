<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends MY_Controller {
	public function get_data()
	{
		$data = [];

		$data['account']	=	$this->get_user_account();
		$data['siswa'] = $this->my_where('siswa', ['id_siswa' => $data['account']['anggota_id']])->row_array();
		$this->my_view(['role/ortu/page/dashboard/index_page/index','role/ortu/page/dashboard/index_page/js'],$data);
	}
}
