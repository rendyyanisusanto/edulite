<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Presensi_tahfidz extends CI_Controller {
	
	public function index()
	{
		
		$data=[];
		$this->load->view('presensi_tahfidz/index', $data);
	}

    
}
?>