<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class guru extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman guru',
			'table'				=>	'guru',
			'column'			=>	[ 'nama', 'nip', 'alamat', 'agama'],
			'column_order'		=>	[ 'id_guru','nama', 'nip', 'alamat', 'agama'],
			'column_search'		=>	[ 'id_guru','nama', 'nip', 'alamat', 'agama'],
			'order'				=>	['id_guru'	=>	'DESC'],
			'id'				=>	'id_guru'
	];

	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		$this->display_view();

		/*if you need custom page*/

		// $data['account']	=	$this->get_user_account();
		// $this->my_view(['role/admin/page/siswa/index','role/admin/page/siswa/js_siswa'],$data);

	}

	public function add_page()
	{
		// $this->display_view('add_page');
		$data['param']	=	$this->arr;
		$data['mapel']	=	$this->my_where('mata_pelajaran',[])->result_array();
		$this->my_view(['role/admin/page/guru/add_page/index','role/admin/page/guru/add_page/js'],$data);
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
			// $this->display_view('edit_page', $data);
			$data['param']	=	$this->arr;
			$this->my_view(['role/admin/page/guru/edit_page/index','role/admin/page/guru/edit_page/js'],$data);
		} else {
			$this->get_data();
		}
	}

	/*
		ADD DATA
	*/


	public function simpan_data()
	{	
		$data 	=	[
			'nama'		=>	$_POST['nama'],
			'nip'		=>	$_POST['nip'],
			'alamat'	=>	$_POST['alamat'],
			'agama'		=>	$_POST['agama'],
			'foto'		=>	implode(',', $_POST['foto'])
		];
		if ($this->save_data("guru", $data)) {
			$data_id 	=	$this->my_where('guru',['nama'		=>	$_POST['nama'],
			'nip'		=>	$_POST['nip'],
			'alamat'	=>	$_POST['alamat'],
			'agama'		=>	$_POST['agama']])->row_array();

			$this->save_data("guru_mapel", ['idguru_fk'=>$data_id['id_guru'], 'idmapel_fk'=>$_POST['idmapel_fk']]);
		}	else 	{
			echo "error";
		}

		echo json_encode($data);
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
		    	$dt['column']	=	$_POST['field'];
		    	$param	=	[
	                'url'			=>	$url,
	                'customPaper'	=>	array(0,0,381.89,595.28),
	                'data_value'	=>	[
	                	"data"		=>	$data_set->result_array(),
	                	"param"		=>	$dt
	                ],
	                'name'			=>	md5(rand(0,9999999)),
	                'pos' 			=> $_POST['posisi']
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

	public function import()
	{
		$this->display_view('import_page');
	}

	public function download_template()
	{
		$dt = $this->arr;
		 
		$spreadsheet = new Spreadsheet();
		$sheet = $spreadsheet->getActiveSheet();
		$col = 'A';
		foreach ($dt['column'] as $key => $value) {
			$sheet->setCellValue($col.'1', ucfirst($value));
			$col++;
		}
		$writer = new Xlsx($spreadsheet);
		header('Content-Type: application/vnd.ms-excel');
		header('Content-Disposition: attachment;filename="'. $dt['table'] .'.xlsx"'); 
		header('Cache-Control: max-age=0');
		$writer->save('php://output');
		
	}

	public function process_import()
	{
		
		if(!empty($_FILES['fileURL']['name'])) { 
			$this->save_data_batch($this->arr['table'], $this->my_export_excel($_FILES['fileURL']['name']));
        }
	}
	
	
}