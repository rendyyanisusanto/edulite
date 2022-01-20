<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class jadwal_guru extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman siswa_kelas',
			'table'				=>	'jadwal_guru',
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
		$data['guru']		=	$this->my_where('guru',[])->result_array();
		$this->my_view(['role/kepsek/page/jadwal_guru/index_page/index','role/kepsek/page/jadwal_guru/index_page/js'],$data);
	}

	function get_hari()
	{
		$guru 		= $this->my_where('guru', ['id_guru'=>$_POST['idguru_fk']])->row_array();
		$jadwal_guru = $this->my_where('jadwal_guru', ['idguru_fk'=>$_POST['idguru_fk'],'idtahunajaran_fk'=>$_POST['idtahunajaran_fk']])->result_array();

		$data['hari']		=	$this->my_where('hari',[])->result_array();

		$send = '
				<div class="panel panel-body">
					<div class="col-md-12">
						<div class="panel panel-body">
							<fieldset>
								<div class="form-group">
				                  <label class="col-lg-3 control-label">Hari</label>
				                  <div class="col-lg-9">
				                  	<select class="form-control idhari_fk" name="hari" >
				                  ';
			foreach ($data['hari'] as $key => $value) {
				$send .= '				<option value='.$value['id_hari'].'>'.$value['hari'].'</option>';
			}
		$send .='
									</select>
				                  </div>
				                </div>
				                <div class="form-group">
				                  <label class="col-lg-3 control-label">Jam Mulai</label>
				                  <div class="col-lg-9">
				                  	<input type="number" class="form-control jam_mulai" name="jam_mulai">
				                  </div>
				                </div>
				                <div class="form-group">
				                  <label class="col-lg-3 control-label">Jam Selesai</label>
				                  <div class="col-lg-9">
				                  	<input type="number" class="form-control jam_selesai" name="jam_selesai">
				                  </div>
				                </div>
				            </fieldset>
				            <button type="button" class="btn btn-primary btn-proses-hari"> Tambah </button>
						</div>
					</div>
					<div class="col-md-12">
					<table class="table table-xxs table-bordered">
						<thead>
							<tr>
								<th width="2%">No</th>
								<th>Hari</th>
								<th>Jam Mulai</th>
								<th>Jam Selesai</th>
								<th width="2%">Hapus</th>
							</tr>
						</thead>
						<tbody>
		';
		$no = 0;
			foreach ($jadwal_guru as $key => $value) {
				$hari = $this->my_where('hari', ['id_hari'=>$value['idhari_fk']])->row_array();
					$send .= '<tr>
									<td>'.(++$no).'</td>
									<td>'.$hari['hari'].'</td>
									<td>'.$value['jam_mulai'].'</td>
									<td>'.$value['jam_selesai'].'</td>
									
									<td><button type="button" data-id="'.$value['id_jadwal_guru'].'" class="btn btn-xxs btn-hps btn-danger"><i class="icon-trash"></i></button>
								</tr>';
			}
		$send .= '
						</tbody>
						</div>
				</div>';
		echo $send;
	}

	function save_hari()
	{

		$data = [
			'idguru_fk'			=>	$_POST['idguru_fk'],
			'idtahunajaran_fk'	=>	$_POST['idtahunajaran_fk'],
			'jam_mulai'			=>	$_POST['jam_mulai'],
			'jam_selesai'		=>	$_POST['jam_selesai'],
			'idhari_fk'			=>	$_POST['idhari_fk']
		];

		$this->save_data('jadwal_guru', $data);
	}

	function hapus_hari()
	{
		$this->db->delete('jadwal_guru', ['id_jadwal_guru'=>$_POST['id']]);
	}
}