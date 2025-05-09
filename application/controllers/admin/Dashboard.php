<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends MY_Controller {
	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['status_pulang'] = $this->db->query('SELECT * FROM setting_table WHERE `table` = "status_pulang"')->row_array();

		$this->my_view(['role/admin/page/dashboard/index_page/index','role/admin/page/dashboard/index_page/js'],$data);
	}
	public function stats()
	{
		$data['pendapatan_hari_ini'] = $this->get_from_account(
			[
				[
					'key_app'		=>'date(create_at)',
					'value_app'		=>date('Y/m/d'),

				],
			]
			, 4
		);
		$data['pendapatan_total'] 			= 	$this->get_from_account([], 4);
		$data['siswa_total']				=	$this->my_where('siswa',[])->num_rows();
		$data['guru_total']				=	$this->my_where('guru',[])->num_rows();
		$this->my_view(['role/admin/page/dashboard/index_page/stats'],$data);
		
	}

	function update_status_pulang_ajax(){
		$status = $this->input->post('status_pulang'); // nilai 1 atau 0

		// Update status berdasarkan keterangan atau kondisi lainnya
		$this->db->where('table', 'status_pulang'); // sesuaikan dengan kondisi Anda
		$this->db->update('setting_table', ['value' => $status]);

		echo json_encode(['success' => true]);
	}
	
}
