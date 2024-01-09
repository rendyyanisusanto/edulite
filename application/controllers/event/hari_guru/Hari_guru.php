<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class hari_guru extends CI_Controller {
	
	public function index()
	{
		$data = [];
		$data['guru']	=	$this->db->order_by('no_acak_gv','ASC')->get_where("guru", ['is_active'=>1])->result_array();
		$this->load->view('event/hari_guru/index', $data);
	}

	function proses(){
		$this->db->insert("vote_hari_guru", [
			'idguru_fk'	=>	$_POST['id']
		]);
		echo json_encode($_POST);
	}
}