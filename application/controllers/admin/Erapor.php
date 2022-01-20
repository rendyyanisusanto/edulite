<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class erapor extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman erapor',
			'table'				=>	'erapor',
			'column'			=>	[ 'tanggal_mulai'],
			'column_order'		=>	[ 'id_erapor','tanggal_mulai'],
			'column_search'		=>	[ 'id_erapor','tanggal_mulai'],
			'order'				=>	['id_erapor'	=>	'DESC'],
			'id'				=>	'id_erapor'
	];

	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran',['is_active'=>1])->row_array();

		$this->my_view(['role/admin/page/erapor/index_page/index','role/admin/page/erapor/index_page/js'],$data);
	}

	function detail_page($id_erapor){

		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['erapor']		=	$this->my_where('erapor', ['id_erapor'=>$id_erapor])->row_array();
		$data['kelas_erapor']	=	$this->db->query('select *, (select kelas from kelas where kelas.id_kelas = idkelas_fk) as kelas from kelas_erapor where iderapor_fk='.$id_erapor)->result_array();
		$this->my_view(['role/admin/page/erapor/index_page/detail','role/admin/page/erapor/index_page/modal','role/admin/page/erapor/index_page/js_detail'],$data);
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
            $row[]      =   '<input type="checkbox" name="get-check" value="'.$field['id_erapor'].'"></input>';
            $row[]		=	'<a href="erapor/detail_page/'.$field['id_erapor'].'" class="app-item"><b>'.strtoupper($field['kode']).'</b></a>';
             
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
			$file_rapor_online = $this->my_where('file_rapor_online', ['idsiswa_fk'=>$value['id_siswa']]);

			$data['siswa'][]	=	[
				"siswa"		=>	$value,
				"is_get"	=>	$this->my_where('file_rapor_online', ['idsiswa_fk'=>$value['id_siswa']])->num_rows(),
				"file_get"	=>	$this->my_where('file_rapor_online', ['idsiswa_fk'=>$value['id_siswa']])->row_array()	
			];
		}
		$this->my_view(['role/admin/page/erapor/index_page/proses'],$data);
	}

	function simpan_data(){
		$file_pdf = $this->save_media([
			'path'	=>	"./include/media/file_rapor_online/",
			'filename' => 'pdf_file',
		]);
		$tahun_ajaran		=	$this->my_where('tahun_ajaran',['is_active'=>1])->row_array();
		$trans_code = rand(0,99999);
		$data = [
			'file_rapor_online'		=>	((isset($file_pdf)) ? $file_pdf['file_name'] : ''),
			'idsiswa_fk'	=>	$_POST['id_siswa'],
			'trans_code'	=>	$trans_code,
			'idtahunajaran_fk'	=>	$tahun_ajaran['id_tahun_ajaran'],
			'status'		=>	$_POST['status'],
			'is_active'		=>	0
		];
		$this->save_data('file_rapor_online', $data);
	}

	function ubah_data()
	{
		$data = [
			'status'		=>	$_POST['status'],
			'is_active'		=>	$_POST['is_active'],
		];

		$this->my_update('file_rapor_online', $data, ['id_file_rapor_online'=>$_POST['id_file_rapor_online']]);
	}
}
?>