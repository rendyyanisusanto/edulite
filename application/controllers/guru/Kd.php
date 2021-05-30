<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class kd extends MY_Controller {

	public $arr = [
			'title'				=>	'Halaman kd',
			'table'				=>	'kd',
			'column'			=>	[ 'guru','singkatan'],
			'column_order'		=>	[ 'id_guru','guru','singkatan'],
			'column_search'		=>	[ 'id_guru','guru','singkatan'],
			'order'				=>	['id_guru'	=>	'DESC'],
			'id'				=>	'id_guru'
	];

	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['guru']		=	$this->my_where('guru', ['id_guru'=>$data['account']['anggota_id']])->row_array();
		$data['dt_guru']	=	$this->get_guru();
		$this->my_view(['role/guru/page/kd/index_page/index','role/guru/page/kd/index_page/js'],$data);
	}

	public function get_kd()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['id_mapel']	=	$_POST['id_mapel'];
		$data['id_kelas']	=	$_POST['id_kelas'];
		$data['id_guru']	=	$_POST['id_guru'];
		$data['id_tahun_ajaran']	=	$_POST['id_tahun_ajaran'];
		$data['mapel']		=	$this->my_where('mata_pelajaran', ['id_mata_pelajaran'=>$_POST['id_mapel']])->row_array();
		$data['kelas']		=	$this->my_where('kelas', ['id_kelas'=>$_POST['id_kelas']])->row_array();
		$this->my_view(['role/guru/page/kd/index_page/panel_kd','role/guru/page/kd/index_page/js_kd'],$data);
	}

	public function add_kd()
	{
		$rand = rand(0,99999).rand(0,99999);
		$data = [
			'materi'			=>	$_POST['materi'],
			'file_materi'		=>	'',
			'file_rpp'			=>	'',
			'trans_code'		=>	$rand,
			'idkelas_fk'		=>	$_POST['id_kelas'],
			'idguru_fk'			=>	$_POST['id_guru'],
			'idtahunajaran_fk'	=>	$_POST['id_tahun_ajaran'],
			'idmatapelajaran_fk'=>	$_POST['id_mata_pelajaran'],
		];
		$this->save_data('materi',$data);

		$materi = $this->my_where('materi', $data)->row_array();

		if (isset($_POST['kdtiga'])) {
			$data_kd_tiga = [
				'idkelas_fk'			=>	$_POST['id_kelas'],
				'idjenispenilaian_fk'	=>	'3',
				'idmatapelajaran_fk'	=>	$_POST['id_mata_pelajaran'],
				'kode'					=>	'',
				'ringkasan'				=>	$_POST['kdtiga'],
				'idmateri_fk'			=>	$materi['id_materi'],
				'idtahunajaran_fk'	=>	$_POST['id_tahun_ajaran'],
				'idguru_fk'				=>	$_POST['id_guru']
			];
			
		$this->save_data('kd',$data_kd_tiga);
		}

		if (isset($_POST['kdempat'])) {
			$data_kd_empat = [
				'idkelas_fk'			=>	$_POST['id_kelas'],
				'idjenispenilaian_fk'	=>	'4',
				'idmatapelajaran_fk'	=>	$_POST['id_mata_pelajaran'],
				'kode'					=>	'',
				'ringkasan'				=>	$_POST['kdempat'],
				'idtahunajaran_fk'	=>	$_POST['id_tahun_ajaran'],
				'idmateri_fk'			=>	$materi['id_materi'],
				'idguru_fk'				=>	$_POST['id_guru']
			];
			
		$this->save_data('kd',$data_kd_empat);
		}
	}
	public function get_data_kd()
	{
		$materi = $this->my_where('materi', [
			'idkelas_fk'		=>	$_POST['id_kelas'],
			'idguru_fk'			=>	$_POST['id_guru'],
			'idtahunajaran_fk'	=>	$_POST['id_tahun_ajaran'],
			'idmatapelajaran_fk'=>	$_POST['id_mata_pelajaran'],
		])->result_array();
		$send = '';
		foreach ($materi as $key => $value) {
			$kdtiga = $this->my_where('kd', [
				'idmateri_fk' => $value['id_materi'],
				'idjenispenilaian_fk'=> 3
			])->row_array();
			$kdempat = $this->my_where('kd', [
				'idmateri_fk' => $value['id_materi'],
				'idjenispenilaian_fk'=> 4
			])->row_array();
			$send .= '
			<div class="panel panel-body"> 
				<b>Materi </b> : '.$value['materi'].'<br/>
				<b>KD 3 - Pengetahuan </b>: '.$kdtiga['ringkasan'].'<br/>
				<b>KD 4 - Keterampilan </b>: '.$kdempat['ringkasan'].'
			</div>
			';
		}
		echo $send;

	}
}
