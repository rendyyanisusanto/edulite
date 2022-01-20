<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class profil_website extends MY_Controller {
	

	/*
		CHANGE PAGE
	*/


	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['profil']		=	$this->my_where('profil_website',[])->row_array();
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
		// foreach ($_POST['data'] as $key => $value) {
		// 	if ($this->my_db_count('profil_website',['id_profil_website'=>$value['id_profil_website']])>0) {
		// 		$this->my_update('profil_website'
		// 			,[
		// 				'nama_keterangan'				=>	$value['nama_keterangan'],
		// 				'tanggal_mulai'					=>	$value['tanggal_mulai'],
		// 				'tanggal_selesai'				=>	$value['tanggal_selesai'],
		// 			]
		// 			,['id_profil_website'=>$value['id_profil_website']]);
		// 	}
		// }

		$data=[];
		$data=[
				'nama_website'				=>	$_POST['nama_website'],
				'singkatan'					=>	$_POST['singkatan'],
				'pemilik'					=>	$_POST['pemilik'],
				'alamat'					=>	$_POST['alamat'],
				'no_hp'						=>	$_POST['no_hp'],
				'email'						=>	$_POST['email'],
				'facebook'					=>	$_POST['facebook'],
				'twitter'					=>	$_POST['twitter'],
				'youtube'					=>	$_POST['youtube'],
				'instagram'					=>	$_POST['instagram'],
				];
		if (!empty($_FILES['logo']['name'])) {
			
			$config2['upload_path']="./include/logo";
	        $config2['allowed_types']='gif|jpg|png|jpeg';
	        $config2['encrypt_name'] = TRUE;

	        $this->load->library('upload',$config2);
	        if($this->upload->do_upload("logo")){
	            $data2 = array('upload_data' => $this->upload->data());
	            $data['logo'] = $data2['upload_data']['file_name'];
				
	        }
        }

        

				
		if ($this->my_update('profil_website',$data,[])) {
			$this->get_data();
		}	else 	{
			echo "error";
		}

	}

	/*
		DELETE DATA
	*/

}