<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class Jadwal_pelajaran extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman siswa_kelas',
			'table'				=>	'jadwal_pelajaran',
			'column'			=>	[ 'siswa_kelas'],
			'column_order'		=>	[ 'id_siswa_kelas','siswa_kelas'],
			'column_search'		=>	[ 'id_siswa_kelas','siswa_kelas'],
			'order'				=>	['id_siswa_kelas'	=>	'DESC'],
			'id'				=>	'id_siswa_kelas'
	];

	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran',[])->result_array();
		$data['kelas']		=	$this->my_where('kelas',[])->result_array();
		$this->my_view(['role/admin/page/jadwal_pelajaran/index_page/index','role/admin/page/jadwal_pelajaran/index_page/js'],$data);
	}

	function get_jadwal($id, $idkelas)
	{
		$data['hari']		=	$this->my_where('hari',[])->result_array();
		$data['jadwal']		=	[];

		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran',['id_tahun_ajaran'=>$id])->row_array();
		$data['kelas']		=	$this->my_where('kelas',['id_kelas'=>$idkelas])->row_array();
		$data['mapel_guru']	=	$this->my_where('v_guru_mapel',['idkelas_fk'=>$idkelas, 'idtahunajaran_fk'=>$id])->result_array();
		$data['jam_pelajaran'] = $this->my_where('jam_pelajaran', ['idtahunajaran_fk'=>$id])->result_array();
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$jadwal = $this->my_where('jam_pelajaran',['idtahunajaran_fk'=>$id])->result_array();
		foreach ($jadwal as $key => $value) {
			$hari = $this->my_where('hari' , [])->result_array();
			$jadwal_hari = [];
			foreach ($hari as $key_hari => $value_hari) {
				$this->db->where('idtahunajaran_fk', $id);
				$this->db->where('idkelas_fk', $idkelas);
				$this->db->where('idhari_fk', $value_hari['id_hari']);
				$this->db->where('idjampelajaran_fk', $value['id_jam_pelajaran']);
				$jadwal_get = $this->db->get('v_jadwal_pelajaran')->row_array();
				$jadwal_hari[] = $jadwal_get; 
			}
			$data['jadwal'][] = [
					'jadwal'	=>	$jadwal_hari,
					'jam_pelajaran' => $value
			];
		}

		$this->my_view(['role/admin/page/jadwal_pelajaran/index_page/proses','role/admin/page/jadwal_pelajaran/index_page/modal'],$data);	
	}
	function proses_add_jadwal(){
		$idjamsampai = $_POST['idjamsampai'];

		if ($idjamsampai > $_POST['idjampelajaran_fk']) {
			$total = $idjamsampai - $_POST['idjampelajaran_fk'];

			for ($i=0; $i <= $total ; $i++) { 
				$data = [
					'idgurumapel_fk'		=>	$_POST['idgurumapel_fk'],
					'idhari_fk'				=>	$_POST['idhari_fk'],
					'idjampelajaran_fk'		=>	($_POST['idjampelajaran_fk']+$i)
				];

				$this->save_data('jadwal_pelajaran', $data);
			}
		}else{
			$data = [
					'idgurumapel_fk'		=>	$_POST['idgurumapel_fk'],
					'idhari_fk'				=>	$_POST['idhari_fk'],
					'idjampelajaran_fk'		=>	($_POST['idjampelajaran_fk'])
			];

			$this->save_data('jadwal_pelajaran', $data);
		}
	}
	function proses_ubah_jadwal(){
		$data = [
					'idgurumapel_fk'		=>	$_POST['idgurumapel_fk'],
			];

			$this->my_update('jadwal_pelajaran', $data, ['id_jadwal_pelajaran'=>$_POST['id_jadwal_pelajaran']]);
	}
	function delete_jadwal()
	{
		$this->db->delete('jadwal_pelajaran', ['id_jadwal_pelajaran'=>$_POST['idjadwal']]);
	}
}
