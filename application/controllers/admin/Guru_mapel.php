<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class Guru_mapel extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman siswa_kelas',
			'table'				=>	'guru_mapel',
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
		$data['kelas']		=	$this->my_where('kelas',[])->result_array();
		$data['guru']		=	$this->my_where('guru',[])->result_array();
		$data['mata_pelajaran']		=	$this->my_where('mata_pelajaran',[])->result_array();
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran',[])->result_array();
		$this->my_view(['role/admin/page/guru_mapel/index_page/index','role/admin/page/guru_mapel/index_page/js'],$data);
	}
	public function get_kelas()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['kelas']		=	$this->my_where('kelas',[])->result_array();
		$data['guru']		=	$this->my_where('guru',[])->result_array();
		$data['mata_pelajaran']		=	$this->my_where('mata_pelajaran',[])->result_array();
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran',[])->result_array();
		$this->my_view(['role/admin/page/guru_mapel/kelas_page/index','role/admin/page/guru_mapel/kelas_page/js'],$data);
	}

	function get_data_guru()
	{

		$guru 		= $this->my_where('guru', ['id_guru'=>$_POST['idguru_fk']])->row_array();
		$guru_mapel = $this->my_where('guru_mapel', ['idguru_fk'=>$_POST['idguru_fk'],'idtahunajaran_fk'=>$_POST['idtahunajaran_fk']])->result_array();

		$data['kelas']		=	$this->my_where('kelas',[])->result_array();
		$data['mata_pelajaran']		=	$this->my_where('mata_pelajaran',[])->result_array();


		$send = '
				<div class="panel panel-body">
					<div class="col-md-12">
						<div class="panel panel-body">
							<fieldset>
								<div class="form-group">
				                  <label class="col-lg-3 control-label">Mapel</label>
				                  <div class="col-lg-9">
				                  	<select class="form-control idmapel_fk" name="mapel" >
				                  ';
			foreach ($data['mata_pelajaran'] as $key => $value) {
				$send .= '				<option value='.$value['id_mata_pelajaran'].'>'.$value['mata_pelajaran'].'</option>';
			}
		$send .='
									</select>
				                  </div>
				                </div>
				                <div class="form-group">
				                  <label class="col-lg-3 control-label">Kelas</label>
				                  <div class="col-lg-9">
				                  	<select class="form-control idkelas_fk" name="kelas">
				                  ';
			foreach ($data['kelas'] as $key => $value) {
				$send .= '				<option value='.$value['id_kelas'].'>'.$value['kelas'].'</option>';
			}
		$send .='
									</select>
				                  </div>
				                </div>

				            </fieldset>

				            <button type="button" class="btn btn-primary btn-proses-mapel"> Tambah </button>
						</div>
					</div>
					<div class="col-md-12">
					<table class="table table-xxs table-bordered">
						<thead>
							<tr>
								<th>No</th>
								<th>Mapel</th>
								<th>Kelas</th>
								<th>Hapus</th>
							</tr>
						</thead>
						<tbody>
		';
		$no = 0;
			foreach ($guru_mapel as $key => $value) {
				$mapel = $this->my_where('mata_pelajaran', ['id_mata_pelajaran'=>$value['idmapel_fk']])->row_array();
				$kelas = $this->my_where('kelas', ['id_kelas'=>$value['idkelas_fk']])->row_array();
					$send .= '<tr>
									<td>'.(++$no).'</td>
									<td>'.$mapel['mata_pelajaran'].'</td>
									<td>'.$kelas['kelas'].'</td>
									<td><button type="button" data-id="'.$value['id_guru_mapel'].'" class="btn btn-xxs btn-hps btn-danger"><i class="icon-trash"></i></button>
								</tr>';
			}
		$send .= '
						</tbody>
						</div>
				</div>';
		echo $send;
	}

	function get_data_kelas(){
		$kelas 		= $this->my_where('kelas', ['id_kelas'=>$_POST['idkelas_fk']])->row_array();
		$guru_mapel = $this->my_where('guru_mapel', ['idkelas_fk'=>$_POST['idkelas_fk'],'idtahunajaran_fk'=>$_POST['idtahunajaran_fk']])->result_array();

		$data['guru']				=	$this->my_where('guru',[])->result_array();
		$data['mata_pelajaran']		=	$this->my_where('mata_pelajaran',[])->result_array();


		$send = '
				<div class="panel panel-body">
					<div class="col-md-12">
						<div class="panel panel-body">
							<fieldset>
								<div class="form-group">
				                  <label class="col-lg-3 control-label">Mapel</label>
				                  <div class="col-lg-9">
				                  	<select class="form-control idmapel_fk" name="mapel" >
				                  ';
			foreach ($data['mata_pelajaran'] as $key => $value) {
				$send .= '				<option value='.$value['id_mata_pelajaran'].'>'.$value['mata_pelajaran'].'</option>';
			}
		$send .='
									</select>
				                  </div>
				                </div>
				                <div class="form-group">
				                  <label class="col-lg-3 control-label">Guru</label>
				                  <div class="col-lg-9">
				                  	<select class="form-control idguru_fk" name="guru">
				                  ';
			foreach ($data['guru'] as $key => $value) {
				$send .= '				<option value='.$value['id_guru'].'>'.$value['nama'].'</option>';
			}
		$send .='
									</select>
				                  </div>
				                </div>

				            </fieldset>

				            <button type="button" class="btn btn-primary btn-proses-mapel"> Tambah </button>
						</div>
					</div>
					<div class="col-md-12">
					<table class="table table-xxs table-bordered">
						<thead>
							<tr>
								<th>No</th>
								<th>Mapel</th>
								<th>Guru</th>
								<th>Hapus</th>
							</tr>
						</thead>
						<tbody>
		';
		$no = 0;
			foreach ($guru_mapel as $key => $value) {
				$mapel = $this->my_where('mata_pelajaran', ['id_mata_pelajaran'=>$value['idmapel_fk']])->row_array();
				$guru = $this->my_where('guru', ['id_guru'=>$value['idguru_fk']])->row_array();
					$send .= '<tr>
									<td>'.(++$no).'</td>
									<td>'.$mapel['mata_pelajaran'].'</td>
									<td>'.$guru['nama'].'</td>
									<td><button type="button" data-id="'.$value['id_guru_mapel'].'" class="btn btn-xxs btn-hps btn-danger"><i class="icon-trash"></i></button>
								</tr>';
			}
		$send .= '
						</tbody>
						</div>
				</div>';
		echo $send;
	}
	function save_mapel()
	{

		$data = [
			'idguru_fk'			=>	$_POST['idguru_fk'],
			'idmapel_fk'		=>	$_POST['idmapel_fk'],
			'idtahunajaran_fk'	=>	$_POST['idtahunajaran_fk'],
			'idkelas_fk'		=>	$_POST['idkelas_fk']
		];

		$this->save_data('guru_mapel', $data);
	}

	function hapus_mapel()
	{
		$this->db->delete('guru_mapel', ['id_guru_mapel'=>$_POST['id']]);
	}
}