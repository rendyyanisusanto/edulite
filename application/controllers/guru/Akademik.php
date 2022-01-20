<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class akademik extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman siswa_kelas',
			'table'				=>	'akademik',
			'column'			=>	[ 'siswa_kelas'],
			'column_order'		=>	[ 'id_siswa_kelas','siswa_kelas'],
			'column_search'		=>	[ 'id_siswa_kelas','siswa_kelas'],
			'order'				=>	['id_siswa_kelas'	=>	'DESC'],
			'id'				=>	'id_siswa_kelas'
	];

	/*
		CHANGE PAGE
	*/
	public function presensi_siswa()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['dt_guru']	=	$this->get_guru();
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', [])->result_array();
		$data['mata_pelajaran']		=	$this->my_where('mata_pelajaran', [])->result_array();
		$data['mapel'] 		= 	$this->my_where('v_guru_mapel', ['id_guru'=>$data['account']['anggota_id']])->result_array();

 			$this->my_view(['role/guru/page/akademik/presensi_siswa/index','role/guru/page/akademik/presensi_siswa/js'],$data);
	}

	public function jurnal()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['dt_guru']	=	$this->get_guru();
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', [])->result_array();
		$data['mata_pelajaran']		=	$this->my_where('mata_pelajaran', [])->result_array();
		$data['mapel'] 		= 	$this->my_where('v_guru_mapel', ['id_guru'=>$data['account']['anggota_id']])->result_array();
		$this->my_view(['role/guru/page/akademik/jurnal_siswa/index','role/guru/page/akademik/jurnal_siswa/js'],$data);
	}

	public function nilai_tugas()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['dt_guru']	=	$this->get_guru();
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', [])->result_array();
		$data['mata_pelajaran']		=	$this->my_where('mata_pelajaran', [])->result_array();
		$data['mapel'] 		= 	$this->my_where('v_guru_mapel', ['id_guru'=>$data['account']['anggota_id']])->result_array();
		$this->my_view(['role/guru/page/akademik/nilai_tugas/index','role/guru/page/akademik/nilai_tugas/js'],$data);
	}

	public function catatan()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['dt_guru']	=	$this->get_guru();
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', [])->result_array();
		$data['mata_pelajaran']		=	$this->my_where('mata_pelajaran', [])->result_array();
		$data['mapel'] 		= 	$this->my_where('v_guru_mapel', ['id_guru'=>$data['account']['anggota_id']])->result_array();
		$this->my_view(['role/guru/page/akademik/catatan/index','role/guru/page/akademik/catatan/js'],$data);
	}

	public function proses_presensi_harian()
	{
		$idmapel 			=	$_POST['idmatapelajaran_fk'];
		$data['account']	=	$this->get_user_account();
		$data['tanggal']	=	$_POST['tanggal'];
		$mapel_get			=	$this->my_where('v_guru_mapel', ['id_guru_mapel'=>$idmapel])->row_array();
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', ['id_tahun_ajaran'=>$mapel_get['idtahunajaran_fk']])->row_array();
		$siswa				=	$this->my_where('siswa', ['idkelas_fk'=>$mapel_get['idkelas_fk']])->result_array();

		$data['kelas']		=	$this->my_where('kelas', ['id_kelas'=>$mapel_get['idkelas_fk']])->row_array();
		$data['mata_pelajaran']		=	$this->my_where('mata_pelajaran', ['id_mata_pelajaran'=>$mapel_get['idmapel_fk']])->row_array();
		$cek_jadwal			=	$this->my_where('jadwal_pelajaran', [
			'idgurumapel_fk' 	=>	$idmapel,
			'idhari_fk'			=>	date_format(date_create($_POST['tanggal']),'w'),
		])->num_rows();

		if ($cek_jadwal > 0) {
			$data['siswa'] = [];
			foreach ($siswa as $key => $value) {
				$presensi = $this->my_where('presensi_harian', [
					'idsiswa_fk' 		=>	$value['id_siswa'],
					'idtahunajaran_fk'	=>	$mapel_get['idtahunajaran_fk'],
					'idkelas_fk'		=>	$mapel_get['idkelas_fk'],
					'tanggal' 			=>	$_POST['tanggal']
				])->row_array();

				$data['siswa'][] = [
					'siswa' => $value,
					'presensi' => !empty($presensi) ? $presensi : []
				];
	 		}
	 		if ($this->agent->is_mobile()) {
				$this->my_view(['role/guru/page_mobile/akademik/presensi_siswa/absen'],$data);
	 		}else{
	 			$this->my_view(['role/guru/page/akademik/presensi_siswa/absen'],$data);
	 		}
		}
		else{
			echo "<center><h3>Tidak ada jadwal pelajaran</h3></center>";
		}
		
	}
	public function proses_jurnal($value='', $tanggal = '')
	{

		$idmapel 			=	($value == '') ? $_POST['idmatapelajaran_fk'] : $value;
		$mapel_get			=	$this->my_where('v_jadwal_pelajaran', ['idgurumapel_fk'=>$idmapel])->row_array();
		$data['mapel']		=	$idmapel;
		$data['tanggal']	=	($tanggal == '') ? $_POST['tanggal'] : $tanggal;
		$cek_jadwal			=	$this->my_where('jadwal_pelajaran', [
			'idgurumapel_fk' 	=>	$idmapel,
			'idhari_fk'			=>	date_format(date_create($data['tanggal']),'w'),
		])->num_rows();

		// print_r($mapel_get);

		if ($cek_jadwal > 0) {
			$data['jurnal_guru']		=	$this->my_where('jurnal_guru', [
											'idguru_fk'			=>	$mapel_get['idguru_fk'],
											'idkelas_fk'		=>	$mapel_get['idkelas_fk'],
											'idmapel_fk'		=>	$mapel_get['idmapel_fk'],
											'idtahunajaran_fk'	=>	$mapel_get['idtahunajaran_fk'],
											'tanggal'			=>	date('Y-m-d')
										])->result_array();
			$this->my_view(['role/guru/page/akademik/jurnal_siswa/jurnal'],$data);
		}else{
			echo "<center><h3>Tidak ada jadwal pelajaran</h3></center>";
		}
	}
	public function proses_catatan($value='', $tanggal = '')
	{

		$idmapel 			=	($value == '') ? $_POST['idmatapelajaran_fk'] : $value;
		$data['mapel']		=	$idmapel;
		$data['tanggal']	=	($tanggal == '') ? $_POST['tanggal'] : $tanggal;
		$cek_jadwal			=	$this->my_where('v_jadwal_pelajaran', [
			'idgurumapel_fk' 	=>	$idmapel,
			'idhari_fk'			=>	date_format(date_create($data['tanggal']),'w'),
		]);
		if ($cek_jadwal->num_rows() > 0) {

			$mapel_get			=	$cek_jadwal->row_array();
			$data['mapel_get']		=	$mapel_get;
			$data['siswa']			=	$this->my_where('siswa', ['idkelas_fk'=>$mapel_get['idkelas_fk']])->result_array();

			$data['kelas']		=	$this->my_where('kelas', ['id_kelas'=>$mapel_get['idkelas_fk']])->row_array();
			$data['catatan_siswa']	=	$this->my_where('v_catatan_siswa', [
											'idguru_fk'			=>	$mapel_get['idguru_fk'],
											'idkelas_fk'		=>	$mapel_get['idkelas_fk'],
											'idmapel_fk'		=>	$mapel_get['idmapel_fk'],
											'idtahunajaran_fk'	=>	$mapel_get['idtahunajaran_fk'],
											'tanggal'			=>	date('Y-m-d')
										])->result_array();	
			$this->my_view(['role/guru/page/akademik/catatan/catatan'],$data);
		}else{
			echo "<center><h3>Tidak ada jadwal pelajaran</h3></center>";
		}
	}

	public function proses_get_kelas()
	{
		$data['guru_mapel']		=	$this->my_where('guru_mapel', ['id_guru_mapel'=>$_POST['id_guru_mapel']])->row_array();
		$data['kd_get']			=	$this->my_where('input_nilai_pengetahuan', [
			'idmatapelajaran_fk'		=>	$data['guru_mapel']['idmapel_fk'],
			'idtahunajaran_fk'			=>	$data['guru_mapel']['idtahunajaran_fk'],
			'idguru_fk'					=>	$data['guru_mapel']['idguru_fk'],
			'idkelas_fk'				=>	$data['guru_mapel']['idkelas_fk'],
		])->result_array();
		$this->my_view(['role/guru/page/akademik/nilai_tugas/modal_pengetahuan', 'role/guru/page/akademik/nilai_tugas/view_all_kd'],$data);
	}
	public function get_modal_np()
	{
		$data['set']	=	[
			'idkelas_fk'			=>	$_POST['idkelas_fk'],
			'idmatapelajaran_fk'	=>	$_POST['idmatapelajaran_fk'],
			'idtahunajaran_fk'		=>	$_POST['idtahunajaran_fk'],
			'idguru_fk'				=>	$_POST['idguru_fk'],
			'idjenispenilaian_fk'	=>	3
		];
		$data['kd']	=	$this->my_where('kd',$data['set'] )->result_array();
		$data['jenis_pengetahuan']	=	$this->my_where('jenis_pengetahuan', [])->result_array();
		$this->my_view(['role/guru/page/akademik/nilai_tugas/add_nilai_tugas'],$data);
	}
	public function save_presensi_harian()
	{
		if (count($_POST['data']) > 0) {
			foreach ($_POST['data'] as $key => $value) {
				$data = [
					'idmatapelajaran_fk' 	=> 	$_POST['idmatapelajaran_fk'],
					'idsiswa_fk'			=>	$value['idsiswa_fk'],
					'presensi'				=>	$value['presensi'],
					'keterangan'			=>	"",
					'tanggal'				=>	$_POST['tanggal'],
					'idtahunajaran_fk'		=>	$_POST['idtahunajaran_fk'],
					'idkelas_fk'			=>	$_POST['idkelas_fk'],
				];

				$presensi = $this->my_where('presensi_harian', [
					'idsiswa_fk' 			=> 	$value['idsiswa_fk'],
					'idtahunajaran_fk'		=>	$_POST['idtahunajaran_fk'],
					'idkelas_fk'			=>	$_POST['idkelas_fk'],
					'tanggal'				=>	$_POST['tanggal'],
					'idmatapelajaran_fk' 	=> 	$_POST['idmatapelajaran_fk'],
				]);

				if ($presensi->num_rows() > 0) {
					 $this->my_update('presensi_harian', $data, ['id_presensi_harian'=>$presensi->row_array()['id_presensi_harian']]);
				}else{
					$this->save_data('presensi_harian', $data);
				}
			}

		}
		$idmapel 			=	$_POST['idmatapelajaran_fk'];
		$data['account']	=	$this->get_user_account();
		$data['tanggal']	=	$_POST['tanggal'];
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', ['id_tahun_ajaran'=>$_POST['idtahunajaran_fk']])->row_array();
		$siswa				=	$this->my_where('siswa', ['idkelas_fk'=>$_POST['idkelas_fk']])->result_array();
		$data['kelas']		=	$this->my_where('kelas', ['id_kelas'=>$_POST['idkelas_fk']])->row_array();
		$data['mata_pelajaran']		=	$this->my_where('mata_pelajaran', ['id_mata_pelajaran'=>$_POST['idmatapelajaran_fk']])->row_array();

		$data['siswa'] = [];
		foreach ($siswa as $key => $value) {
			$presensi = $this->my_where('presensi_harian', [
				'idsiswa_fk' 		=>	$value['id_siswa'],
				'idtahunajaran_fk'	=>	$_POST['idtahunajaran_fk'],
				'idkelas_fk'		=>	$_POST['idkelas_fk'],
				'tanggal' 			=>	$_POST['tanggal']
			])->row_array();

			$data['siswa'][] = [
				'siswa' => $value,
				'presensi' => !empty($presensi) ? $presensi : []
			];
 		}
 		if ($this->agent->is_mobile()) {
				$this->my_view(['role/guru/page_mobile/akademik/presensi_siswa/absen'],$data);
	 		}else{
	 			$this->my_view(['role/guru/page/akademik/presensi_siswa/absen'],$data);
	 		}

	}

	function save_jurnal_harian(){
		$idmapel 			=	$_POST['idmapel'];
		$mapel_get	=	$this->my_where('v_jadwal_pelajaran', ['id_jadwal_pelajaran'=>$idmapel])->row_array();
		$data = [
			'idguru_fk'			=>	$mapel_get['idguru_fk'],
			'idkelas_fk'		=>	$mapel_get['idkelas_fk'],
			'idmapel_fk'		=>	$mapel_get['idmapel_fk'],
			'idtahunajaran_fk'	=>	$mapel_get['idtahunajaran_fk'],
			'tanggal'			=>	$_POST['tanggal'],
			'uraian'			=>	$_POST['uraian']
		];

		$this->save_data('jurnal_guru', $data);
		$this->proses_jurnal($idmapel);
	}

	function save_catatan_siswa(){
		// $mapel_get	=	$this->my_where('v_jadwal_pelajaran', ['id_jadwal_pelajaran'=>$_POST['id_jadwal_pelajaran']])->row_array();
		$data = [
			'idguru_fk'			=>	$_POST['idguru_fk'],
			'idkelas_fk'		=>	$_POST['idkelas_fk'],
			'idmapel_fk'		=>	$_POST['idmapel_fk'],
			'idtahunajaran_fk'	=>	$_POST['idtahunajaran_fk'],
			'tanggal'			=>	$_POST['tanggal'],
			'idsiswa_fk'		=>	$_POST['idsiswa_fk'],
			'teruskan_ke'		=>	$_POST['teruskan_ke'],
			'uraian'			=>	$_POST['uraian']
		];

		$this->save_data('catatan_siswa', $data);
		$this->proses_catatan($_POST['idgurumapel_fk'], $_POST['tanggal']);
	}

	public function add_np_tugas()
	{
		if ($this->my_where('input_nilai_pengetahuan', [
			'idmatapelajaran_fk'		=>	$_POST['idmatapelajaran_fk'],
			'idtahunajaran_fk'			=>	$_POST['idtahunajaran_fk'],
			'idguru_fk'					=>	$_POST['idguru_fk'],
			'idkelas_fk'				=>	$_POST['idkelas_fk'],
			'kode'						=>	$_POST['kode'],
			'idkd_fk'					=>	$_POST['idkd_fk']
		])->num_rows() == 0) {
			$data = [
				'idmatapelajaran_fk'		=>	$_POST['idmatapelajaran_fk'],
				'idtahunajaran_fk'			=>	$_POST['idtahunajaran_fk'],
				'trans_code'				=>	rand(0,99999),
				'idguru_fk'					=>	$_POST['idguru_fk'],
				'idkelas_fk'				=>	$_POST['idkelas_fk'],
				'idjenispengetahuan_fk'		=>	3,
				'kode'						=>	$_POST['kode'],
				'keterangan'				=>	$_POST['keterangan'],
				'idkd_fk'					=>	$_POST['idkd_fk']
			];
			$this->save_data('input_nilai_pengetahuan', $data);
		}else{

		}
		
	}
	function update_jurnal_harian(){
		$idmapel 			=	$_POST['idmapel'];
		$data = [
			'uraian'			=>	$_POST['uraian']
		];

		if ($this->my_update('jurnal_guru', $data, ['id_jurnal_guru'=>$_POST['id_jurnal_guru']])) {
			$this->proses_jurnal($idmapel);
		}
	}

	function update_catatan_siswa(){
		$data = [
			'idsiswa_fk'		=>	$_POST['idsiswa_fk'],
			'teruskan_ke'		=>	$_POST['teruskan_ke'],
			'uraian'			=>	$_POST['uraian']
		];

		if ($this->my_update('catatan_siswa', $data, ['id_catatan_siswa'=>$_POST['id_catatan_siswa']])) {
			$this->proses_catatan($_POST['idgurumapel_fk'], $_POST['tanggal']);
		}
	}

	function delete_jurnal($id, $idmapel, $tanggal){
		$this->db->delete('jurnal_guru', ['id_jurnal_guru'=>$id]);
		$this->proses_jurnal($idmapel, $tanggal);
	}
	function delete_catatan_siswa($id){
		$this->db->delete('catatan_siswa', ['id_catatan_siswa'=>$id]);
	}
}