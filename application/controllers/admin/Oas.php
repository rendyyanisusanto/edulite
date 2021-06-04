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
		$data['kelas_oas']	=	$this->db->query('select *, (select kelas from kelas where kelas.id_kelas = idkelas_fk) as kelas from kelas_oas where idoas_fk='.$id_oas)->result_array();
		$this->my_view(['role/admin/page/oas/index_page/detail','role/admin/page/oas/index_page/modal','role/admin/page/oas/index_page/js_detail'],$data);
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
		$file_pdf = $this->save_media([
			'path'	=>	"./include/media/oas/",
			'filename' => 'pdf_file',
		]);

		$data = [
			'file_oas'		=>	((isset($file_pdf)) ? $file_pdf['file_name'] : ''),
			'idsiswa_fk'	=>	$_POST['id_siswa'],
			'status'		=>	$_POST['status']
		];
		$this->save_data('file_oas', $data);
	}
}
?>