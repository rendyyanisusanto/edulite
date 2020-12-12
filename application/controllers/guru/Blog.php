<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Blog extends MY_Controller {

	public $arr = [
			'title'				=>	'Halaman Profil',
			'table'				=>	'blog',
			'column'			=>	[ 'guru','singkatan'],
			'column_order'		=>	[ 'id_guru','guru','singkatan'],
			'column_search'		=>	[ 'id_guru','guru','singkatan'],
			'order'				=>	['id_guru'	=>	'DESC'],
			'id'				=>	'id_guru'
	];

	public function profil()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['guru']	=	$this->my_where('guru', ['id_guru'=>$data['account']['anggota_id']])->row_array();
		$this->my_view(['role/guru/page/blog/index_page/profil','role/guru/page/blog/index_page/js'],$data);
	}

	public function biografi()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['guru']		=	$this->my_where('guru', ['id_guru'=>$data['account']['anggota_id']])->row_array();
		$data['blog_teacher'] = $this->my_where('blog_teacher', ['idguru_fk'=>$data['account']['anggota_id']])->row_array();
		$this->my_view(['role/guru/page/blog/index_page/biografi','role/guru/page/blog/index_page/js_biografi'],$data);
	}

	function simpan_data()
	{
		echo json_encode($_POST);
	}

	public function simpan_data_biografi()
	{	
		$data['account']	=	$this->get_user_account();
		
		if ($this->my_update('blog_teacher',['deskripsi'=>$_POST['biografi']],['idguru_fk'=>$data['account']['anggota_id']])) {
			// $this->get_data();
		}	else 	{
			echo "error";
		}
	}

	public function add_artikel()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['guru']	=	$this->my_where('guru', ['id_guru'=>$data['account']['anggota_id']])->row_array();
		$this->my_view(['role/guru/page/blog/add_page/blog_articles','role/guru/page/blog/add_page/js_blog_articles'],$data);
	}
	public function save_articles()
	{

		$account	=	$this->get_user_account();
		if (isset($_FILES['img'])) {
			$config['upload_path']="./include/media/blog/blog/";
	        $config['allowed_types']='gif|jpg|png';
	        $config['encrypt_name'] = TRUE;
	         
	        $this->load->library('upload',$config);
	        if($this->upload->do_upload("img")){
	            $data = array('upload_data' => $this->upload->data());
	 			$data_upload = [
	 				'title'			=>	$_POST['title'],
					'description'	=>	$_POST['description'],
					'img'			=>	$data['upload_data']['file_name'],
					'tanggal'		=>	date('Y-m-d'),
					'tagline'		=>	$_POST['tagline'],
					'iduser_fk'		=>	$account['anggota_id'],

	 			];
	 			$this->save_data('blog_article', $data_upload);
	        }	

		echo json_encode($_POST);
		}

		
	}
}
