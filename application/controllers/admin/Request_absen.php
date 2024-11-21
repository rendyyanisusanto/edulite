<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class request_absen extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman request_absen',
			'table'				=>	'request_absen',
			'column'			=>	[ 'tanggal', 'idguru_fk','jam_masuk', 'jam_pulang','keterangan', 'status'],
			'column_order'		=>	[ 'id_request_absen','tanggal', 'idguru_fk', 'jam_masuk', 'jam_pulang','keterangan', 'status'],
			'column_search'		=>	[ 'id_request_absen','tanggal', 'idguru_fk', 'jam_masuk', 'jam_pulang','keterangan', 'status'],
			'order'				=>	['id_request_absen'	=>	'DESC'],
			'id'				=>	'id_request_absen'
	];
	/*
		CHANGE PAGE
	*/
	public function get_data()
	{

		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/admin/page/request_absen/index_page/index','role/admin/page/request_absen/index_page/js'],$data);
	}

	public function add_page()
	{

		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['jenis_ijin'] = 	$this->my_where('jenis_ijin', [])->result_array();
		$data['operator'] 	= 	$this->my_where('operator', [])->result_array();
		$this->my_view(['role/admin/page/request_absen/add_page/index','role/admin/page/request_absen/add_page/js'],$data);
	}

	public function edit_page($id)
	{
		if (isset($id)) {
				$data['param'] 		= 	$this->arr;
				$data['request_absen'] = 	$this->my_where('request_absen',['id_request_absen'=>$id])->row_array();
				$this->my_view(['role/admin/page/request_absen/edit_page/index','role/admin/page/request_absen/edit_page/js'],$data);
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
		if ($this->save_data('request_absen', $data)) {
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
				$data['request_absen'] 	= $this->db->query('SELECT * FROM `request_absen` where date(tanggal) = curdate()')->result_array();
				$data['template_request_absen']	=
					[
						'header' => $this->generate_code($this->my_where('setting_table',['table'=>'request_absen', 'name'=>'header_print_table'])->row_array()['value']),
						'footer' => $this->generate_code($this->my_where('setting_table',['table'=>'request_absen', 'name'=>'footer_print_table'])->row_array()['value']),
						'title' => $this->generate_code($this->my_where('setting_table',['table'=>'request_absen', 'name'=>'title_print_table'])->row_array()['value']),
					];
				$this->load->view('role/admin/page/request_absen/print/index',$data);
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
	                'header_table'		=>		$_POST['field'],
	                'print_field'		=>		$_POST['field'],
	            ];

	            
	            $reader = new \PhpOffice\PhpSpreadsheet\Reader\Xlsx();
				$spreadsheet = $reader->load("include/template/excel/format_cetak_request_absen.xlsx");
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
     
        $list           =   $this->mod_datatable->get_datatables();
        $data           =   array();
        $no             =   $_POST['start'];
        foreach ($list as $field) {
            $no++;
            $guru = $this->my_where('guru', ['id_guru'=>$field['idguru_fk']])->row_array();
            $row        =   array();
            $row[]      =   '<input type="checkbox" name="get-check" value="'.$field['id_request_absen'].'"></input>';
            $row[]		=	!empty($field['tanggal']) ? date_format(date_create($field['tanggal']), 'd-m-Y') : '-';
            $row[]		=	!empty($guru['nama']) ? strtoupper($guru['nama']) : '-';
            $row[]		=	!empty($field['jam_masuk']) ? $field['jam_masuk'] : '-';
            $row[]		=	!empty($field['jam_pulang']) ? $field['jam_pulang'] : '-';
            $row[]		=	!empty($field['keterangan']) ? $field['keterangan'] : '-';
            $row[]		=	(!empty($field['foto'])) ? "<a href='".base_url('include/media/foto_request_absen/'.$field['foto'])."' target='__blank'>Lihat Foto</span>" : "";
            $row[]		=	($field['status'] == 0) ? "<span class='label label-danger'>Belum/tidak dikonfirmasi</span>" : "<span class='label label-success'>Terkonfirmasi</span>";
            $row[]		=	($field['status'] == 0) ? "<button onclick='konfirmasi(".$field['id_request_absen'].")' class='btn btn-success btn-sm'><i class='icon-check'></i></button>" : "";
           
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
	function konfirmasi($id){
		if (!empty($id)) {
			try {
				$flag = 0;
				$get_absen = $this->my_where("request_absen", ['id_request_absen'=>$id])->row_array();
				$tahun_ajaran		=	$this->my_where('tahun_ajaran',['is_active'=>1])->row_array();
				$data = [
					'idguru_fk'			=>	$get_absen['idguru_fk'],
					'tanggal'			=>	$get_absen['tanggal'],
					'jam_masuk'			=>	($get_absen['status_request'] == "MASUK" || $get_absen['status_request'] == "MASUK_PULANG") ? $get_absen['jam_masuk']:'',
					'jam_keluar'		=>	($get_absen['status_request'] == "PULANG"  || $get_absen['status_request'] == "MASUK_PULANG") ? $get_absen['jam_pulang']:'',
					'idtahunajaran_fk'	=>	$tahun_ajaran['id_tahun_ajaran']
				];

				$cek = $this->my_where('presensi_guru', [
					'idguru_fk'			=>	$get_absen['idguru_fk'],
					'tanggal'			=>	$get_absen['tanggal'],
					'idtahunajaran_fk'	=>	$tahun_ajaran['id_tahun_ajaran']
				]);

				if ($cek->num_rows() == 0) {
					if ($this->save_data('presensi_guru', $data)) {
						$flag = 1;
					}
				}else{
					if ($get_absen['status_request'] == "PULANG" || $get_absen['status_request'] == "MASUK_PULANG") {
						if ($cek->row_array()['jam_keluar'] == '00:00:00') {
						
							$this->my_update('presensi_guru', ['jam_keluar'=>$get_absen['jam_pulang']], [
								'idguru_fk'			=>	$get_absen['idguru_fk'],
								'tanggal'			=>	$get_absen['tanggal'],
								'idtahunajaran_fk'	=>	$tahun_ajaran['id_tahun_ajaran']
							]);
							$flag = 1;
						}
					}
					if ($get_absen['status_request'] == "MASUK" || $get_absen['status_request'] == "MASUK_PULANG") {
						if ($cek->row_array()['jam_masuk'] == '00:00:00') {
							$this->my_update('presensi_guru', ['jam_masuk'=>$get_absen['jam_masuk']], [
								'idguru_fk'			=>	$get_absen['idguru_fk'],
								'tanggal'			=>	$get_absen['tanggal'],
								'idtahunajaran_fk'	=>	$tahun_ajaran['id_tahun_ajaran']
							]);
							$flag = 1;
						}
					}
				}

				if ($flag == 1) {
					$this->my_update('request_absen', ['status'=>1], ['id_request_absen'=>$id]);
				}
				$guru = $this->my_where('guru', ['id_guru'=>$get_absen['idguru_fk']])->row_array();
				$msg = $requestAbsen ="Halo ".$guru['nama'].", status request absen anda : \n\n"
               . "\tNama  \t\t\t: " . str_pad($guru['nama'], 40) . "\n"
               . "\tTanggal \t\t\t: " . str_pad(date_format(date_create($get_absen['tanggal']), 'd-M-Y'), 40) . "\n"
               . "\tJam masuk \t\t: " . str_pad($get_absen['jam_masuk'], 40) . "\n"
               . "\tJam keluar \t\t: " . str_pad($get_absen['jam_pulang'], 40) . "\n"
               . "\tKeterangan \t\t: " . str_pad($get_absen['keterangan'], 40). "\n"
               . "\tTelah dikonfirmasi.\n\n"
               . "No Reply : BOT WA SMKKITA\n\n";

				$this->bot_wa($guru['no_hp'], $msg, 'request_absen', $id, 'admin');

			} catch (Exception $e) {
				
			}
		}
	}
	function get_stats_nav()
	{
		$data['total']		=	$this->my_where('request_absen', [])->num_rows();
		$data['hari_ini']	=	$this->my_where('request_absen', ['tanggal'=>date('Y-m-d')])->num_rows();

		$this->my_view(['role/admin/page/request_absen/index_page/stats'],$data);
	}
	function print_data($id)
	{
		$data['request_absen']	=	$this->my_where('request_absen',['id_request_absen'=>$id])->row_array();
		$data['template_request_absen']	=
		[
			'header' => $this->generate_code($this->my_where('setting_table',['table'=>'request_absen', 'name'=>'header_print_data'])->row_array()['value']),
			'footer' => $this->generate_code($this->my_where('setting_table',['table'=>'request_absen', 'name'=>'footer_print_data'])->row_array()['value']),
			'title' => $this->generate_code($this->my_where('setting_table',['table'=>'request_absen', 'name'=>'title_print_data'])->row_array()['value']),
		];
		
		$this->load->view('role/admin/page/request_absen/print/print_data',$data);
	}
	
	

}