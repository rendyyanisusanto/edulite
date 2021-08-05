<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Data_profil extends MY_Controller {

	
	public function get_data()
	{
		$data				=	$this->get_guru();
		$this->my_view(['role/guru/page/data_profil/index_page/index','role/guru/page/data_profil/index_page/js'],$data);
	}
	public function akun()
	{
		$data				=	$this->get_guru();
		$this->my_view(['role/guru/page/data_profil/index_page/akun','role/guru/page/data_profil/index_page/jsakun'],$data);
	}

	public function update_akun()
	{
		$old_password = $this->input->post('old_password');
		$password_matches = $this->ion_auth->hash_password_db($_POST['id'], $old_password);
		if ($password_matches) {
			 $data = [
			          'username' => $_POST['username'],
			          'password' => $_POST['password'],
		           	 ];
		    $this->ion_auth->update($_POST['id'], $data);
		}
		echo json_encode(['status'=>$password_matches]);
	}

	function update_data()
	{
		$foto = '';
		if(file_exists($_FILES['foto']['tmp_name']) || is_uploaded_file($_FILES['foto']['tmp_name'])) {
			$foto = $this->save_media([
				'path'	=>	"./include/media/foto_pegawai/",
				'filename' => 'foto',
			]);
		}
		


		$data = [
			'nama'					=>	$_POST['nama'],
			'nip'					=>	$_POST['nip'],
			'alamat'				=>	$_POST['alamat'],
			'email'					=>	$_POST['email'],
			'no_hp'					=>	$_POST['no_hp'],
			'jenis_kelamin'			=>	$_POST['jenis_kelamin'],
			'tempat_lahir'			=>	$_POST['tempat_lahir'],
			'tanggal_lahir'			=>	$_POST['tanggal_lahir'],
			'agama'					=>	$_POST['agama'],
			'kewarganegaraan'		=>	$_POST['kewarganegaraan'],
			'status_pernikahan'		=>	$_POST['status_pernikahan'],
			'status_rumah'			=>	$_POST['status_rumah'],
			'jarak_ke_kantor'		=>	$_POST['jarak_ke_kantor'],
			'bb'					=>	$_POST['bb'],
			'tb'					=>	$_POST['tb'],
			'gd'					=>	$_POST['gd'],
			'penyakit'				=>	$_POST['penyakit'],
			'kelainan'				=>	$_POST['kelainan'],
			'no_karpeg'				=>	$_POST['no_karpeg'],
			'mulai_bertugas'		=>	$_POST['mulai_bertugas'],
			'berasal_dari'			=>	$_POST['berasal_dari'],
			'tanggal_meninggalkan'	=>	$_POST['tanggal_meninggalkan'],
			'alasan_meninggalkan'	=>	$_POST['alasan_meninggalkan'],
			'istri'					=>	$_POST['istri'],
			'status_kepegawaian'	=>	$_POST['status_kepegawaian'],
			'no_taspen'				=>	$_POST['no_taspen']
		];
		if(file_exists($_FILES['foto']['tmp_name']) || is_uploaded_file($_FILES['foto']['tmp_name'])) {
			$data['foto'] = ((isset($foto)) ? $foto['file_name'] : '');
		}

		if ($this->my_update('guru', $data, ['id_guru'=>$_POST['id_guru']])) {
			$this->get_data();
		}	else 	{
			echo "error";
		}

	}

}