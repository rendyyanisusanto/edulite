<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Global_controller extends MY_Controller {
	
	public function change_profile()
	{
		$data['account']	=	$this->get_user_account();
		$this->my_view(['template/adminlte/page/profil/profil','template/adminlte/page/profil/js_profil'],$data);
	}
	public function save_profil()
	{
		$id = $_POST['id'];

	    $data = array(
	          'first_name' 	=> $_POST['first_name'],
	          'last_name' 	=> $_POST['last_name'],
	          'username' 	=> $_POST['username'],
	          'phone' 		=> $_POST['phone'],
	          'email' 		=> $_POST['email'],
	    );
	    if (!empty($_POST['password'])) {
	    	$data['password']	=	$_POST['password'];
	    }
	    if ($this->ion_auth->update($id, $data)) {
	    	$data['account']	=	$this->get_user_account();
			$this->my_view(['template/adminlte/page/profil/profil','template/adminlte/page/profil/js_profil'],$data);
	    } else{
	    	echo "error";
	    }
	}
	public function save_photo()
	{
		$config['upload_path']="./include/user_account";
        $config['allowed_types']='gif|jpg|png';
        $config['encrypt_name'] = TRUE;
         
        $this->load->library('upload',$config);
        if($this->upload->do_upload("foto")){
            $data = array('upload_data' => $this->upload->data());
 
            $id= $this->input->post('id'); 
            $data = array(
	          'foto' 	=> $data['upload_data']['file_name'],
	    	);
	    	if ($this->ion_auth->update($id, $data)) {
	    	# code...
		    	$data['account']	=	$this->get_user_account();
				$this->my_view(['template/adminlte/page/profil/profil','template/adminlte/page/profil/js_profil'],$data);
		    } else{
		    	echo "error";
		    }
        }
	}
	public function get_stats_all($table = "")
	{
		echo $this->my_where($table,[])->num_rows();
	}

	public function get_stats_today($table = "")
	{
		echo $this->my_where($table,["date(create_at)" => "date(NOW)"])->num_rows();
	}
}
