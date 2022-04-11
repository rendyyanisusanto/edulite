<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class oas extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman OAS',
			'table'				=>	'oas',
			'column'			=>	[ 'tanggal_mulai'],
			'column_order'		=>	[ 'id_oas','tanggal_mulai'],
			'column_search'		=>	[ 'id_oas','tanggal_mulai'],
			'order'				=>	['id_oas'	=>	'DESC'],
			'id'				=>	'id_oas'
	];

	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran',['is_active'=>1])->row_array();

		$this->my_view(['role/admin/page/oas/index_page/index','role/admin/page/oas/index_page/js'],$data);
	}

	function detail_page($id_oas){

		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['oas']		=	$this->my_where('oas', ['id_oas'=>$id_oas])->row_array();
		$data['kelas_oas']	=	$this->db->query('select *, (select id_oas_kelas from oas_kelas where oas_kelas.idkelas_fk=id_kelas) as id_oas_kelas from kelas')->result_array();
		$data['mata_pelajaran']	=	$this->my_where('mata_pelajaran',[])->result_array();
		$this->my_view(['role/admin/page/oas/index_page/detail','role/admin/page/oas/index_page/modal_bank_soal','role/admin/page/oas/index_page/js_detail'],$data);
	}
	public function get_bank_soal()
	{
		$value=$_POST['txt'];
		$data['bank']	=	$this->db->like('soal', $value)->or_like('code_soal', $value)->limit(3)->get('bank_soal')->result_array();


		$this->my_view(['role/admin/page/oas/index_page/view_soal'],$data);
	}
	public function datatable()
	{
        $_POST['frm']   =   $this->arr;
        $list           =   $this->mod_datatable->get_datatables();
        $data           =   array();
        $no             =   $_POST['start'];
        foreach ($list as $field) {
            $no++;
            $row        =   array();
            $row[]      =   '<input type="checkbox" name="get-check" value="'.$field['id_oas'].'"></input>';
            $row[]		=	'<a href="oas/detail_page/'.$field['id_oas'].'" class="app-item"><b>'.strtoupper($field['kode']).'</b></a>';
             
            $row[]		=	!empty($field['keterangan']) ? strtoupper($field['keterangan']) : '-';
            $row[]		=	!empty($field['tanggal_mulai']) ?  $field['tanggal_mulai']: '-';
            $row[]		=	!empty($field['tanggal_selesai']) ? $field['tanggal_selesai'] : '-';

            $data[]     =   $row;
        }
        $output = array(
            "draw" => $_POST['draw'],
            "recordsTotal" => $this->mod_datatable->count_all(),
            "recordsFiltered" => $this->mod_datatable->count_filtered(),
            "data" => $data,
        );

        echo json_encode($output);
	}
	
	function get_proses(){
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran',['is_active'=>1])->row_array();
		$data['siswa']				=	[];
		$get_siswa			=	$this->my_where('siswa', ['idkelas_fk'=>$_POST['idkelas']])->result_array();

		foreach ($get_siswa as $key => $value) {
			$file_oas = $this->my_where('file_oas', ['idsiswa_fk'=>$value['id_siswa']]);

			$data['siswa'][]	=	[
				"siswa"		=>	$value,
				"is_get"	=>	$this->my_where('file_oas', ['idsiswa_fk'=>$value['id_siswa']])->num_rows(),
				"file_get"	=>	$this->my_where('file_oas', ['idsiswa_fk'=>$value['id_siswa']])->row_array()	
			];
		}
		$this->my_view(['role/admin/page/oas/index_page/proses'],$data);
	}

	function simpan_data(){

		$data = [
			'tanggal_mulai'		=>	$_POST['tanggal_mulai'],
			'tanggal_selesai'	=>	$_POST['tanggal_selesai'],
			'keterangan'		=>	$_POST['keterangan'],
			'is_active'			=> 1,
			'kode'				=>	$_POST['kode'],
			'idmapel_fk'		=>	$_POST['idmapel_fk'],
		];

		$this->my_update('oas', $data, ['id_oas'=>$_POST['id_oas']]);
		// Kelas
		$this->db->delete('oas_kelas', ['idoas_fk'=>$_POST['id_oas']]);
		foreach ($_POST['idkelas_fk'] as $key => $value) {
			$this->save_data('oas_kelas', ['idkelas_fk'=>$value, 'idoas_fk'=>$_POST['id_oas']]);
		}
		echo json_encode($_POST);
	}

	function ubah_data()
	{
		$data = [
			'status'		=>	$_POST['status'],
			'is_active'		=>	$_POST['is_active'],
		];

		$this->my_update('file_oas', $data, ['id_file_oas'=>$_POST['id_file_oas']]);
	}

	public function add_soal_bank()
	{
		if (isset($_POST['id_oas'])) {
			$data 	=	[
				'idoas_fk'	=>	$_POST['id_oas'],
				'idbanksoal_fk'	=>	$_POST['id_soal']
			];

			$this->save_data('oas_soal', $data);
		}
	}

	public function get_table_soal($id_oas='')
	{
		$data['oas_soal'] = $this->my_where('v_oas_soal',[])->result_array();

		$this->my_view(['role/admin/page/oas/index_page/table_soal'],$data);
	}
	public function delete_soal($value='')
	{
		if ($_POST['id']) {
			$this->db->delete('oas_soal', ['id_oas_soal'=>$_POST['id']]);
		}
	}
}
?>