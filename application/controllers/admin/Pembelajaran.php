<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class pembelajaran extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman pembelajaran',
			'table'				=>	'pembelajaran',
			'column'			=>	[ 'pembelajaran'],
			'column_order'		=>	[ 'id_pembelajaran','pembelajaran'],
			'column_search'		=>	[ 'id_pembelajaran','pembelajaran'],
			'order'				=>	['id_pembelajaran'	=>	'DESC'],
			'id'				=>	'id_pembelajaran'
	];

	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;

		$this->my_view(['role/admin/page/pembelajaran/index_page/index','role/admin/page/pembelajaran/index_page/js'],$data);
	}

	public function absensi($id)
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;

		$data['jadwal'] = $this->my_where('component_jadwal', ['id_component_jadwal'=>$id])->row_array();
		$data['guru'] = $this->my_where('guru', ['id_guru'=> $data['jadwal']['idguru_fk']])->row_array();
		$data['jam'] = $this->my_where('jam', ['id_jam'=> $data['jadwal']['idjam_fk']])->row_array();
		$data['pelajaran'] = $this->my_where('mata_pelajaran', ['id_mata_pelajaran'=> $data['jadwal']['idpelajaran_fk']])->row_array();
		$data['kelas'] = $this->my_where('kelas', ['id_kelas'=> $data['jadwal']['idkelas_fk']])->row_array();
		$this->my_view(['role/admin/page/absensi/index_page/index','role/admin/page/absensi/index_page/js'],$data);
	}

	public function get_pelajaran()
	{
		$data = $this->my_where('component_jadwal', ['date(tanggal)'=>date('Y-m-d')])->result_array();

		$send = '';
		$i = 0;
		foreach ($data as $key => $value) {
			$guru = $this->my_where('guru', ['id_guru'=> $value['idguru_fk']])->row_array();
			$jam = $this->my_where('jam', ['id_jam'=> $value['idjam_fk']])->row_array();
			$pelajaran = $this->my_where('mata_pelajaran', ['id_mata_pelajaran'=> $value['idpelajaran_fk']])->row_array();
			$kelas = $this->my_where('kelas', ['id_kelas'=> $value['idkelas_fk']])->row_array();


		$send .= '<tr>';
			$send .= '<td>'.(++$i).'</td>';
			$send .= '<td>'.$pelajaran['mata_pelajaran'].'</td>';
			$send .= '<td>'.$guru['nama'].'</td>';
			$send .= '<td>'.$kelas['kelas'].'</td>';
			$send .= '<td><a href="pembelajaran/absensi/'.$value['id_component_jadwal'].'" class="btn app-item btn-success btn-block btn-sm">Absensi</a></td>';
			$send .= '<td><a href="pembelajaran/absensi/'.$value['id_component_jadwal'].'" class="btn app-item btn-primary btn-block btn-sm">Catatan</a></td>';
			$send .= '<td><a href="pembelajaran/absensi/'.$value['id_component_jadwal'].'" class="btn app-item btn-danger btn-block btn-sm">Penilaian</a></td>';
		$send .= '</tr>';
		}
		echo $send;
	}
}