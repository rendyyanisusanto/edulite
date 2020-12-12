<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Dashboard extends MY_Controller {

	
	public function get_data()
	{
		$data				=	$this->get_guru();
		$this->my_view(['role/guru/page/dashboard/index_page/index','role/guru/page/dashboard/index_page/js'],$data);
	}
}