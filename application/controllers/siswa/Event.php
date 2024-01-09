<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class event extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman event',
			'table'				=>	'event',
			'column'			=>	['kode_arsip','pengirim','tanggal_surat','perihal','no_surat'],
			'column_order'		=>	[ 'id_event','kode_arsip','pengirim','tanggal_surat','perihal','no_surat'],
			'column_search'		=>	[ 'id_event','kode_arsip','pengirim','tanggal_surat','perihal','no_surat'],
			'order'				=>	['id_event'	=>	'DESC'],
			'id'				=>	'id_event'
	];

	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/BK/page/event/index_page/index','role/BK/page/event/index_page/js'],$data);
	}

	function aspirasi(){
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['siswa']		=	$this->get_siswa();
		$data['guru']		=	$this->db->query('SELECT DISTINCT(nama), id_guru, (select count(*) from aspirasi_ans_angket where idguru_fk=id_guru and idsiswa_fk='.$data['siswa']['siswa']['id_siswa'].') as c_guru FROM `v_guru_mapel` where idkelas_fk='.$data['siswa']['siswa']['idkelas_fk'].' and guru_aktif=1 ')->result_array();
		$data['sekolah']	=	$this->db->query('select * from aspirasi_ans_sekolah where idsiswa_fk = '.$data['siswa']['siswa']['id_siswa'])->num_rows();
		$this->my_view(['role/siswa/page/event/aspirasi/index','role/siswa/page/event/aspirasi/js'],$data);
	}

	function get_ev_guru(){
		$id = $_POST['id'];

		$data['guru']	=	$this->my_where('guru', ['id_guru'=>$id])->row_array();
		$data['param'] 		= 	$this->arr;
		$data['question']	=	$this->my_where('aspirasi_question', [])->result_array();
		$this->my_view(['role/siswa/page/event/aspirasi/ev_page'],$data);
	} 
	function get_ev_sekolah(){
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/siswa/page/event/aspirasi/ev_sekolah_page'],$data);
	} 

	public function simpan_data(){

		foreach ($_POST['question'] as $key => $value) {
			$data = [
				'idaspirasiquestion_fk'	=>	$key,
				'question'				=>	$value,
				'idguru_fk'				=>	$_POST['idguru_fk'],
				'idsiswa_fk'			=>  $this->get_siswa()['siswa']['id_siswa']
			];
			$this->save_data('aspirasi_ans_angket', $data);
		}

		$this->save_data('aspirasi_ans', [
			'idsiswa_fk'	=>  $this->get_siswa()['siswa']['id_siswa'],
			'idguru_fk'		=>	$_POST['idguru_fk'],
			'kritik'		=>	$_POST['kritik'],
			'saran'			=>	$_POST['saran'],
		]);
	}

	public function simpan_data_sekolah(){

		
		$this->save_data('aspirasi_ans_sekolah', [
			'idsiswa_fk'	=>  $this->get_siswa()['siswa']['id_siswa'],
			'kritik'		=>	$_POST['kritik'],
			'saran'			=>	$_POST['saran'],
		]);
	}
	
	
}