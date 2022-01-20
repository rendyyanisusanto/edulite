<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class MY_Frontend extends CI_Controller {

   
    public function __construct()
    {
        parent::__construct();
        $this->load->model('MY_Model','mod');
        $this->load->model('MY_Datatable','mod_datatable');
       
    }

    public function get_login()
    {
        
        if (!$this->ion_auth->logged_in())
        {
            // redirect them to the login page
            if ($this->uri->segment(1)!='auth'){
                redirect('auth/login', 'refresh');
            }
            if ($this->uri->segment(2)=='logout') {
                redirect('auth/login', 'refresh');
            }
        }
        else 
        {            
            if ($this->uri->segment(2)!='logout') {
                $group_name=$this->ion_auth->get_users_groups()->row();
                if ($this->uri->segment(1)!=$group_name->name) {
                    redirect($group_name->name.'/Dashboard', 'refresh');
                }
            }
            
        }
    }

    public function data_all()
    {
        $data['profil_website']     =  $this->mod->get_profil_website(); 
        $data['user_account']       =  $this->ion_auth->user()->row_array();
        $data['user_groups']        =   $this->my_groups();
        $data['sidebar']            =   $this->my_sidebar();
        $data['themes']             =   $this->my_where('setting_website',[])->row_array();
        return $data;
    }

    public function my_template()
    {
        return $this->config->item('template');
    }

    public function my_login_page()
    {
        return $this->config->item('login_page');
    }

    public function my_groups()
    {
        return $this->ion_auth->get_users_groups()->row_array();
    }

    public function my_view($view,$data_get)
    {
        $i=0;
        $data = $this->data_all();
        $data['data_get']=$data_get;
        foreach ($view as $key => $value) {
            if ($i==0) {
                $this->load->view($value,$data);
            }else{
                $this->load->view($value);
            }
        }
    }
    public function my_delete_file($folder)
    {
            //Get a list of all of the file names in the folder.
            $files = glob($folder . '/*');
            //Loop through the file list.
            foreach($files as $file){
                //Make sure that this is a file and not a directory.
                if(is_file($file)){
                    //Use the unlink function to delete the file.
                    unlink($file);
                }
            }
    }
    public function my_sidebar()
    {
        $group  =   $this->my_groups();
        return 'role/'.$group['name'].'/include/sidebar';
    }
    public function my_update($tabel, $data, $where)
    {
        return $this->mod->set_update($tabel, $data, $where);
    }
    public function my_where($tabel, $where)
    {
        return $this->mod->get_where($tabel, $where);
    }
    public function my_query($query)
    {
        return $this->mod->get_query($query);
    }
    public function my_db_count($tabel, $where)
    {
        return $this->mod->get_where($tabel, $where)->num_rows();
    }
    public function get_user_account()
    {
        return $this->ion_auth->user()->row_array();
    }

    public function save_data($tabel, $data)
    {
        return $this->mod->save($tabel, $data);
    }

    public function index_set()
    {
          //   	$tmp    =  $this->my_template();
                $data   =  $this->data_all();

		$this->load->view('role/frontend/'.$data['themes']['themes'].'/index',$data);
		// $this->load->view('template/'.$tmp.'/navbar');
		// $this->load->view('template/'.$tmp.'/sidebar');
		// $this->load->view('template/'.$tmp.'/content');
		// $this->load->view('template/'.$tmp.'/footer');
    }
}