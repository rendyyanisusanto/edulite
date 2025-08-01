<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class pengajuan_karakter_siswa extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman pengajuan_karakter_siswa',
			'table'				=>	'pengajuan_karakter_siswa',
			'column'			=>	[],
			'column_order'		=>	[ 'id_pengajuan_karakter_siswa'],
			'column_search'		=>	[ 'id_pengajuan_karakter_siswa'],
			'order'				=>	['id_pengajuan_karakter_siswa'	=>	'DESC'],
			'id'				=>	'id_pengajuan_karakter_siswa',
			'parents_link'		=>	'role/guru/page/pengajuan_karakter_siswa'
	];

	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;

 		$this->my_view(['role/guru/page_mobile/pengajuan_karakter_siswa/index_page/index','role/guru/page_mobile/pengajuan_karakter_siswa/index_page/js'],$data);
 		
		
	}

    function get_data_request(){
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['guru']		=	$this->get_guru();
		$data['pengajuan_karakter_siswa']	=	$this->db->query('select * from pengajuan_karakter_siswa where idguru_fk='.$data['guru']['guru']['id_guru'].' order by id_pengajuan_karakter_siswa desc limit 10')->result_array();
		$this->my_view(['role/guru/page_mobile/pengajuan_karakter_siswa/index_page/get_data'],$data);
	}

    public function add_page()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		
 		$this->my_view(['role/guru/page_mobile/pengajuan_karakter_siswa/add_page/index','role/guru/page_mobile/pengajuan_karakter_siswa/add_page/js'],$data);
	}

    public function simpan_data()
	{
		try {
			$this->load->helper('minio');
			$foto_nama = null;

			$data = [
                'tanggal' => $_POST['tanggal'],
                'jenis' => $_POST['jenis'],
                'siswa' => $_POST['siswa'],
                'keterangan' => $_POST['keterangan'],
                'idguru_fk' => $this->get_user_account()['id_guru']
			];

			if ($this->db->insert('pengajuan_karakter_siswa', $data)) {
				$id = $this->db->insert_id();

				// 🚀 Upload foto ke MinIO
				if (!empty($_FILES['foto']['name'])) {
					$foto_nama = upload_to_minio('foto', 'pengajuan_karakter_siswa', $id, 'foto', true); // compress gambar
					$this->db->update('pengajuan_karakter_siswa', ['foto' => $foto_nama], ['id' => $id]);
				}

				echo json_encode(['status' => 200, 'msg' => 'Data santri berhasil disimpan']);
			} else {
				echo json_encode(['status' => 500, 'msg' => 'Data santri gagal disimpan']);
			}
		} catch (Exception $e) {
			echo json_encode(['status' => 500, 'msg' => $e->getMessage()]);
		}
	}

}