<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class Ppdb extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman Ppdb',
			'table'				=>	'Ppdb',
			'column'			=>	[ 'Ppdb'],
			'column_order'		=>	[ 'id_Ppdb','Ppdb'],
			'column_search'		=>	[ 'id_Ppdb','Ppdb'],
			'order'				=>	['id_Ppdb'	=>	'DESC'],
			'id'				=>	'id_Ppdb'
	];

	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['result'] = json_decode($this->curl->simple_get('https://apippdb.smkitasy-syadzili.sch.id/index.php/register/all'));
		$this->my_view(['role/admin/page/ppdb/index_page/index','role/admin/page/ppdb/index_page/js'],$data);
	}

	public function list()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/admin/page/ppdb/index_page/index_list','role/admin/page/ppdb/index_page/js_list'],$data);
	}

	function detail_data($id = "")
	{
		if ($id !== "") {
			$data['account']	=	$this->get_user_account();
			$data['param'] 		= 	$this->arr;
			$data['ppdb']		=	$this->my_where('ppdb',['id_ppdb' => $id])->row_array();
			$this->my_view(['role/admin/page/ppdb/detail_page/index','role/admin/page/ppdb/detail_page/js'],$data);
		}
	}

	public function add_page()
	{
		$this->display_view('add_page');
	}

	public function edit_page()
	{
		$dt = $this->arr;
		if (isset($_POST['send_data'])) {
			$data_edit=[];
				$data_set = $this->my_where($dt['table'],[$dt['id']=>$_POST['send_data']])->row_array();
				foreach ($dt['column_order'] as $keycolumn => $value_column) {
					$data_edit[$value_column]	= $data_set[$value_column];
				}
			$data['data_edit']	=	$data_edit;
			$this->display_view('edit_page', $data);
		} else {
			$this->get_data();
		}
	}

	/*
		ADD DATA
	*/


	public function simpan_data()
	{	
		if ($this->save_data_param()) {
			$this->get_data();
		}	else 	{
			echo "error";
		}
	}


	/*
		EDIT DATA
	*/

	function update_data()
	{
		$dt = $this->arr;
		$data=[];
		foreach ($dt['column'] as $key => $value) {
			$data[$value] = $_POST[$value];
		}
		if ($this->my_update($dt['table'],$data,[$dt['id']=>$_POST[$dt['id']]])) {
			$this->get_data();
		}	else 	{
			echo "error";
		}
	}

	/*
		DELETE DATA
	*/

	function hapus()
	{
		$dt = $this->arr;
		foreach ($_POST['data_get'] as $key => $value) {
			$this->db->delete($dt['table'],[$dt['id']=>$value]);
		}
	}

	/*
		PRINT DATA
	*/
		
		function cetak_page()
		{
			$dt = $this->arr;
			$data['sum_selected']=0;
			if (isset($_POST['send_data'])) {
				$data_edit=[];
				foreach ($_POST['send_data'] as $key => $value) {
					$data_set = $this->my_where($dt['table'],[$dt['id']=>$value])->row_array();
					foreach ($dt['column_order'] as $keycolumn => $value_column) {
					$data_edit[$value_column]	= $data_set[$value_column];
					}
				}
				$data['data_edit']			=	$data_edit;
				$data['sum_selected']		=	count($_POST['send_data']);
				$data['input_selected']		=	implode(',', $_POST['send_data']);
			}

			$this->display_view('print_page', $data);
			// $this->my_view(['role/admin/page/guru/print_page/index','role/admin/page/guru/print_page/js'],$data);
			
		}

		function cetak_data()
		{
			$dt = $this->arr;
			$this->my_delete_file(FCPATH.'/include/pdf_temp');

			$data=[];
			$where_send		=	[];

			if ($_POST['data_yg_dicetak']	==	'manual') {
				foreach ($dt['column'] as $key => $value) {
					if (!empty($_POST['f_'.$value])) {
						$where_send[$value]	=	$_POST['f_'.$value];
					}
				}
			} else if($_POST['data_yg_dicetak']	==	'pilih')
			{
				$data_selected = explode(',', $_POST['input_selected']);
				foreach ($data_selected as $key => $value) {
					$this->db->or_where($dt['id'], $value);
				}
			}

			$data_set = $this->my_where($dt['table'],$where_send);
			
			$url	=	($_POST['laporan']	==	'data')	?	'role/core_page/print_page/cetak_data'	:	'role/core_page/print_page/cetak_kartu';
			
		    if ($_POST['tipe_laporan'] == 'pdf') {

		    	$param	=	[
	                'url'			=>	$url,
	                'customPaper'	=>	array(0,0,381.89,595.28),
	                'data_value'	=>	[
	                	"data"		=>	$data_set->result_array(),
	                	"param"		=>	$dt
	                ],
	                'name'			=>	md5(rand(0,9999999)),
	                'pos' 			=> 'landscape'
	            ];

	            $this->my_pdf($param);

		    }
		    
		    else if($_POST['tipe_laporan'] == 'excel')

		    {
		    	
	            $param  =   [
	                'filename'			=>		'Jadwal Kegiatan Sekolah',
	                'data_obj'			=>		$data_set->result(),
	                'header_table'		=>		$dt['column'],
	                'print_field'		=>		$dt['column']
	            ];

	            $this->my_export_excel($param);
	        
		    }

		}

	/*
		MANIPULATE DATA
	*/

	public function datatable()
	{
        $_POST['frm']   =   $this->arr;
        $list           =   $this->mod_datatable->get_datatables();
        $data           =   array();
        $no             =   $_POST['start'];
        foreach ($list as $field) {
            $no++;
            $row        =   array();
            $row[]      =   '<input type="checkbox" name="get-check" value="'.$field['id_ppdb'].'"></input>';
            $row[]		=	'<a href="Ppdb/detail_data/'.$field['id_ppdb'].'" class="app-item">'.strtoupper($field['kode_pendaftaran']).'</a>';
            $row[]		=	!empty($field['nama']) ? strtoupper($field['nama']) : '-';
            $row[]		=	!empty($field['nisn']) ? $field['nisn'] : '-';
            $row[]		=	!empty($field['tempat_lahir']) ? $field['tempat_lahir'] : '-';
            $row[]		=	!empty($field['alamat']) ? $field['alamat'] : '-';
            $row[]		=	!empty($field['nama']) ? strtoupper($field['nama_ayah']) : '-';
            $row[]		=	!empty($field['nama']) ? strtoupper($field['nama_ibu']) : '-';
            $row[]		=	($field['status'] == 0) ? "<b class='text-danger'><i class='icon-cross2'></i></b>" : '<b class="text-success"><i class="icon-checkmark"></i></b>';
            $row[]		=	($field['status'] == 0) ? '<a href="Ppdb/detail_data/'.$field['id_ppdb'].'" class="btn btn-danger app-item"><i class="icon-spinner"></i> Verifikasi</a>' : '<a class="btn btn-succes app-item"><i class="icon-spinner"></i> Ubah Status</a>';
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
	
	
}