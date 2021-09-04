<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class event extends MY_Controller {

	
	public function detail($id)
	{
		$data				=	$this->get_guru();
		$data['event']		=	$this->my_where('event', ['id_event'])->row_array();
		
		$this->my_view(['role/guru/page/event/index_page/index','role/guru/page/event/index_page/js'],$data);
	}
	public function konfirmasi()
	{

		$data				=	$this->get_guru();
		if ($this->my_update('presensi_event', ['is_hadir'=>1], ['idevent_fk'=>$_POST['id'], 'idguru_fk'=>$data['guru']['id_guru']])) {
			
		}
	}
}