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

	public function duplicat()
	{

		$data['idmatapelajaran_fk']	=	$_POST['id_mata_pelajaran'];
		$data['idguru_fk']	=	$_POST['id_guru'];
		$data['idkelas_fk']	=	$_POST['idkelas_fk'];
		$data['idtahunajaran_fk']	=	$_POST['id_tahun_ajaran'];

		$data['pelajaran']	=	$this->my_where('v_guru_mapel', ['idguru_fk'=>$_POST['id_guru'], 'idmapel_fk'=>$_POST['id_mata_pelajaran'], 'idtingkat_fk'=>$_POST['id_tingkat'],'idtahunajaran_fk'	=>	$_POST['id_tahun_ajaran'], 'idkelas_fk <>'=>$_POST['idkelas_fk']])->result_array();
		$materi = $this->my_where('materi', [
			'idkelas_fk'		=>	$_POST['idkelas_fk'],
			'idguru_fk'			=>	$_POST['id_guru'],
			'idtahunajaran_fk'	=>	$_POST['id_tahun_ajaran'],
			'idmatapelajaran_fk'=>	$_POST['id_mata_pelajaran'],
		])->num_rows();
		if ($materi > 0) {
			$this->my_view(['role/guru/page/kd/index_page/panel_duplicat'],$data);
		}else{
			echo "<h3 class='text-danger text-center'>Tidak ada data(Materi dan KD) yang bisa di duplikat</h3>";
		}
		
	}

	public function duplikat_proses()
	{
		foreach ($_POST['kelas'] as $key => $value) {
			$guru_mapel_get = $this->my_where('guru_mapel', ['id_guru_mapel'=>$value])->row_array();

			$get_materi = $this->my_where('materi',[
				'idkelas_fk'		=>	$_POST['idkelas_fk'],
				'idguru_fk'			=>	$_POST['idguru_fk'],
				'idtahunajaran_fk'	=>	$_POST['idtahunajaran_fk'],
				'idmatapelajaran_fk'=>	$_POST['idmatapelajaran_fk'],
			])->result_array();

			foreach ($get_materi as $key_materi => $value_materi) {
				$rand = rand(0,99999).rand(0,99999);
				$data = [
					'materi'			=>	$value_materi['materi'],
					'file_materi'		=>	'',
					'file_rpp'			=>	'',
					'idkelas_fk'		=>	$guru_mapel_get['idkelas_fk'],
					'idguru_fk'			=>	$_POST['idguru_fk'],
					'idtahunajaran_fk'	=>	$_POST['idtahunajaran_fk'],
					'idmatapelajaran_fk'=>	$_POST['idmatapelajaran_fk'],
				];
				if ($this->my_where('materi', $data)->num_rows() == 0) {

					$data['trans_code']	=	$rand;
					$this->save_data('materi',$data);
				}

				$materi = $this->my_where('materi', $data)->row_array();
				$kdtiga = $this->my_where('kd', [
						'idkelas_fk'			=>	$value_materi['idkelas_fk'],
						'idjenispenilaian_fk'	=>	'3',
						'idmatapelajaran_fk'	=>	$value_materi['idmatapelajaran_fk'],
						'idmateri_fk'			=>	$value_materi['id_materi'],
						'idtahunajaran_fk'		=>	$value_materi['idtahunajaran_fk'],
						'idguru_fk'				=>	$value_materi['idguru_fk']
				])->row_array();

				$kdempat = $this->my_where('kd', [
						'idkelas_fk'			=>	$value_materi['idkelas_fk'],
						'idjenispenilaian_fk'	=>	'4',
						'idmatapelajaran_fk'	=>	$value_materi['idmatapelajaran_fk'],
						'idmateri_fk'			=>	$value_materi['id_materi'],
						'idtahunajaran_fk'		=>	$value_materi['idtahunajaran_fk'],
						'idguru_fk'				=>	$value_materi['idguru_fk']
				])->row_array();


					$data_kd_tiga = [
						'idkelas_fk'			=>	$guru_mapel_get['idkelas_fk'],
						'idjenispenilaian_fk'	=>	'3',
						'idmatapelajaran_fk'	=>	$_POST['idmatapelajaran_fk'],
						'kode'					=>	'',
						'ringkasan'				=>	$kdtiga['ringkasan'],
						'idmateri_fk'			=>	$materi['id_materi'],
						'idtahunajaran_fk'		=>	$_POST['idtahunajaran_fk'],
						'idguru_fk'				=>	$_POST['idguru_fk']
					];
				
				if ($this->my_where('kd', $data_kd_tiga)->num_rows() == 0) {
					$this->save_data('kd',$data_kd_tiga);
				}					
				

					$data_kd_empat = [
						'idkelas_fk'			=>	$guru_mapel_get['idkelas_fk'],
						'idjenispenilaian_fk'	=>	'4',
						'idmatapelajaran_fk'	=>	$_POST['idmatapelajaran_fk'],
						'kode'					=>	'',
						'ringkasan'				=>	$kdempat['ringkasan'],
						'idtahunajaran_fk'		=>	$_POST['idtahunajaran_fk'],
						'idmateri_fk'			=>	$materi['id_materi'],
						'idguru_fk'				=>	$_POST['idguru_fk']
					];
					
				if ($this->my_where('kd', $data_kd_empat)->num_rows() == 0) {
					$this->save_data('kd',$data_kd_empat);
				}	
			}

		}
		
		echo json_encode($_POST);
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
	public function update_kd()
	{
		$this->my_update('materi', ['materi'=>$_POST['materi']], ['id_materi'=>$_POST['idmateri_fk']]);
		$this->my_update('kd', ['ringkasan'=>$_POST['kdtiga']], ['idmateri_fk'=>$_POST['idmateri_fk'], 'idjenispenilaian_fk'=>'3']);
		$this->my_update('kd', ['ringkasan'=>$_POST['kdempat']], ['idmateri_fk'=>$_POST['idmateri_fk'], 'idjenispenilaian_fk'=>'4']);
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
			<div class="panel">
				<div class="panel-heading">
					
					<div class="heading-elements">
						<ul class="icons-list">
						 <li><button data-id="'.$value['id_materi'].'" data-materi="'.$value['materi'].'" data-kdtiga="'.$kdtiga['ringkasan'].'" data-kdempat="'.$kdempat['ringkasan'].'" class="btn btn-success btn-sm btn-edit" type="button"><i class="icon-pencil3"></i></button></li>
						 <li><button class="btn btn-danger btn-sm btn-del" data-id="'.$value['id_materi'].'"><i class="icon-trash"></i></button></li>
						</ul>
					</div>
				</div>
				<div class=" panel-body"> 
					<b>Materi </b> : '.$value['materi'].'<br/>
					<b>KD 3 - Pengetahuan </b>: '.$kdtiga['ringkasan'].'<br/>
					<b>KD 4 - Keterampilan </b>: '.$kdempat['ringkasan'].'
				</div>
			</div>
			';
		}
		echo $send;
	}
	public function hapus_data($id='')
	{
		$this->db->delete('materi',  ['id_materi'=>$id]);
		$this->db->delete('kd',  ['idmateri_fk'=>$id]);
	}
}
