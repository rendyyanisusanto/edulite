<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class absensi extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman siswa_kelas',
			'table'				=>	'siswa_kelas',
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
		$data['jam']		=	$this->my_where('jam',[])->result_array();
		$this->my_view(['role/admin/page/absensi/index_page/index','role/admin/page/absensi/index_page/js'],$data);
	}

	public function get_siswa()
	{
		$kelas = $_POST['kelas'];
		$siswa = $this->my_where('siswa', ['idkelas_fk'=>$kelas])->result_array();

		$send = '<div class="panel panel-body">';
		$send .= '<table class="table table-bordered">';
		$send .= '<thead>';
		$send .= '<tr>';
			$send .= '<th>No</th>';
			$send .= '<th>Nama</th>';
			$send .= '<th>Masuk</th>';
			$send .= '<th>Tidak Masuk</th>';
			$send .= '<th>Keterangan</th>';
		$send .= '</tr>';
		$send .= '</thead>';
		$i = 0;
		$no = 0;
		foreach ($siswa as $key => $value) {
			$check = $this->my_where('absensi', [
				'idsiswa_fk' 			=>  $value['id_siswa'],
				'tanggal'				=>	$_POST['tanggal'],
				'idmatapelajaran_fk'	=>	$_POST['mata_pelajaran'],
				'idjam_fk'				=>	$_POST['jam'],
				'idguru_fk'				=>	$_POST['guru'],
				'idkelas_fk'			=>	$_POST['kelas']
			]);
			$check_num = $check->num_rows();
			$check_row = $check->row_array();
			// print_r($check_num);
			$send .= '<tr>';
			$send .= '<td>'.(++$no).'</td>';
			$send .= '<td>'.$value['nama'].'</td>';
			$send .= '<td><input type="radio" value="1" '.(($check_num>0)?(($check_row['status']==1)?'checked':''):'checked').' name="absensi['.($i).'][absensi]" /> M</td>';
			$send .= '<td><input type="radio" '.(($check_num>0)?(($check_row['status']==0)?'checked':''):'').' value="0" name="absensi['.($i).'][absensi]" /> TM</td>';
			$send .= '<td><input type="text" value="'.(($check_num>0)?$check_row['keterangan']:'').'" name="absensi['.($i).'][keterangan]" class="form-control"/> </td>';
			$send .= '<input type="hidden" value="'.$value['id_siswa'].'" name="absensi['.($i).'][idsiswa_fk]" />';
			$send .= '<input type="hidden" value="'.(($check_num>0)?1:0).'" name="absensi['.($i).'][stt]" />';
			$send .= '</tr>';	
			$i++;
		}
		$send .= '</table>';
		$send .= '<br/>';
		$send .= '<center><button type="submit" class="btn btn-success btn-sbm">Submit</button></center>';
		$send .= '</div>';
		echo $send;
	}

	public function simpan_data()
	{
		$data_siswa = [];
		foreach ($_POST['absensi'] as $key => $value) {
			$data_siswa = [
				'idsiswa_fk' 			=>  $value['idsiswa_fk'],
				'tanggal'				=>	$_POST['tanggal'],
				'idmatapelajaran_fk'	=>	$_POST['idmatapelajaran_fk'],
				'status'				=>	$value['absensi'],
				'keterangan'			=>	$value['keterangan'],
				'idjam_fk'				=>	$_POST['idjam_fk'],
				'idguru_fk'				=>	$_POST['idguru_fk'],
				'idkelas_fk'			=>	$_POST['idkelas_fk']
			];

			$check =[
				'idsiswa_fk' 			=>  $value['idsiswa_fk'],
				'tanggal'				=>	$_POST['tanggal'],
				'idmatapelajaran_fk'	=>	$_POST['idmatapelajaran_fk'],
				'idjam_fk'				=>	$_POST['idjam_fk'],
				'idguru_fk'				=>	$_POST['idguru_fk'],
				'idkelas_fk'			=>	$_POST['idkelas_fk']
			];

			if ($value['stt'] == 1) {
				$this->my_update('absensi', $data_siswa, $check);
			}else{
				$this->save_data('absensi', $data_siswa);
			}


		}
		echo json_encode($data_siswa);
	}
}