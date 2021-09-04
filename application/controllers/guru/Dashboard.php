<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Dashboard extends MY_Controller {

	
	public function get_data()
	{
		$data				=	$this->get_guru();
		$data['event']		=	$this->my_where('v_presensi_event', ['idguru_fk'=>$data['guru']['id_guru'], 'tanggal'=>date('Y-m-d')])->result_array();
		$data['mapel_hari_ini']	= [];	
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
		$this->my_view(['role/guru/page/dashboard/index_page/index','role/guru/page/dashboard/index_page/js'],$data);
	}
}