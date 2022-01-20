<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class pengaturan_lain extends MY_Controller {
	

	/*
		CHANGE PAGE
	*/


	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['profil']		=	$this->my_where('profil_website',[])->row_array();
		$this->my_view(['role/admin/page/pengaturan_lain/index','role/admin/page/pengaturan_lain/js_pengaturan_lain'],$data);
	}

	/*
		ADD DATA
	*/


	public function simpan_data()
	{

		$config2['upload_path']="./include/background";
        $config2['allowed_types']='gif|jpg|png';
        $config2['encrypt_name'] = TRUE;

        $this->load->library('upload',$config2);
        if($this->upload->do_upload("background")){
            $data2 = array('upload_data' => $this->upload->data());
            $data=[
			'nama_pengaturan_lain'		=>	$_POST['nama_pengaturan_lain'],
			'harga_pengaturan_lain'		=>	$_POST['harga_pengaturan_lain'],
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
		// 	if ($this->my_db_count('pengaturan_lain',['id_pengaturan_lain'=>$value['id_pengaturan_lain']])>0) {
		// 		$this->my_update('pengaturan_lain'
		// 			,[
		// 				'nama_keterangan'				=>	$value['nama_keterangan'],
		// 				'tanggal_mulai'					=>	$value['tanggal_mulai'],
		// 				'tanggal_selesai'				=>	$value['tanggal_selesai'],
		// 			]
		// 			,['id_pengaturan_lain'=>$value['id_pengaturan_lain']]);
		// 	}
		// }

		$data=[];
		$data=[
				'wa_text'				=>	$_POST['wa_text'],
				];
		if (!empty($_FILES['background']['name'])) {
			
			$config2['upload_path']="./include/setting_website/background";
	        $config2['allowed_types']='gif|jpg|png|jpeg';
	        $config2['encrypt_name'] = TRUE;

	        $this->load->library('upload',$config2);
	        if($this->upload->do_upload("background")){
	            $data2 = array('upload_data' => $this->upload->data());
	            $data['background'] = $data2['upload_data']['file_name'];
				
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