<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class jurnal_umum extends MY_Controller {

	public $arr = [
			'title'				=>	'Halaman jenis barang',
			'table'				=>	'jurnal_umum',
			'column'			=>	[ 'ref','akun'],
			'column_order'		=>	[ 'id_jurnal_umum','ref','akun'],
			'column_search'		=>	[ 'id_jurnal_umum','ref','akun'],
			'order'				=>	['id_jurnal_umum'	=>	'DESC'],
			'id'				=>	'id_jurnal_umum'
	];

	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		// $this->display_view();

		/*if you need custom page*/

		$data['account']	=	$this->get_user_account();
		$this->my_view(['role/bendahara/page/jurnal_umum/index_page/index','role/bendahara/page/jurnal_umum/index_page/js'],$data);

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
			// $this->my_view(['role/bendahara/page/guru/print_page/index','role/bendahara/page/guru/print_page/js'],$data);
			
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
        echo json_encode($this->call_datatable($this->arr));
	}
	
	public function find()
	{
		$mulai = $_POST['mulai'];
		$sampai = $_POST['sampai'];

		$find = $this->db->where('DATE(create_at) >=', date_format(date_create($mulai),"Y/m/d"))->where('DATE(create_at) <=', date_format(date_create($sampai),"Y/m/d"))->get('jurnal_umum')->result_array();

		$send = [];
		foreach ($find as $key => $value) {
			$query 	= $this->my_where('jurnal_umum', ['ref' => $value['ref']]);
			$akun 	= $this->my_where('akun',['id_akun'=>$value['idakun_fk']])->row_array();	
			$send [] = [
				'count' => 	$query->num_rows(),
				'akun' 	=>	$akun,
				'data'	=>	$value	
			];
		}
		$data['find'] = $send;
		$this->my_view(['role/bendahara/page/jurnal_umum/index_page/table_jurnal'],$data);
	}
}