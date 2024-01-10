<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Dashboard extends MY_Controller {

	
	public function get_data()
	{
		$data				=	$this->get_guru();
		$data['event']		=	$this->my_where('v_presensi_event', ['idguru_fk'=>$data['guru']['id_guru'], 'tanggal'=>date('Y-m-d')])->result_array();
		$data['mapel_hari_ini']	= [];	

		$data['tahun_ajaran']	=	$this->tahun_ajaran_aktif();
		$mapel_hari_ini 	=	$this->my_where('v_jadwal_pelajaran', ['idguru_fk' => $data['guru']['id_guru'], 'code' => date('N')])->result_array();
		$data['jadwal_guru']	=  $this->cek_jadwal_guru_hari_ini($data['guru']['id_guru'], $data['tahun_ajaran']['id_tahun_ajaran']);
		$data['presensi']		=	$this->cek_presensi_guru_hari_ini($data['guru']['id_guru'], $data['tahun_ajaran']['id_tahun_ajaran']);
		$data['ijin_siswa']		=	$this->db->query("select * from ijin_siswa where tanggal='".date('Y-m-d')."'")->num_rows();
		$data['kelas']			=	$this->my_where('kelas', [])->result_array();
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


		// prakerin

		$data['prakerin']		=	[];
		$prakerin				=	$this->my_where('v_prakerin_kelompok', ['status'=>1])->result_array();
		foreach ($prakerin as $value) {
			$data['prakerin'][] = [
				'prakerin' => $value,
				'absen_masuk_prakerin' => $this->my_where('presensi_prakerin', ['idprakerinkelompok_fk'=>$value['id_prakerin_kelompok'], 'tanggal'	=>	date('Y-m-d'), 'presensi_masuk !='	=> 'NULL'  ])->num_rows(),
				'absen_pulang_prakerin' => $this->my_where('presensi_prakerin', ['idprakerinkelompok_fk'=>$value['id_prakerin_kelompok'], 'tanggal'	=>	date('Y-m-d'), 'presensi_pulang !='	=> 'NULL'  ])->num_rows(), 
			];
		}
		$this->my_view(['role/guru/page/dashboard/index_page/index','role/guru/page/dashboard/index_page/js'],$data);
	}

	public function ijin_siswa()
	{
		$filterkelas = (!empty($_POST['id_kelas'])) ? "idkelas_fk = ".$_POST['id_kelas']. ' and ' : "" ;
		$data['ijin']	=	$this->db->query("select *, (select kelas from kelas where idkelas_fk = id_kelas) as kelas from v_ijin_siswa where ".$filterkelas." tanggal = '".date('Y-m-d')."'")->result_array();

		$this->my_view(['role/guru/page/dashboard/index_page/ijin_siswa'],$data);
	}

	function check()
	{
		$guru				=	$this->get_guru();
		$send 				=	'';
		$status				=	$_POST['status'];
		$tahun_ajaran		=	$this->my_where('tahun_ajaran',['is_active'=>1])->row_array();
		$data = [
			'idguru_fk'			=>	$guru['guru']['id_guru'],
			'tanggal'			=>	date('Y-m-d'),
			'jam_masuk'			=>	($status == 0) ? date('H:i:s'):'',
			'jam_keluar'		=>	($status == 1) ? date('H:i:s'):'',
			'idtahunajaran_fk'	=>	$tahun_ajaran['id_tahun_ajaran']
		];

		$cek = $this->my_where('presensi_guru', [
			'idguru_fk'			=>	$guru['guru']['id_guru'],
			'tanggal'			=>	date('Y-m-d'),
			'idtahunajaran_fk'	=>	$tahun_ajaran['id_tahun_ajaran']
		]);

		if ($cek->num_rows() == 0) {
			if ($this->save_data('presensi_guru', $data)) {
				# code...
			}
		}else{
			$row = $cek->row_array();
			if ($status == 1) {

				if (empty($row['jam_keluar']) || $row['jam_keluar']== '00:00:00') {
					
					$this->my_update('presensi_guru', ['jam_keluar'=>date('H:i:s')], [
						'idguru_fk'			=>	$guru['guru']['id_guru'],
						'tanggal'			=>	date('Y-m-d'),
						'idtahunajaran_fk'	=>	$tahun_ajaran['id_tahun_ajaran']
					]);

				}
			}
			if ($status == 0) {
				if (empty($row['jam_masuk']) || $row['jam_masuk']== '00:00:00') {
					$this->my_update('presensi_guru', ['jam_masuk'=>date('H:i:s')], [
						'idguru_fk'			=>	$guru['guru']['id_guru'],
						'tanggal'			=>	date('Y-m-d'),
						'idtahunajaran_fk'	=>	$tahun_ajaran['id_tahun_ajaran']
					]);
				}
			}
			

			
		}

		echo json_encode($send);
	}
}