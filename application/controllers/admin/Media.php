<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class Media extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman Media',
			'table'				=>	'Media',
			'column'			=>	[ 'nis','nama'],
			'column_order'		=>	[ 'nis','nama'],
			'column_search'		=>	[ 'nis','nama'],
			'order'				=>	['id_Media'	=>	'DESC'],
			'id'				=>	'id_Media'
	];

	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['media']		=	$this->my_where('media', [])->result_array();
		$this->my_view(['role/admin/page/media/index','role/admin/page/Media/js_media'],$data);
	}

	public function add_page()
	{
		$data['account']	=	$this->get_user_account();
		$this->my_view(['role/admin/page/media/add_data','role/admin/page/Media/js_media'],$data);
	}

	public function add_media()
	{
		$config['upload_path']="./include/media"; //path folder file upload
        $config['allowed_types']='gif|jpg|png'; //type file yang boleh di upload
        $config['encrypt_name'] = TRUE; //enkripsi file name upload
         
        $this->load->library('upload',$config); //call library upload 
        if($this->upload->do_upload("file_upload")){ //upload file
            $data = array('upload_data' => $this->upload->data()); //ambil file name yang diupload
            $image= $data['upload_data']['file_name']; //set file name ke variable image
            $data_save = [
            	'img'	=>	$data['upload_data']['file_name'],
            	'title'	=>	$data['upload_data']['file_name'],
            ];
            $this->save_data('media', $data_save);
            echo json_encode($data);
        }
	}

	public function edit_page()
	{
		if (isset($_POST['send_data'])) {
			$data_edit=[];
			foreach ($_POST['send_data'] as $key => $value) {
				$data_set = $this->my_where('Media',['id_Media'=>$value])->row_array();
				$data_edit[]	=	[
										'id_Media'				=>	$data_set['id_Media'],
										'nama'					=>	$data_set['nama'],
										'nis'					=>	$data_set['nis'],
				];
			}
			$data['data_edit']	=	$data_edit;
			$this->my_view(['role/admin/page/Media/edit_data','role/admin/page/Media/js_edit_page'],$data);
		} else {
			$this->get_data();
		}
	}

	public function detail_all()
	{
		if (isset($_POST['send_data'])) {
				$data['Media'] 	= $this->my_where('Media',['id_Media'=>$_POST['send_data']])->row_array();
				$data['confirmation'] 	= $this->my_where('member_confirmation',['Media_id'=>$_POST['send_data']])->result_array();
				$this->my_view(['role/admin/page/Media/detail_all','role/admin/page/Media/js_edit_page'],$data);
		} else {
			$this->get_data();
		}
		
	}
	
	public function upload_page()
	{
		$data['account']	=	$this->get_user_account();
		$this->my_view(['role/admin/page/Media/upload_page','role/admin/page/Media/js_upload_page'],$data);
	}
	/*
		ADD DATA
	*/


	public function simpan_data()
	{	

		if ($this->save_data_param()) {
			$this->get_data();
			// Register User
			$data_user = $this->my_where('Media', [
				'nis'					=>	$_POST['nis'],
				'nama'					=>	$_POST['nama'],
			])->row_array();
			$data = [
				'username'	=>	$_POST['nis'],
				'password'	=>	$_POST['nis'],
				'email'		=>	$_POST['nis'].'@gmail.com',
				'additional_data'	=>	[
					'first_name'	=>	$_POST['nama'],
					'table'			=>	'Media',
					'anggota_id'	=>	$data_user['id_Media']
				],
				'group'	=>	['2']
			];
			$this->ion_auth->register($data['username'], $data['password'], $data['email'], $data['additional_data'], $data['group']);
		}	else 	{
			echo "error";
		}

	}


	/*
		EDIT DATA
	*/

	function update_data()
	{

		$data=[];
		$data=[
				'nis'					=>	$_POST['nis'],
				'nama'					=>	$_POST['nama'],
				];
				
		if ($this->my_update('Media',$data,['id_Media'=>$_POST['id_Media']])) {
			$this->my_update('users',['username' => $_POST['nis']], ['anggota_id'=>$_POST['id_Media'],'table'=>'Media']);
			$this->get_data();
		}	else 	{
			echo "error";
		}

	}

	/*
		DELETE DATA
	*/

	function hapus()
	{
		foreach ($_POST['data_get'] as $key => $value) {
			$this->db->delete('Media',['id_Media'=>$value]);
		}
	}

	/*
		PRINT DATA
	*/

	/*
		MANIPULATE DATA
	*/

	public function datatable()
	{
        echo json_encode($this->call_datatable($this->arr));
	}

	public function get_galeri()
	{
		$this->db->order_by('id_media', 'DESC');
		$data['galeri'] = $this->my_where('media',[])->result_array();

		$this->my_view(['media/index'],$data);
	}
	
	
}