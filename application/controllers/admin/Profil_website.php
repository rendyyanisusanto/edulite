<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class profil_website extends MY_Controller {
	

	/*
		CHANGE PAGE
	*/
	public $arr = [
			'title'				=>	'Halaman profil_website',
			'table'				=>	'profil_website',
			'column'			=>	[ 'title','tag','profil_website','img','create_at','idblogcategory_fk','visit_count'],
			'column_order'		=>	[ 'id_blog_post','title','tag','profil_website','img','create_at','idblogcategory_fk','visit_count'],
			'column_search'		=>	[ 'id_blog_post','title','tag','profil_website','img','create_at','idblogcategory_fk','visit_count'],
			'order'				=>	['profil_website'	=>	'DESC'],
			'id'				=>	'profil_website'
	];

	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['profil']		=	$this->my_where('profil_website',[])->row_array();

		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/admin/page/profil_website/index','role/admin/page/profil_website/js_profil_website'],$data);
	}

	/*
		ADD DATA
	*/


	public function simpan_data()
	{

		$config2['upload_path']="./include/foto_produk";
        $config2['allowed_types']='gif|jpg|png';
        $config2['encrypt_name'] = TRUE;

        $this->load->library('upload',$config2);
        if($this->upload->do_upload("foto_produk")){
            $data2 = array('upload_data' => $this->upload->data());
            $data=[
			'nama_profil_website'		=>	$_POST['nama_profil_website'],
			'harga_profil_website'		=>	$_POST['harga_profil_website'],
			'stok'				=>	$_POST['stok'],
			'deskripsi'			=>	$_POST['deskripsi'],
			'foto'				=>	$data2['upload_data']['file_name'],
			];

			
				if ($this->save_data('profil_website',$data)) {
					$this->get_data();
				}	else 	{
					echo "error";
				}
				
        }

		
	}


	/*
		EDIT DATA
	*/

	function update_data()
	{
		if(file_exists($_FILES['logo']['tmp_name']) || is_uploaded_file($_FILES['logo']['tmp_name'])) {
			$logo = $this->save_media([
				'path'	=>	"./include/media/",
				'filename' => 'logo',
			]);
		}
		if(file_exists($_FILES['icon']['tmp_name']) || is_uploaded_file($_FILES['icon']['tmp_name'])) {
			$icon = $this->save_media([
				'path'	=>	"./include/media/",
				'filename' => 'icon',
			]);
		}
		if(is_uploaded_file($_FILES['img_prof']['tmp_name'])) {
			$img_prof = $this->save_media([
				'path'	=>	"./include/setting_website/img_about_us/",
				'filename' => 'img_prof',
			]);
		}

		$data=[];
		$data=[
				'nama'				=>	$_POST['nama'],
				'nama_website'				=>	$_POST['nama_website'],
				'singkatan'					=>	$_POST['singkatan'],
				'pemilik'					=>	$_POST['pemilik'],
				'alamat'					=>	$_POST['alamat'],
				'kota'						=>	$_POST['kota'],
				'tagline'					=>	$_POST['tagline'],
				'no_hp'						=>	$_POST['no_hp'],
				'email'						=>	$_POST['email'],
				'facebook'					=>	$_POST['facebook'],		
				'twitter'					=>	$_POST['twitter'],
				'youtube'					=>	$_POST['youtube'],
				'instagram'					=>	$_POST['instagram'],
				'lng'					=>	$_POST['lng'],
				'lat'					=>	$_POST['lat'],
				];
		if(file_exists($_FILES['logo']['tmp_name']) || is_uploaded_file($_FILES['logo']['tmp_name'])) {
				$data['logo'] = ((isset($logo)) ? $logo['file_name'] : '');
		}
		if(file_exists($_FILES['icon']['tmp_name']) || is_uploaded_file($_FILES['icon']['tmp_name'])) {
				$data['icon'] = ((isset($icon)) ? $icon['file_name'] : '');
		}
		if(is_uploaded_file($_FILES['img_prof']['tmp_name'])) {
				$data['img_about_us'] = ((isset($img_prof)) ? $img_prof['file_name'] : '');
		}

				
		if ($this->my_update('profil_website',$data,[])) {
			// $this->get_data();
		}	else 	{
			echo "error";
		}

	}

	/*
		DELETE DATA
	*/

}