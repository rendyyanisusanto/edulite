<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Jurnal_guru extends MY_Controller {

	public function cek_jurnal(){
		$data				=	$this->get_guru();
		$data['mapel_hari_ini']	= [];	

		$data['tahun_ajaran']	=	$this->tahun_ajaran_aktif();
		$mapel_hari_ini 	=	$this->my_where('v_jadwal_pelajaran', ['idguru_fk' => $data['guru']['id_guru'], 'code' => date('N')])->result_array();
		
		foreach ($mapel_hari_ini as $key => $value) {
			$data['mapel_hari_ini'][] =[
				'mapel'		=>		$value,
				'absen'		=>		$this->my_where('presensi_harian', [
					'idmatapelajaran_fk'	=> $value['idmapel_fk'],
					'tanggal'				=>	date('Y-m-d'),	
					'idkelas_fk'			=>	$value['idkelas_fk'],
					'idtahunajaran_fk'		=>	$value['idtahunajaran_fk'],
				])->num_rows(),
				'jurnal_guru'		=>		$this->my_where('jurnal_guru', [
					'idmapel_fk'			=> $value['idmapel_fk'],
					'tanggal'				=>	date('Y-m-d'),	
					'idkelas_fk'			=>	$value['idkelas_fk'],
					'idtahunajaran_fk'		=>	$value['idtahunajaran_fk'],
				])->num_rows(),
				'catatan_siswa'		=>		$this->my_where('catatan_siswa', [
					'idmapel_fk'			=> $value['idmapel_fk'],
					'tanggal'				=>	date('Y-m-d'),	
					'idkelas_fk'			=>	$value['idkelas_fk'],
					'idguru_fk'				=>	$value['idguru_fk'],
					'idtahunajaran_fk'		=>	$value['idtahunajaran_fk'],
				])->num_rows(),
			]; 
		}
		$data['cek_kd']		=	$this->cek_kd();
		$data['tahun_ajaran']	=	$this->tahun_ajaran_aktif();


		if ($this->agent->is_mobile()) {
 			$this->my_view(['role/guru/page_mobile/jurnal/index_page/index','role/guru/page_mobile/jurnal/index_page/js'],$data);
 		}
 		
	}
	public function jurnal($idjadwal)
	{
		$data				=	$this->get_guru();
		$data['cek_kd']		=	$this->cek_kd();
		$data['tahun_ajaran']	=	$this->tahun_ajaran_aktif();
		$data['mapel_hari_ini']	=	$this->my_where('v_jadwal_pelajaran', ['id_jadwal_pelajaran' => $idjadwal])->row_array();
		$this->my_view(['role/guru/page/jurnal/index_page/index','role/guru/page/jurnal/index_page/js'],$data);
	}
	public function absen($idmapel)
	{
		$data['account']	=	$this->get_user_account();
		$mapel_get			=	$this->my_where('v_jadwal_pelajaran', ['id_jadwal_pelajaran'=>$idmapel])->row_array();
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', ['id_tahun_ajaran'=>$mapel_get['idtahunajaran_fk']])->row_array();
		$siswa		=	$this->my_where('siswa', ['idkelas_fk'=>$mapel_get['idkelas_fk']])->result_array();
		$data['kelas']		=	$this->my_where('kelas', ['id_kelas'=>$mapel_get['idkelas_fk']])->row_array();
		$data['mata_pelajaran']		=	$this->my_where('mata_pelajaran', ['id_mata_pelajaran'=>$mapel_get['idmapel_fk']])->row_array();
		$data['dt_guru']	=	$this->get_guru();
		$data['siswa'] = [];
		foreach ($siswa as $key => $value) {
			$presensi = $this->my_where('presensi_harian', [
				'idsiswa_fk' 			=> 	$value['id_siswa'],
				'idtahunajaran_fk'		=>	$mapel_get['idtahunajaran_fk'],
				'idkelas_fk'			=>	$mapel_get['idkelas_fk'],
				'idmatapelajaran_fk'	=>	$mapel_get['idmapel_fk'],
				'tanggal' 				=>	date('Y-m-d')
			])->row_array();

			$data['siswa'][] = [
				'siswa' => $value,
				'presensi' => !empty($presensi) ? $presensi : []
			];
 		}
 		if ($this->agent->is_mobile()) {
 			$this->my_view(['role/guru/page_mobile/jurnal/index_page/absen'],$data);
 		}else{
 			$this->my_view(['role/guru/page/jurnal/index_page/absen'],$data);
 		}
		
	}
	function presensi_prakerin($idkelompok='', $stat = '')
	{
		$data['keterangan'] = ($stat == 'M') ? "Masuk" : "Pulang";
		$data['stat']	=	$stat;
		$data['idkelompok']	= $idkelompok;
		$data['prakerin']=$this->my_where('prakerin_kelompok', ['id_prakerin_kelompok'=>$idkelompok])->row_array();
		$siswa = $this->my_where('prakerin_siswa', ['idprakerinkelompok_fk'=>$idkelompok])->result_array();
		$data['siswa'] = [];
		foreach ($siswa as $value) {
			$presensi = $this->my_where('presensi_prakerin', [
					'idsiswa_fk'			=>	$value['idsiswa_fk'],
					'idprakerinkelompok_fk' => 	$idkelompok,
					'tanggal'				=>	date('Y-m-d')
				])->row_array();

			$dtsiswa = $this->my_where('siswa', ['id_siswa'=>$value['idsiswa_fk']])->row_array();
		 	$data['siswa'][] = [
				'siswa' => $dtsiswa,
				'presensi' => !empty($presensi) ? $presensi : []
			];
		} 
		if ($this->agent->is_mobile()) {
 			$this->my_view(['role/guru/page_mobile/presensi_prakerin/index_page/absen'],$data);
 		}else{
 			$this->my_view(['role/guru/page/presensi_prakerin/index_page/absen'],$data);
 		}
	}
	function save_presensi_prakerin()
	{
		if (count($_POST['data']) > 0) {
			$stat = $_POST['stat'];
			foreach ($_POST['data'] as $key => $value) {
				$data = [
					'idprakerin_fk' 		=> 	$_POST['idprakerin_fk'],
					'idsiswa_fk'			=>	$value['idsiswa_fk'],
					(($stat == "M") ? 'presensi_masuk' : 'presensi_pulang')		=>	$value['presensi'],
					'tanggal'				=>	$_POST['tanggal'],
					'idprakerinkelompok_fk' => 	$_POST['idkelompok']
				];

				$presensi = $this->my_where('presensi_prakerin', [
					'idprakerin_fk' 		=> 	$_POST['idprakerin_fk'],
					'idsiswa_fk'			=>	$value['idsiswa_fk'],
					'idprakerinkelompok_fk' => 	$_POST['idkelompok'],
					'tanggal'				=>	$_POST['tanggal'],
				]);

				if ($presensi->num_rows() > 0) {
					 $this->my_update('presensi_prakerin', $data, ['id_presensi_prakerin'=>$presensi->row_array()['id_presensi_prakerin']]);
				}else{
					$this->save_data('presensi_prakerin', $data);
				}

			}
		}
		echo json_encode($_POST);
	}
	public function jurnal_guru_set($idmapel)
	{
		$mapel_get					=	$this->my_where('v_jadwal_pelajaran', ['id_jadwal_pelajaran'=>$idmapel])->row_array();
		$data['jurnal_guru']		=	$this->my_where('jurnal_guru', [
											'idguru_fk'			=>	$mapel_get['idguru_fk'],
											'idkelas_fk'		=>	$mapel_get['idkelas_fk'],
											'idmapel_fk'		=>	$mapel_get['idmapel_fk'],
											'idtahunajaran_fk'	=>	$mapel_get['idtahunajaran_fk'],
											'tanggal'			=>	date('Y-m-d')
										])->result_array();
		$this->my_view(['role/guru/page/jurnal/index_page/jurnal'],$data);
	}
	public function catatan($idmapel)
	{

		$mapel_get				=	$this->my_where('v_jadwal_pelajaran', ['id_jadwal_pelajaran'=>$idmapel])->row_array();
		$data['siswa']			=	$this->my_where('siswa', ['idkelas_fk'=>$mapel_get['idkelas_fk']])->result_array();
		$data['catatan_siswa']	=	$this->my_where('v_catatan_siswa', [
										'idguru_fk'			=>	$mapel_get['idguru_fk'],
										'idkelas_fk'		=>	$mapel_get['idkelas_fk'],
										'idmapel_fk'		=>	$mapel_get['idmapel_fk'],
										'idtahunajaran_fk'	=>	$mapel_get['idtahunajaran_fk'],
										'tanggal'			=>	date('Y-m-d')
									])->result_array();	
		$this->my_view(['role/guru/page/jurnal/index_page/catatan'],$data);
	}
	function save_jurnal_harian($idmapel){
		$mapel_get	=	$this->my_where('v_jadwal_pelajaran', ['id_jadwal_pelajaran'=>$idmapel])->row_array();
		$data = [
			'idguru_fk'			=>	$mapel_get['idguru_fk'],
			'idkelas_fk'		=>	$mapel_get['idkelas_fk'],
			'idmapel_fk'		=>	$mapel_get['idmapel_fk'],
			'idtahunajaran_fk'	=>	$mapel_get['idtahunajaran_fk'],
			'tanggal'			=>	date('Y-m-d'),
			'uraian'			=>	$_POST['uraian']
		];

		$this->save_data('jurnal_guru', $data);
	}

	function delete_jurnal($id){
		$this->db->delete('jurnal_guru', ['id_jurnal_guru'=>$id]);
	}
	function delete_catatan_siswa($id){
		$this->db->delete('catatan_siswa', ['id_catatan_siswa'=>$id]);
	}

	function update_jurnal_harian(){
		$data = [
			'uraian'			=>	$_POST['uraian']
		];

		if ($this->my_update('jurnal_guru', $data, ['id_jurnal_guru'=>$_POST['id_jurnal_guru']])) {
			# code...
		}
	}

	function save_catatan_siswa($idmapel){
		$mapel_get	=	$this->my_where('v_jadwal_pelajaran', ['id_jadwal_pelajaran'=>$idmapel])->row_array();
		$data = [
			'idguru_fk'			=>	$mapel_get['idguru_fk'],
			'idkelas_fk'		=>	$mapel_get['idkelas_fk'],
			'idmapel_fk'		=>	$mapel_get['idmapel_fk'],
			'idtahunajaran_fk'	=>	$mapel_get['idtahunajaran_fk'],
			'tanggal'			=>	date('Y-m-d'),
			'idsiswa_fk'		=>	$_POST['idsiswa_fk'],
			'teruskan_ke'		=>	$_POST['teruskan_ke'],
			'uraian'			=>	$_POST['uraian']
		];

		$this->save_data('catatan_siswa', $data);
	}
	function update_catatan_siswa(){
		$data = [
			'idsiswa_fk'		=>	$_POST['idsiswa_fk'],
			'teruskan_ke'		=>	$_POST['teruskan_ke'],
			'uraian'			=>	$_POST['uraian']
		];

		if ($this->my_update('catatan_siswa', $data, ['id_catatan_siswa'=>$_POST['id_catatan_siswa']])) {
			# code...
		}
	}
}