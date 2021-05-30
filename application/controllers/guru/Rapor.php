<?php

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
defined('BASEPATH') OR exit('No direct script access allowed');
class rapor extends MY_Controller {
	
	public $arr = [
			'title'				=>	'Halaman rapor',
			'table'				=>	'rapor',
			'column'			=>	[ 'uts'],
			'column_order'		=>	[ 'id_uts','uts'],
			'column_search'		=>	[ 'id_uts','uts'],
			'order'				=>	['id_uts'	=>	'DESC'],
			'id'				=>	'id_uts'
	];

	/*
		CHANGE PAGE
	*/
	public function rapor_online_index()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['dt_guru']	=	$this->get_guru();
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', [])->result_array();
		$data['mapel'] 		= 	$this->my_where('v_guru_mapel', ['id_guru'=>$data['account']['anggota_id']])->result_array();
		$this->my_view(['role/guru/page/rapor/index_page/index_rapor_online','role/guru/page/rapor/index_page/js_rapor_online'],$data);
	}
	public function rapor_index()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['dt_guru']	=	$this->get_guru();
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', [])->result_array();
		$data['mapel'] 		= 	$this->my_where('v_guru_mapel', ['id_guru'=>$data['account']['anggota_id']])->result_array();
		$this->my_view(['role/guru/page/rapor/index_page/index','role/guru/page/rapor/index_page/js'],$data);
	}
	
	public function proses_rapor($value='')
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', ['id_tahun_ajaran'=>$_POST['tahun_ajaran']])->row_array();
		$data['siswa']		=	$this->my_where('siswa', ['idkelas_fk'=>$_POST['id_kelas']])->result_array();
		$data['kelas']		=	$this->my_where('kelas', ['id_kelas'=>$_POST['id_kelas']])->row_array();
		$this->my_view(['role/guru/page/rapor/index_page/list_siswa'],$data);
	}
	public function proses_rapor_online($value='')
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', ['id_tahun_ajaran'=>$_POST['tahun_ajaran']])->row_array();
		$siswa				=	$this->my_where('siswa', ['idkelas_fk'=>$_POST['id_kelas']])->result_array();
		$data['kelas']		=	$this->my_where('kelas', ['id_kelas'=>$_POST['id_kelas']])->row_array();
		$data['siswa'] 		= [];
		foreach ($siswa as $key => $value) {
			$file = $this->my_where('file_rapor_online', ['idsiswa_fk'=>$value['id_siswa'], 'idtahunajaran_fk'=>$data['tahun_ajaran']['id_tahun_ajaran']])->row_array();
			$cek_file = 0;
			if (!empty($file)) {
				if (file_exists('include/media/file_rapor_online/'.$file['file_rapor_online'])) {
					$cek_file=$file['trans_code'];
				}
			}
			$data['siswa'][] = [
				'siswa' => $value,
				'file' => $cek_file
			];
		}
		$this->my_view(['role/guru/page/rapor/index_page/list_siswa_rapor_online'],$data);
	}
	public function print_pas($id_siswa='', $id_tahun_ajaran='', $id_kelas)
	{
		$data['siswa']		=	$this->my_where('siswa', ['id_siswa'=>$id_siswa])->row_array();
		$data['kelas']		=	$this->my_where('kelas', ['id_kelas'=>$id_kelas])->row_array();
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', ['id_tahun_ajaran'=>$id_tahun_ajaran])->row_array();
		$jenis_mata_pelajaran = $this->my_where('jenis_mata_pelajaran',[])->result_array();
		$data['rapor'] = [];
		foreach ($jenis_mata_pelajaran as $key => $value) {
			$rapor_per_mapel = [];
			$mapel = $this->my_where('v_guru_mapel', ['idjenismatapelajaran_fk'=>$value['id_jenis_mata_pelajaran'],'idkelas_fk'=>$id_kelas])->result_array();
			foreach ($mapel as $key => $value_mapel) {
				$pts 		= $this->my_where('v_nilai_pts', ['idsiswa_fk'=>$id_siswa,'idmatapelajaran_fk'=>$value_mapel['id_mata_pelajaran'], 'idtahunajaran_fk'=>$id_tahun_ajaran])->row_array();
				$pas 		= $this->my_where('v_nilai_pas', ['idsiswa_fk'=>$id_siswa,'idmatapelajaran_fk'=>$value_mapel['id_mata_pelajaran'], 'idtahunajaran_fk'=>$id_tahun_ajaran])->row_array();
				$nt 		= $this->db->query("select avg(nilai) as rata from v_nilai_pengetahuan where idsiswa_fk=".$id_siswa." and idmatapelajaran_fk=".$value_mapel['id_mata_pelajaran']." and idtahunajaran_fk=".$id_tahun_ajaran." and idjenispengetahuan_fk=1")->row_array();
				$nuh 		= $this->db->query("select avg(nilai) as rata from v_nilai_pengetahuan where idsiswa_fk=".$id_siswa." and idmatapelajaran_fk=".$value_mapel['id_mata_pelajaran']." and idtahunajaran_fk=".$id_tahun_ajaran." and idjenispengetahuan_fk=2")->row_array();
				$nh 		= (($nt['rata']+(2*$nuh['rata']))/3);
				$np 		= (((2*($nh)) + $pts['nilai'] + $pas['nilai'])/4);

				$nk 		= $this->db->query("select avg(nilai) as rata from v_nilai_keterampilan where idsiswa_fk=".$id_siswa." and idmatapelajaran_fk=".$value_mapel['id_mata_pelajaran']." and idtahunajaran_fk=".$id_tahun_ajaran)->row_array();
				$na 		=	(($np+$nk['rata'])/2);
				$predikat	=	$this->db->query("select*from predikat_nilai where nilai_awal<=".$na." and nilai_akhir>=".$na)->row_array();
				$rapor_per_mapel[] = [
					'mapel' =>	$value_mapel, 
					'pts'	=> 	$pts,
					'pas'	=> 	$pas,
					'nt'	=> 	$nt,
					'nuh'	=> 	$nuh,
					'nh'	=> 	$nh,
					'np'	=> 	$np,
					'nk'	=>	$nk['rata'],
					'na'	=>	$na,
					'predikat'	=>	$predikat['predikat']
				];
			}
			$data['rapor'][] = [
				'jenis_mata_pelajaran' 	=> $value,
				'rapor_per_mapel' 		=> $rapor_per_mapel
			];
		}
		$this->my_view(['role/guru/page/rapor/index_page/rapor_pas'],$data);
	}

	public function save_media($data)
	{
		$config['upload_path']=$data['path'] ; //path folder file upload
        $config['allowed_types']='gif|jpg|png|pdf|doc|docx|xls|xlsx'; //type file yang boleh di upload
        $config['encrypt_name'] = TRUE; //enkripsi file name upload
         
        $this->load->library('upload',$config); //call library upload 
        if($this->upload->do_upload($data['filename'])){ //upload file
           
        	return $this->upload->data(); 
        }

	}

	public function upload_rapor_online()
	{
		$upl = $this->save_media([
			'path'	=>	"./include/media/file_rapor_online/",
			'filename' => 'file_upload',
		]);

		if ($upl) {
		
			$data = [
				'idsiswa_fk' => $_POST['idsiswa_fk'],
				'file_rapor_online' => $upl['file_name'], 
				'idtahunajaran_fk'=>$_POST['idtahunajaran_fk'],
				'trans_code'=>rand(0,999999)
			];
			$this->save_data("file_rapor_online", $data);

			$data['account']	=	$this->get_user_account();
			$data['param'] 		= 	$this->arr;
			$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', ['id_tahun_ajaran'=>$_POST['idtahunajaran_fk']])->row_array();
			$siswa				=	$this->my_where('siswa', ['idkelas_fk'=>$_POST['idkelas_fk']])->result_array();
			$data['kelas']		=	$this->my_where('kelas', ['id_kelas'=>$_POST['idkelas_fk']])->row_array();
			$data['siswa'] 		= [];
			foreach ($siswa as $key => $value) {
				$file = $this->my_where('file_rapor_online', ['idsiswa_fk'=>$value['id_siswa'], 'idtahunajaran_fk'=>$data['tahun_ajaran']['id_tahun_ajaran']])->row_array();
				$cek_file = 0;
				if (!empty($file)) {
					if (file_exists('include/media/file_rapor_online/'.$file['file_rapor_online'])) {
						$cek_file=$file['trans_code'];
					}
				}
				$data['siswa'][] = [
					'siswa' => $value,
					'file' => $cek_file
				];
			}
			$this->my_view(['role/guru/page/rapor/index_page/list_siswa_rapor_online'],$data);

		}
	}
}