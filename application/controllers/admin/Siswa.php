<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class siswa extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman Siswa',
			'table'				=>	'siswa',
			'column'			=>	[ 'nis','nama'],
			'column_order'		=>	[ 'nis','nama'],
			'column_search'		=>	[ 'nis','nama'],
			'order'				=>	['id_siswa'	=>	'DESC'],
			'id'				=>	'id_siswa'
	];

	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/kesiswaan/page/siswa/index_page/index','role/kesiswaan/page/siswa/index_page/js'],$data);
	}

	public function import_page()
	{
		$data['kelas']		=	$this->my_where('kelas', [])->result_array();
		$data['jurusan']	=	$this->my_where('jurusan', [])->result_array();
		$data['province']	=	$this->my_where('provinces', [])->result_array();
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/admin/page/siswa/import_page/index','role/admin/page/siswa/import_page/js'],$data);
	}
	public function add_page()
	{
		$data['kelas']		=	$this->my_where('kelas', [])->result_array();
		$data['jurusan']	=	$this->my_where('jurusan', [])->result_array();
		$data['province']	=	$this->my_where('provinces', [])->result_array();
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/kesiswaan/page/siswa/add_page/index','role/kesiswaan/page/siswa/add_page/js'],$data);
	}
	public function perkelas()
	{
		$data['kelas']		=	$this->my_where('kelas', [])->result_array();
		$data['jurusan']	=	$this->my_where('jurusan', [])->result_array();
		$data['province']	=	$this->my_where('provinces', [])->result_array();
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/kesiswaan/page/siswa/perkelas/index','role/kesiswaan/page/siswa/perkelas/js'],$data);
	}

	public function edit_page($id)
	{
		if (isset($id)) {
				$data['param'] 		= 	$this->arr;
				$data['siswa'] 		= 	$this->my_where('siswa',['id_siswa'=>$id])->row_array();
				$data['kelas']		=	$this->my_where('kelas', [])->result_array();
				$data['jurusan']	=	$this->my_where('jurusan', [])->result_array();
				$data['province']	=	$this->my_where('provinces', [])->result_array();
				$this->my_view(['role/kesiswaan/page/siswa/edit_page/index','role/kesiswaan/page/siswa/edit_page/js'],$data);
		} else {
			$this->get_data();
		}
	}

	public function detail_all($id)
	{
		if (isset($id)) {
			
				$data['param'] 		= 	$this->arr;
				$data['siswa'] 	= $this->my_where('siswa',['id_siswa'=>$id])->row_array();

				$data['kelas']		=	$this->my_where('kelas', [])->result_array();
				$data['jurusan']	=	$this->my_where('jurusan', [])->result_array();
				$data['province']	=	$this->my_where('provinces', ['id' => $data['siswa']['idprovince_fk']])->row_array();
				$data['city']		=	$this->my_where('cities', ['id' => $data['siswa']['idcities_fk']])->row_array();
				$this->my_view(['role/kesiswaan/page/siswa/detail_page/index','role/kesiswaan/page/siswa/detail_page/js'],$data);
		} else {
			$this->get_data();
		}
		
	}
	
	public function upload_page()
	{
		$data['account']	=	$this->get_user_account();
		$this->my_view(['role/kesiswaan/page/siswa/upload_page','role/kesiswaan/page/siswa/js_upload_page'],$data);
	}
	/*
		ADD DATA
	*/
	

	public function simpan_data()
	{	

		$foto = $this->save_media([
			'path'	=>	"./include/media/foto_siswa/",
			'filename' => 'foto',
		]);

		$data_siswa = [
			'foto'					=>	((isset($foto)) ? $foto['file_name'] : ''),
			'nis'					=>	$_POST['nis'],
			'nama' 					=>	$_POST['nama'],
			'idkelas_fk' 			=>	$_POST['idkelas_fk'],
			'idjurusan_fk'			=>	$_POST['idjurusan_fk'],
			'agama' 				=>	$_POST['agama'],
			'jenis_kelamin'			=>	$_POST['jenis_kelamin'],
			'nisn' 					=>	$_POST['nisn'],
			'no_ijazah_sekolah_asal'=>	$_POST['no_ijazah_sekolah_asal'],
			'no_skhun_sekolah_asal'	=>	$_POST['no_skhun_sekolah_asal'],
			'no_un_sekolah_asal'	=>	$_POST['no_un_sekolah_asal'],
			'no_kk'					=>	$_POST['no_kk'],
			'npsn_sekolah_asal'		=>	$_POST['npsn_sekolah_asal'],
			'nama_sekolah_asal'		=>	$_POST['nama_sekolah_asal'],	
			'tempat_lahir'			=>	$_POST['tempat_lahir'],
			'tanggal_lahir'			=>	$_POST['tanggal_lahir'],
			'berkebutuhan_khusus'	=>	$_POST['berkebutuhan_khusus'],
			'alamat'				=>	$_POST['alamat'],
			'dusun'					=>	$_POST['dusun'],
			'rt'					=>	$_POST['rt'],
			'rw'					=>	$_POST['rw'],
			'kelurahan'				=>	$_POST['kelurahan'],
			'idprovince_fk'			=>	$_POST['idprovince_fk'],
			'idcities_fk'			=>	((isset($_POST['idcities_fk'])) ? $_POST['idcities_fk'] : 0),
			'nama_ayah'				=>	$_POST['nama_ayah'],
			'tempat_lahir_ayah'		=>	$_POST['tempat_lahir_ayah'],
			'tanggal_lahir_ayah'	=>	$_POST['tanggal_lahir_ayah'],
			'pendidikan_ayah'		=>	$_POST['pendidikan_ayah'],
			'pekerjaan_ayah'		=>	$_POST['pekerjaan_ayah'],
			'penghasilan_ayah'		=>	$_POST['penghasilan_ayah'],
			'nama_ibu'				=>	$_POST['nama_ibu'],
			'tempat_lahir_ibu'		=>	$_POST['tempat_lahir_ibu'],
			'tanggal_lahir_ibu'		=>	$_POST['tanggal_lahir_ibu'],
			'pendidikan_ibu'		=>	$_POST['pendidikan_ibu'],
			'pekerjaan_ibu'			=>	$_POST['pekerjaan_ibu'],
			'penghasilan_ibu'		=>	$_POST['penghasilan_ibu'],
			'tinggi_badan'			=>	$_POST['tinggi_badan'],
			'berat_badan'			=>	$_POST['berat_badan'],
			'jarak_ke_sekolah'		=>	$_POST['jarak_ke_sekolah'],
			'jumlah_saudara'		=>	$_POST['jumlah_saudara'],
		];

		// dokumen

		$this->save_data('siswa', $data_siswa);
		$get_siswa=$this->my_where('siswa', $data_siswa)->row_array();
		$dat = [] ;
		$image = [];
		$dokumen_siswa = [];
		if (isset($_FILES['dokumen'])) {
			
		for($i = 0; $i < count($_FILES['dokumen']['name']); $i++)
		{
			$_FILES['file']['name']       = $_FILES['dokumen']['name'][$i]['foto'];
            $_FILES['file']['type']       = $_FILES['dokumen']['type'][$i]['foto'];
            $_FILES['file']['tmp_name']   = $_FILES['dokumen']['tmp_name'][$i]['foto'];
            $_FILES['file']['error']      = $_FILES['dokumen']['error'][$i]['foto'];
            $_FILES['file']['size']       = $_FILES['dokumen']['size'][$i]['foto'];
            // $image[] = $_FILES['file'];																														
            // File upload configuration
            
            $config['upload_path'] = './include/media/dokumen_siswa/';
        	$config['allowed_types']='gif|jpg|png|pdf|doc|docx|xls|xlsx'; //type file yang boleh di upload
            $config['encrypt_name'] = TRUE; //enkripsi file name upload
            // Load and initialize upload library
            $this->load->library('upload', $config);
            $this->upload->initialize($config);

            // Upload file to server
            if($this->upload->do_upload('file')){
                // Uploaded file data
            }else{
            	$image[] = $this->upload->display_errors();
            }
            $dokumen_siswa[] = [
				'idsiswa_fk'	=> $get_siswa['id_siswa'],
				'keterangan'	=> 'foto_siswa',
				'foto'			=> $_FILES['file']['name']
            ];
		}


           $this->save_data_batch('siswa_dokumen', $dokumen_siswa);
		}


		if (isset($_POST['beasiswa'])) {
			$siswa_beasiswa = [];
       		foreach ($_POST['beasiswa'] as $key => $value) {
       			$siswa_beasiswa[] = [
       				'idsiswa_fk'	=>	$get_siswa['id_siswa'],
					'jenis'			=>	$value['jenis'],
					'penyelenggara'	=>	$value['penyelenggara'],
					'tahun_mulai'	=>	$value['tahun_mulai'],
					'tahun_selesai'	=>	$value['tahun_selesai']
       			];
       		}
           $this->save_data_batch('siswa_beasiswa', $siswa_beasiswa);
		}
           
          if (isset($_POST['prestasi'])) {
   		$siswa_prestasi = [];
           foreach ($_POST['prestasi'] as $key => $value) {
           	$siswa_prestasi[] 	=	[
				'idsiswa_fk'		=>	$get_siswa['id_siswa'],
				'jenis'				=>	$value['jenis'],
				'tingkat'			=>	$value['tingkat'],
				'nama'				=>	$value['nama'],
				'tahun'				=>	$value['tahun'],
				'penyelenggara'		=>	$value['penyelenggara']
           	];
           }

           $this->save_data_batch('siswa_prestasi', $siswa_prestasi);
       
          }
           
		echo json_encode($siswa_prestasi);

	}


	/*
		EDIT DATA
	*/
		
	function update_data()
	{
		$foto = $this->save_media([
			'path'	=>	"./include/media/foto_siswa/",
			'filename' => 'foto',
		]);

		$data=[];
		$data=[
				'nis'					=>	$_POST['nis'],
				'nama' 					=>	$_POST['nama'],
				'idkelas_fk' 			=>	$_POST['idkelas_fk'],
				'idjurusan_fk'			=>	$_POST['idjurusan_fk'],
				'agama' 				=>	$_POST['agama'],
				'jenis_kelamin'			=>	$_POST['jenis_kelamin'],
				'nisn' 					=>	$_POST['nisn'],
				'no_ijazah_sekolah_asal'=>	$_POST['no_ijazah_sekolah_asal'],
				'no_skhun_sekolah_asal'	=>	$_POST['no_skhun_sekolah_asal'],
				'no_un_sekolah_asal'	=>	$_POST['no_un_sekolah_asal'],
				'no_kk'					=>	$_POST['no_kk'],
				'npsn_sekolah_asal'		=>	$_POST['npsn_sekolah_asal'],
				'nama_sekolah_asal'		=>	$_POST['nama_sekolah_asal'],	
				'tempat_lahir'			=>	$_POST['tempat_lahir'],
				'tanggal_lahir'			=>	$_POST['tanggal_lahir'],
				'berkebutuhan_khusus'	=>	$_POST['berkebutuhan_khusus'],
				'alamat'				=>	$_POST['alamat'],
				'dusun'					=>	$_POST['dusun'],
				'rt'					=>	$_POST['rt'],
				'rw'					=>	$_POST['rw'],
				'kelurahan'				=>	$_POST['kelurahan'],
				// 'idprovince_fk'			=>	$_POST['idprovince_fk'],
				// 'idcities_fk'			=>	$_POST['idcities_fk'],
				'nama_ayah'				=>	$_POST['nama_ayah'],
				'tempat_lahir_ayah'		=>	$_POST['tempat_lahir_ayah'],
				'tanggal_lahir_ayah'	=>	$_POST['tanggal_lahir_ayah'],
				'pendidikan_ayah'		=>	$_POST['pendidikan_ayah'],
				'pekerjaan_ayah'		=>	$_POST['pekerjaan_ayah'],
				'penghasilan_ayah'		=>	$_POST['penghasilan_ayah'],
				'nama_ibu'				=>	$_POST['nama_ibu'],
				'tempat_lahir_ibu'		=>	$_POST['tempat_lahir_ibu'],
				'tanggal_lahir_ibu'		=>	$_POST['tanggal_lahir_ibu'],
				'pendidikan_ibu'		=>	$_POST['pendidikan_ibu'],
				'pekerjaan_ibu'			=>	$_POST['pekerjaan_ibu'],
				'penghasilan_ibu'		=>	$_POST['penghasilan_ibu'],
				'tinggi_badan'			=>	$_POST['tinggi_badan'],
				'berat_badan'			=>	$_POST['berat_badan'],
				'jarak_ke_sekolah'		=>	$_POST['jarak_ke_sekolah'],
				'jumlah_saudara'		=>	$_POST['jumlah_saudara'],
				];
				
		if ($this->my_update('siswa',$data,['id_siswa'=>$_POST['id_siswa']])) {
			print_r(((isset($foto)) ? $foto['file_name'] : $_POST['foto_before']));
		}	else 	{
			echo "error";
		}

	}

	/*
		DELETE DATA
	*/

	function hapus()
	{
		foreach ($_POST['data_get'] as $key => $value) {
			$this->db->delete('siswa',['id_siswa'=>$value]);
		}
	}

	/*
		PRINT DATA
	*/
		
		function cetak_page($id)
		{
			if (isset($id)) {
			
				$data['param'] 		= 	$this->arr;
				$data['siswa'] 	= $this->my_where('siswa',['id_siswa'=>$id])->row_array();

				$data['kelas']		=	$this->my_where('kelas', [])->result_array();
				$data['jurusan']	=	$this->my_where('jurusan', [])->result_array();
				$data['province']	=	$this->my_where('provinces', ['id' => $data['siswa']['idprovince_fk']])->row_array();
				$data['city']		=	$this->my_where('cities', ['id' => $data['siswa']['idcities_fk']])->row_array();
				$this->load->view('role/kesiswaan/page/siswa/print/print_siswa',$data);
			} else {
				$this->get_data();
			}
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
            $row[]      =   '<input type="checkbox" name="get-check" value="'.$field['id_siswa'].'"></input>';
            $row[]		=	'<a href="siswa/detail_all/'.$field['id_siswa'].'" class="app-item">'.strtoupper($field['nama']).'</a>';
            $row[]		=	!empty($field['nisn']) ? $field['nisn'] : '-';
            $row[]		=	!empty($field['nis']) ? $field['nis'] : '-';
            $row[]		=	!empty($field['tempat_lahir']) ? $field['tempat_lahir'] : '-';
            $row[]		=	!empty($field['alamat']) ? $field['alamat'] : '-';
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

	function get_cities()
	{
		$dt = $_POST['dt_send'];

		$data = '';
		$get = $this->my_where('cities', ['province_id' => $dt])->result_array();
		foreach ($get as $key => $value) {
			$data .= '<option value="'.$value['id'].'">'.$value['name'].'</option>';
		}

		echo $data;
	}

	function get_kelas()
	{
		$id 		= (isset($_POST['id'])) ? $_POST['id'] : 0;
		$idkelas 	= (isset($_POST['idkelas'])) ? $_POST['idkelas'] : '';
		$get 		= $this->my_where('kelas', ['idjurusan_fk'=>$id]);
		$send 		= "";
		if ($get->num_rows() > 0) {
			$get = $get->result_array();

			$send = '<select data-placeholder="Pilih Kelas" name="idkelas_fk" required class="select kelas">';
			$send .= '<option value="">Pilih Kelas</option>';
			foreach ($get as $key => $value) {
				$send.='<option '.(($idkelas == $value['id_kelas']) ? 'selected' : '').' value="'.$value['id_kelas'].'">'.$value['kelas'].'</option>';
			}
			$send .='</select>';
			$send .= "<script>$('.select').select2();</script>";
		}else{
			$send 	= "<code>Tidak ada data</code>";
		}
		
		
		

		echo $send;
	}

	public function proses_siswa($value='')
	{
		
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['siswa'] = $this->my_where('v_siswa_jurusan', ['idkelas_fk'=>$_POST['id_kelas']])->result_array(); 
		$data['kelas']	=	$this->my_where('kelas', ['id_kelas'=>$_POST['id_kelas']])->row_array();
		$this->my_view(['role/kesiswaan/page/siswa/perkelas/proses_siswa','role/kesiswaan/page/siswa/perkelas/js_proses'],$data);
	}
	public function import_siswa($value='')
	{
		$file_mimes = array('application/octet-stream', 'application/vnd.ms-excel', 'application/x-csv', 'text/x-csv', 'text/csv', 'application/csv', 'application/excel', 'application/vnd.msexcel', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
 
		if(isset($_FILES['file_upload']['name']) && in_array($_FILES['file_upload']['type'], $file_mimes)) {
		 	
		    $arr_file = explode('.', $_FILES['file_upload']['name']);
		    $extension = end($arr_file);
		 
		    if($extension == 'csv'){
                    $reader = new \PhpOffice\PhpSpreadsheet\Reader\Csv();
                } elseif($extension == 'xlsx') {
                    $reader = new \PhpOffice\PhpSpreadsheet\Reader\Xlsx();
                } else {
                    $reader = new \PhpOffice\PhpSpreadsheet\Reader\Xls();
                }
		 
		    $spreadsheet = $reader->load($_FILES['file_upload']['tmp_name']);
		    $send = [];
		    // $sheetData = $spreadsheet->getActiveSheet();
			$sheetData = $spreadsheet->getActiveSheet()->toArray();
			for($i = 13 ;$i < count($sheetData);$i++)
			{
		        $nama 			= $sheetData[$i]['1'];
		        $nis 			= $sheetData[$i]['2'];
		        $nisn 			= $sheetData[$i]['3'];
		        $agama 			= $sheetData[$i]['4'];
		        $no_ijazah 		= $sheetData[$i]['5'];
		        $tempat_lahir 	= $sheetData[$i]['6'];
		        $tanggal_lahir 	= $sheetData[$i]['7'];
		        if (isset($sheetData[$i]['1'])) {
		        	$send [] = [
						'nama' 					=>  (!empty($nama)) ? $nama : '',
						'nis'					=>	(!empty($nis)) ? $nis : '',
						'nisn'					=>	(!empty($nisn)) ? $nisn : '',
						'agama'					=>	(!empty($agama)) ? $agama : '',
						'no_ijazah'				=>	(!empty($no_ijazah)) ? $no_ijazah : '',
						'tempat_lahir'			=>	(!empty($tempat_lahir)) ? $tempat_lahir : '',
						'tanggal_lahir'			=>	(!empty($tanggal_lahir)) ? $tanggal_lahir : '',
						// 'idkelas_fk'			=>	$_POST['idkelas_fk']
					];
		        }
		        
		    }
			
		    // print_r($send);
			// $this->save_data_batch('siswa', $send);
		    // echo json_encode($sheetData);
		    // echo "assd";
		    $send	=	array_map('array_filter', $send);
		    $send 	=	array_filter($send);
		    $data['siswa']	=	$send;
			$this->my_view(['role/admin/page/siswa/import_page/proses_import'],$data);
		}
		// print_r($_FILES);
	}
	public function download_file_siswa($id_kelas='')
	{
		$reader = new \PhpOffice\PhpSpreadsheet\Reader\Xlsx();
		$spreadsheet = $reader->load("include/template/excel/format_import_siswa.xlsx");
		// $spreadsheet = \PhpOffice\PhpSpreadsheet\IOFactory::load();
		$kelas 		=	$this->my_where('kelas', ['id_kelas'=>$id_kelas])->row_array();
		//change it
		$sheet = $spreadsheet->getActiveSheet();
		$sheet->setCellValue('B9', $kelas['id_kelas']);
		$sheet->setCellValue('B10', $kelas['kelas']);

		//write it again to Filesystem with the same name (=replace)
		$writer = new Xlsx($spreadsheet);
		$fileName = "SISWA_KELAS_".$kelas['kelas'].".xlsx";
		header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment; filename="'. urlencode($fileName).'"');
        $writer->save('php://output');
	}
	public function import_siswa_submit()
	{
		$send = [];
		foreach ($_POST['dt'] as $key => $value) {
			$send	=	[
				'nis' => $value['nis'],
				'nama' => $value['nama'],
				'nisn' => $value['nisn'],
				'idkelas_fk'	=>	$_POST['idkelas_fk'],
				'idjurusan_fk' => $_POST['idjurusan_fk']
			];

			$this->save_data('siswa', $send);
		}
		echo json_encode($_POST['dt']);
	}

}