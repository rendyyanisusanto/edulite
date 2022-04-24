<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class buku_tamu extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman buku_tamu',
			'table'				=>	'buku_tamu',
			'column'			=>	[ 'nama', 'alamat','jabatan', 'keperluan','saran', 'tanggal'],
			'column_order'		=>	[ 'id_buku_tamu','nama', 'alamat', 'jabatan', 'keperluan','saran', 'tanggal'],
			'column_search'		=>	[ 'id_buku_tamu','nama', 'alamat', 'jabatan', 'keperluan','saran', 'tanggal'],
			'order'				=>	['id_buku_tamu'	=>	'DESC'],
			'id'				=>	'id_buku_tamu'
	];

	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/admin/page/buku_tamu/index_page/index','role/admin/page/buku_tamu/index_page/js'],$data);
	}

	public function add_page()
	{

		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/admin/page/buku_tamu/add_page/index','role/admin/page/buku_tamu/add_page/js'],$data);
	}

	public function edit_page($id)
	{
		if (isset($id)) {
				$data['param'] 		= 	$this->arr;
				$data['buku_tamu'] = 	$this->my_where('buku_tamu',['id_buku_tamu'=>$id])->row_array();
				$this->my_view(['role/admin/page/buku_tamu/edit_page/index','role/admin/page/buku_tamu/edit_page/js'],$data);
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
		$data=[
			'nama'		=>	$_POST['nama'],
			'alamat'	=> 	$_POST['alamat'],
			'jabatan'	=>	$_POST['jabatan'],
			'keperluan'	=>	$_POST['keperluan'],
			'saran'		=>	$_POST['saran'],
			'tanggal'	=>	$_POST['tanggal']
		];
		
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
		public function print_hari_ini()
		{
				$data['param'] 		= 	$this->arr;
				$data['buku_tamu'] 	= $this->db->query('SELECT * FROM `buku_tamu` where date(tanggal) = now()')->result_array();
				$this->load->view('role/admin/page/buku_tamu/print/index',$data);
		}
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

			$this->db->where('tanggal >=',$_POST['tanggal_mulai']);
			$this->db->where('tanggal <=',$_POST['tanggal_sampai']);
			$data_set = $this->db->get_where($dt['table'],$where_send);
			
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
	                'pos' 			=> $_POST['posisi']
	            ];

	            $this->my_pdf($param);

		    }
		    
		    else if($_POST['tipe_laporan'] == 'excel')

		    {
		    	
	            $param  =   [
	                'filename'			=>		'Buku Tamu',
	                'data_obj'			=>		$data_set->result_array(),
	                'header_table'		=>		$dt['column'],
	                'print_field'		=>		$dt['column']
	            ];

	            
	            $reader = new \PhpOffice\PhpSpreadsheet\Reader\Xlsx();
				$spreadsheet = $reader->load("include/template/excel/format_cetak_buku_tamu.xlsx");
				// $spreadsheet = \PhpOffice\PhpSpreadsheet\IOFactory::load();
				//change it
				$sheet = $spreadsheet->getActiveSheet();
				//write it again to Filesystem with the same name (=replace)
				$no = 13;
				$styleArray = array(
				    'borders' => array(
				        'allBorders' => array(
				            'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
				            
				        ),
				    ),
				);
				foreach ($param['data_obj'] as $key => $value) {
					$abj = 'A';
					foreach ($param['header_table'] as $key_header => $value_header) {
						$sheet->setCellValue($abj.($no), $value[$value_header]);
						$abj++;
					}
					
					$sheet->getStyle('A'.$no.':'.$abj.$no)->applyFromArray($styleArray);

					$no ++;
				}
				ob_start();
				$writer = new Xlsx($spreadsheet);
				$fileName = "Buku Tamu.xlsx";
				header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
		        header('Content-Disposition: attachment; filename="'. urlencode($fileName).'"');
		        $writer->save('php://output');

		        $xlsData = ob_get_contents();
       			ob_end_clean();
	        	$response =  array(
		            'status' => TRUE,
		            'file' => "data:application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;base64,".base64_encode($xlsData)
		        );
	        	echo json_encode($response);
	        	// echo "<a target='__blank' href='".$response['file']."'>Download</a>";
		    }else if ($_POST['tipe_laporan'] == 'website'){
				$param  =   [
	                'filename'			=>		'Prestasi Siswa',
	                'data_obj'			=>		$data_set->result_array(),
	                'header_table'		=>		$dt['column'],
	                'print_field'		=>		$dt['column']
	            ];
				$this->my_view(['role/core_page/print_page/cetak_website'],$param);
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
            $row[]      =   '<input type="checkbox" name="get-check" value="'.$field['id_buku_tamu'].'"></input>';
            $row[]		=	!empty($field['tanggal']) ? date_format(date_create($field['tanggal']), 'd-m-Y') : '-';
            $row[]		=	!empty($field['nama']) ? strtoupper($field['nama']) : '-';
            $row[]		=	!empty($field['alamat']) ? $field['alamat'] : '-';
            $row[]		=	!empty($field['jabatan']) ? $field['jabatan'] : '-';
            $row[]		=	!empty($field['keperluan']) ? $field['keperluan'] : '-';
            $row[]		=	!empty($field['saran']) ? $field['saran'] : '-';

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