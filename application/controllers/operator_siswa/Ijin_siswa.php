<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class ijin_siswa extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman ijin_siswa',
			'table'				=>	'ijin_siswa',
			'column'			=>	[ 'nama', 'alamat','jabatan', 'keperluan','saran', 'tanggal'],
			'column_order'		=>	[ 'id_ijin_siswa','nama', 'alamat', 'jabatan', 'keperluan','saran', 'tanggal'],
			'column_search'		=>	[ 'id_ijin_siswa','nama', 'alamat', 'jabatan', 'keperluan','saran', 'tanggal'],
			'order'				=>	['id_ijin_siswa'	=>	'DESC'],
			'id'				=>	'id_ijin_siswa'
	];

	/*
		CHANGE PAGE
	*/
	public function get_data()
	{

		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/operator_siswa/page/ijin_siswa/index_page/index','role/operator_siswa/page/ijin_siswa/index_page/js'],$data);
	}

	public function add_page()
	{

		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['jenis_ijin'] = 	$this->my_where('jenis_ijin', [])->result_array();
		$data['operator'] 	= 	$this->my_where('operator', ['id_operator'=>$this->get_user_account()['anggota_id']])->result_array();
		$this->my_view(['role/operator_siswa/page/ijin_siswa/add_page/index','role/operator_siswa/page/ijin_siswa/add_page/js'],$data);
	}

	public function edit_page($id)
	{
		if (isset($id)) {
				$data['param'] 		= 	$this->arr;
				$data['ijin_siswa'] = 	$this->my_where('ijin_siswa',['id_ijin_siswa'=>$id])->row_array();
				$data['jenis_ijin'] = 	$this->my_where('jenis_ijin', [])->result_array();
				$data['operator'] 	= 	$this->my_where('operator', ['id_operator'=>$this->get_user_account()['anggota_id']])->result_array();
				$data['siswa']		=	$this->my_where('siswa', ['id_siswa'=>$data['ijin_siswa']['idsiswa_fk']])->row_array();
				$this->my_view(['role/operator_siswa/page/ijin_siswa/edit_page/index','role/operator_siswa/page/ijin_siswa/edit_page/js'],$data);
		} else {
			$this->get_data();
		}
	}

	/*
		ADD DATA
	*/

	function get_siswa()
	{
		$searchTerm = $this->input->post('searchTerm');

      // Get users

      	 $this->db->select('*');
	     $this->db->where("nama like '%".$searchTerm."%' ")->limit(5);
	     $fetched_records = $this->db->get('siswa');
	     $users = $fetched_records->result_array();

	     // Initialize Array with fetched data
	     $data = array();
	     foreach($users as $user){
	        $data[] = array("id"=>$user['id_siswa'], "text"=>$user['nama']);
	     }

      	echo json_encode($data);
	}

	public function simpan_data()
	{	
		$data = [
			'idsiswa_fk'		=>	$_POST['idsiswa_fk'],
			'tanggal'			=>	$_POST['tanggal'],
			'idjenisijin_fk'	=>	$_POST['idjenisijin_fk'],
			'keterangan'		=>	$_POST['keterangan'],
			'idoperator_fk'		=>	$_POST['idoperator_fk']

		];
		if ($this->save_data('ijin_siswa', $data)) {
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
			'idsiswa_fk'		=>	$_POST['idsiswa_fk'],
			'tanggal'			=>	$_POST['tanggal'],
			'idjenisijin_fk'	=>	$_POST['idjenisijin_fk'],
			'keterangan'		=>	$_POST['keterangan'],
			'idoperator_fk'		=>	$_POST['idoperator_fk']
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
				$data['ijin_siswa'] 	= $this->db->query('SELECT * FROM `ijin_siswa` where date(tanggal) = curdate()')->result_array();
				$data['template_ijin_siswa']	=
					[
						'header' => $this->generate_code($this->my_where('setting_table',['table'=>'ijin_siswa', 'name'=>'header_print_table'])->row_array()['value']),
						'footer' => $this->generate_code($this->my_where('setting_table',['table'=>'ijin_siswa', 'name'=>'footer_print_table'])->row_array()['value']),
						'title' => $this->generate_code($this->my_where('setting_table',['table'=>'ijin_siswa', 'name'=>'title_print_table'])->row_array()['value']),
					];
				$this->load->view('role/operator_siswa/page/ijin_siswa/print/index',$data);
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
			// $this->my_view(['role/operator_siswa/page/guru/print_page/index','role/operator_siswa/page/guru/print_page/js'],$data);
			
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
	                'header_table'		=>		$_POST['field'],
	                'print_field'		=>		$_POST['field'],
	            ];

	            
	            $reader = new \PhpOffice\PhpSpreadsheet\Reader\Xlsx();
				$spreadsheet = $reader->load("include/template/excel/format_cetak_ijin_siswa.xlsx");
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
	                'filename'			=>		'Buku Tamu',
	                'data_obj'			=>		$data_set->result_array(),
	                'header_table'		=>		$_POST['field'],
	                'print_field'		=>		$_POST['field']
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
       $this->db->where('idoperator_fk', $this->get_user_account()['anggota_id']);
       	if ($_POST['tanggal_mulai'] != '') {
       		$this->db->where('tanggal >=',$_POST['tanggal_mulai']);
       	}
       	if ($_POST['tanggal_selesai'] != '') {
			$this->db->where('tanggal <=',$_POST['tanggal_selesai']);
       	}
       	
        $list           =   $this->mod_datatable->get_datatables();
        $data           =   array();
        $no             =   $_POST['start'];
        foreach ($list as $field) {
            $no++;
            $siswa = $this->my_where('siswa', ['id_siswa'=>$field['idsiswa_fk']])->row_array();
            $kelas = $this->my_where('kelas', ['id_kelas'=>$siswa['idkelas_fk']])->row_array();
            $operator = $this->my_where('operator', ['id_operator'=>$field['idoperator_fk']])->row_array();
            $jenis_ijin = $this->my_where('jenis_ijin', ['id_jenis_ijin'=>$field['idjenisijin_fk']])->row_array();
            $row        =   array();
            $row[]      =   '<input type="checkbox" name="get-check" value="'.$field['id_ijin_siswa'].'"></input>';
            $row[]		=	!empty($field['tanggal']) ? date_format(date_create($field['tanggal']), 'd-m-Y') : '-';
            $row[]		=	!empty($siswa['nama']) ? strtoupper($siswa['nama']) : '-';
            $row[]		=	!empty($kelas['kelas']) ? strtoupper($kelas['kelas']) : '-';
            $row[]		=	'<b style="color:'.$jenis_ijin['color'].'">'.$jenis_ijin['jenis_ijin'].'</b>';
            $row[]		=	!empty($field['keterangan']) ? $field['keterangan'] : '-';
            $row[]		=	'<b>'.$operator['nama'].'</b>';
            // $row[]		=	'<a class="btn btn-xs btn-primary" href="'.base_url('operator_siswa/ijin_siswa/print_data/'.$field['id_ijin_siswa']).'" target="__blank"><i class=" icon-printer"></i></a>';

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

	function get_stats_nav()
	{
		$data['total']		=	$this->my_where('ijin_siswa', [])->num_rows();
		$data['hari_ini']	=	$this->my_where('ijin_siswa', ['tanggal'=>date('Y-m-d')])->num_rows();

		$this->my_view(['role/operator_siswa/page/ijin_siswa/index_page/stats'],$data);
	}
	function print_data($id)
	{
		$data['ijin_siswa']	=	$this->my_where('ijin_siswa',['id_ijin_siswa'=>$id])->row_array();
		$data['template_ijin_siswa']	=
		[
			'header' => $this->generate_code($this->my_where('setting_table',['table'=>'ijin_siswa', 'name'=>'header_print_data'])->row_array()['value']),
			'footer' => $this->generate_code($this->my_where('setting_table',['table'=>'ijin_siswa', 'name'=>'footer_print_data'])->row_array()['value']),
			'title' => $this->generate_code($this->my_where('setting_table',['table'=>'ijin_siswa', 'name'=>'title_print_data'])->row_array()['value']),
		];
		
		$this->load->view('role/operator_siswa/page/ijin_siswa/print/print_data',$data);
	}
	
	
}