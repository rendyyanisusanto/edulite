<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class calon_siswa extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman calon_siswa',
			'table'				=>	'calon_siswa',
			'column'			=>	[ 'nis','nama'],
			'column_order'		=>	[ 'nis','nama'],
			'column_search'		=>	[ 'nis','nama'],
			'order'				=>	['id_calon_siswa'	=>	'DESC'],
			'id'				=>	'id_calon_siswa'
	];

	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/admin/page/calon_siswa/index_page/index','role/admin/page/calon_siswa/index_page/js'],$data);
	}
	public function mutasi()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['kelas']		=	$this->my_where('kelas', [])->result_array();
		$this->my_view(['role/admin/page/calon_siswa/mutasi/index','role/admin/page/calon_siswa/mutasi/js'],$data);
	}
	public function kenaikan()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['tingkat']		=	$this->my_where('tingkat', [])->result_array();
		$data['jurusan']		=	$this->my_where('jurusan', [])->result_array();

		$data['kelas']		=	$this->my_where('kelas', [])->result_array();
		$this->my_view(['role/admin/page/calon_siswa/kenaikan/index','role/admin/page/calon_siswa/kenaikan/js'],$data);
	}

	public function kelulusan()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->db->order_by('id_tingkat', "DESC");
		$data['tingkat']		=	$this->my_where('tingkat', [])->result_array();
		$data['jurusan']		=	$this->my_where('jurusan', [])->result_array();
		$data['kelas']		=	$this->my_where('kelas', [])->result_array();
		$this->my_view(['role/admin/page/calon_siswa/kelulusan/index','role/admin/page/calon_siswa/kelulusan/js'],$data);
	}

	public function import_page()
	{
		$data['kelas']		=	$this->my_where('kelas', [])->result_array();
		$data['jurusan']	=	$this->my_where('jurusan', [])->result_array();
		$data['province']	=	$this->my_where('provinces', [])->result_array();
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/admin/page/calon_siswa/import_page/index','role/admin/page/calon_siswa/import_page/js'],$data);
	}
	public function add_page($no_reg="")
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['kelas']		=	$this->my_where('kelas', [])->result_array();
		$data['department']	=	$this->my_where('department', [])->result_array();
		$data['jurusan']	=	$this->my_where('jurusan', [])->result_array();
		$data['province']	=	$this->my_where('provinces', [])->result_array();

		if ($no_reg !="") {
		// echo $no_reg;
			$data['register']	=	json_decode($this->curl->simple_get('https://apippdb.smkitasy-syadzili.sch.id/index.php/register/filter?no_register='.$no_reg));

			// print_r($data['register']);
		}
		$this->my_view(['role/admin/page/calon_siswa/add_page/index','role/admin/page/calon_siswa/add_page/js'],$data);
	}
	public function perkelas()
	{
		$data['kelas']		=	$this->my_where('kelas', [])->result_array();
		$data['jurusan']	=	$this->my_where('jurusan', [])->result_array();
		$data['province']	=	$this->my_where('provinces', [])->result_array();
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/admin/page/calon_siswa/perkelas/index','role/admin/page/calon_siswa/perkelas/js'],$data);
	}

	public function edit_page($id)
	{
		if (isset($id)) {
				$data['param'] 		= 	$this->arr;
				$data['calon_siswa'] 		= 	$this->my_where('calon_siswa',['id_calon_siswa'=>$id])->row_array();
				$data['kelas']		=	$this->my_where('kelas', [])->result_array();
				$data['jurusan']	=	$this->my_where('jurusan', [])->result_array();
				$data['province']	=	$this->my_where('provinces', [])->result_array();
				$this->my_view(['role/kecalon_siswaan/page/calon_siswa/edit_page/index','role/kecalon_siswaan/page/calon_siswa/edit_page/js'],$data);
		} else {
			$this->get_data();
		}
	}

	public function detail_all($id)
	{
		if (isset($id)) {
			
				$data['param'] 		= 	$this->arr;
				$data['calon_siswa'] 	= $this->my_where('calon_siswa',['id_calon_siswa'=>$id])->row_array();

				$data['kelas']		=	$this->my_where('kelas', [])->result_array();
				$data['jurusan']	=	$this->my_where('jurusan', [])->result_array();
				$data['province']	=	$this->my_where('provinces', ['id' => $data['calon_siswa']['idprovince_fk']])->row_array();
				$data['city']		=	$this->my_where('cities', ['id' => $data['calon_siswa']['idcities_fk']])->row_array();
				$this->my_view(['role/kecalon_siswaan/page/calon_siswa/detail_page/index','role/kecalon_siswaan/page/calon_siswa/detail_page/js'],$data);
		} else {
			$this->get_data();
		}
		
	}
	
	public function upload_page()
	{
		$data['account']	=	$this->get_user_account();
		$this->my_view(['role/kecalon_siswaan/page/calon_siswa/upload_page','role/kecalon_siswaan/page/calon_siswa/js_upload_page'],$data);
	}
	/*
		ADD DATA
	*/
	

	public function simpan_data()
	{	


		$cek = $this->my_where('calon_siswa', [
			'nama' 					=>	$_POST['nama'],
			'tanggal_lahir'			=>	$_POST['tanggal_lahir'],
		])->num_rows();
		
		$send = [
			'status'	=>	500,
			'msg' => '',
		];
		if ($cek == 0) {
			// code...
			$foto = $this->save_media([
				'path'	=>	"./include/media/foto_calon_siswa/",
				'filename' => 'foto',
			]);

			$data_calon_siswa = [
				'foto'					=>	((isset($foto)) ? $foto['file_name'] : ''),
				'no_register'			=>	$_POST['no_register'],
				'nama' 					=>	$_POST['nama'],
				'tanggal_masuk'			=>	$_POST['tanggal_masuk'],
				'status_siswa'			=>	$_POST['status_siswa'],
				'no_hp'					=>	$_POST['no_hp'],
				'idjurusan_fk'			=>	$_POST['idjurusan_fk'],
				'iddepartment_fk'		=>	$_POST['iddepartment_fk'],
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

			$this->save_data('calon_siswa', $data_calon_siswa);
			$get_calon_siswa=$this->my_where('calon_siswa', [
				'no_register'			=>	$_POST['no_register'],
				'nama' 					=>	$_POST['nama'],
				'tanggal_masuk'			=>	$_POST['tanggal_masuk'],
			])->row_array();
			$dat = [] ;
			$image = [];
			$dokumen_calon_siswa = [];
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
	            
	            $config['upload_path'] = './include/media/dokumen_calon_siswa/';
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
	            $dokumen_calon_siswa[] = [
					'idcalonsiswa_fk'	=> $get_calon_siswa['id_calon_siswa'],
					'keterangan'	=> 'foto_calon_siswa',
					'foto'			=> $_FILES['file']['name']
	            ];
			}


	           $this->save_data_batch('calon_siswa_dokumen', $dokumen_calon_siswa);
			}

			$send = [
				'status'	=>	200,
				'msg' => 'Data calon siswa berhasil disimpan',
			];
		}else{
			$send = [
				'status'	=>	500,
				'msg' => 'Data calon siswa sudah ada',
			];
		}


		echo json_encode($send);

	}


	/*
		EDIT DATA
	*/
		
	function update_data()
	{
		$foto = $this->save_media([
			'path'	=>	"./include/media/foto_calon_siswa/",
			'filename' => 'foto',
		]);

		$data=[];
		$data=[
				'nis'					=>	$_POST['nis'],
				'nama' 					=>	$_POST['nama'],
				'idkelas_fk' 			=>	$_POST['idkelas_fk'],
				'idjurusan_fk'			=>	$_POST['idjurusan_fk'],
				'iddepartment_fk'		=>	$_POST['iddepartment_fk'],
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
				
		if ($this->my_update('calon_siswa',$data,['id_calon_siswa'=>$_POST['id_calon_siswa']])) {
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
			$this->db->delete('calon_siswa',['id_calon_siswa'=>$value]);
		}
	}

	/*
		PRINT DATA
	*/
		
		function cetak_page($id)
		{
			if (isset($id)) {
			
				$data['param'] 		= 	$this->arr;
				$data['calon_siswa'] 	= $this->my_where('calon_siswa',['id_calon_siswa'=>$id])->row_array();

				$data['kelas']		=	$this->my_where('kelas', [])->result_array();
				$data['jurusan']	=	$this->my_where('jurusan', [])->result_array();
				$data['province']	=	$this->my_where('provinces', ['id' => $data['calon_siswa']['idprovince_fk']])->row_array();
				$data['city']		=	$this->my_where('cities', ['id' => $data['calon_siswa']['idcities_fk']])->row_array();
				$this->load->view('role/kecalon_siswaan/page/calon_siswa/print/print_calon_siswa',$data);
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
            $row[]      =   '<input type="checkbox" name="get-check" value="'.$field['id_calon_siswa'].'"></input>';
            $row[]		=	'<a href="calon_siswa/detail_all/'.$field['id_calon_siswa'].'" class="app-item">'.strtoupper($field['nama']).'</a>';
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

	function get_jurusan()
	{
		$id 		= (isset($_POST['id'])) ? $_POST['id'] : 0;
		$get 		= $this->my_where('jurusan', ['iddepartment_fk'=>$id]);
		$idjurusan 	= (isset($_POST['idjurusan'])) ? $_POST['idjurusan'] : '';
		$send 		= "";
		if ($get->num_rows() > 0) {
			$get = $get->result_array();

			$send = '<select data-placeholder="Pilih Jurusan" name="idjurusan_fk" required class="select jurusan">';
			$send .= '<option value="">Pilih jurusan</option>';
			foreach ($get as $key => $value) {
				$send.='<option '.(($idjurusan == $value['id_jurusan']) ? 'selected' : '').' value="'.$value['id_jurusan'].'">'.$value['jurusan'].'</option>';
			}
			$send .='</select>';
			$send .= "<script>$('.select').select2();</script>";
		}else{
			$send 	= "<code>Tidak ada data</code>";
		}
		echo $send;
	}

	public function proses_calon_siswa($value='')
	{
		
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['calon_siswa'] = $this->my_where('v_calon_siswa_jurusan', ['idkelas_fk'=>$_POST['id_kelas']])->result_array(); 
		$data['kelas']	=	$this->my_where('kelas', ['id_kelas'=>$_POST['id_kelas']])->row_array();
		$this->my_view(['role/kecalon_siswaan/page/calon_siswa/perkelas/proses_calon_siswa','role/kecalon_siswaan/page/calon_siswa/perkelas/js_proses'],$data);
	}
	public function import_calon_siswa($value='')
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
			for($i = 12 ;$i < count($sheetData);$i++)
			{
				if (!empty($sheetData[$i]['1'])) {
			        $nama 			= $sheetData[$i]['1'];
			        $nis 			= (!empty($sheetData[$i]['2'])) ? $sheetData[$i]['2'] : '';
			        $nisn 			= (!empty($sheetData[$i]['3'])) ? $sheetData[$i]['3'] : '';
			        $agama 			= (!empty($sheetData[$i]['4'])) ? $sheetData[$i]['4'] : '';
			        $no_ijazah 		= (!empty($sheetData[$i]['5'])) ? $sheetData[$i]['5'] : '';
			        $tempat_lahir 	= (!empty($sheetData[$i]['6'])) ? $sheetData[$i]['6'] : '';
			        $tanggal_lahir 	= (!empty($sheetData[$i]['7'])) ? $sheetData[$i]['7'] : '';
			        $jenis_kelamin 	= (!empty($sheetData[$i]['8'])) ? $sheetData[$i]['8'] : '';
			        if (isset($sheetData[$i]['1'])) {
			        	$send [] = [
							'nama' 					=>  (!empty($nama)) ? strtoupper($nama) : '',
							'nis'					=>	(!empty($nis)) ? $nis : '',
							'nisn'					=>	(!empty($nisn)) ? $nisn : '',
							'agama'					=>	(!empty($agama)) ? $agama : '',
							'no_ijazah'				=>	(!empty($no_ijazah)) ? $no_ijazah : '',
							'tempat_lahir'			=>	(!empty($tempat_lahir)) ? $tempat_lahir : '',
							'tanggal_lahir'			=>	(!empty($tanggal_lahir)) ? $tanggal_lahir : '',
							'jenis_kelamin'			=>	(!empty($jenis_kelamin)) ? $jenis_kelamin : '',
							// 'idkelas_fk'			=>	$_POST['idkelas_fk']
						];
			        }
		    	}
		        
		    }
			
		    // print_r($send);
			// $this->save_data_batch('calon_siswa', $send);
		    // echo json_encode($sheetData);
		    // echo "assd";
		    $send	=	array_map('array_filter', $send);
		    $send 	=	array_filter($send);
		    $data['calon_siswa']	=	$send;
			$this->my_view(['role/admin/page/calon_siswa/import_page/proses_import'],$data);
		}
		// print_r($_FILES);
	}
	public function download_file_calon_siswa($id_kelas='')
	{
		$reader = new \PhpOffice\PhpSpreadsheet\Reader\Xlsx();
		$spreadsheet = $reader->load("include/template/excel/format_import_calon_siswa.xlsx");
		// $spreadsheet = \PhpOffice\PhpSpreadsheet\IOFactory::load();
		$kelas 		=	$this->my_where('kelas', ['id_kelas'=>$id_kelas])->row_array();
		//change it
		$sheet = $spreadsheet->getActiveSheet();
		$sheet->setCellValue('B9', $kelas['id_kelas']);
		$sheet->setCellValue('B10', $kelas['kelas']);

		//write it again to Filesystem with the same name (=replace)
		$writer = new Xlsx($spreadsheet);
		$fileName = "calon_siswa_KELAS_".$kelas['kelas'].".xlsx";
		header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment; filename="'. urlencode($fileName).'"');
        $writer->save('php://output');
	}
	public function import_calon_siswa_submit()
	{
		$send = [];
		foreach ($_POST['dt'] as $key => $value) {
			$send	=	[
				'nis' => $value['nis'],
				'nama' => $value['nama'],
				'nisn' => $value['nisn'],
				'idkelas_fk'	=>	$_POST['idkelas_fk'],
				'idjurusan_fk'	=>	$_POST['idjurusan_fk'],
				'tempat_lahir' => $_POST['tempat_lahir'],
				'jenis_kelamin' => $_POST['jenis_kelamin'],
			];

			$this->save_data('calon_siswa', $send);
		}
		echo json_encode($_POST['dt']);
	}

	function get_calon_siswa_mutasi()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['calon_siswa']		=	$this->my_where('calon_siswa', ['idkelas_fk'=>$_POST['idkelas']])->result_array();
		$data['kelas']		=	$this->my_where('kelas', ['id_kelas'=>$_POST['idkelas']])->row_array();
		$this->my_view(['role/admin/page/calon_siswa/mutasi/get_calon_siswa'],$data);		
	}
	function get_calon_siswa_kelulusan()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['calon_siswa']		=	$this->my_where('calon_siswa', ['idkelas_fk'=>$_POST['idkelas']])->result_array();
		$data['kelas']		=	$this->my_where('kelas', ['id_kelas'=>$_POST['idkelas']])->row_array();
		$this->my_view(['role/admin/page/calon_siswa/kelulusan/get_calon_siswa'],$data);		
	}

	function get_kelas_tujuan_mutasi()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['kelas']		=	$this->my_where('kelas', ['id_kelas'=>$_POST['idkelas']])->row_array();
		$data['calon_siswa']		=	$this->my_where('calon_siswa', ['idkelas_fk'=>$_POST['idkelas']])->result_array();
		$this->my_view(['role/admin/page/calon_siswa/mutasi/get_kelas_tujuan'],$data);	
	}

	function proses_pindah()
	{
		$kelas_asal = $this->my_where("kelas", ['id_kelas'=>$_POST['idkelas_asal']])->row_array();
		$kelas_tujuan = $this->my_where("kelas", ['id_kelas'=>$_POST['idkelas_tujuan']])->row_array();
		$id_calon_siswa = $_POST['idcalon_siswa_fk'];

		$this->save_data("pindah_kelas", [
			'idcalon_siswa_fk' => $id_calon_siswa,
			'idkelas_before' => $_POST['idkelas_asal'],
			'idkelas_after' => $_POST['idkelas_tujuan'],
			'keterangan'	=>	$_POST['alasan']
		]);
		$this->my_update("calon_siswa", [
			'idkelas_fk' => $_POST['idkelas_tujuan'],
			'idjurusan_fk' => $kelas_tujuan['idjurusan_fk']
		],[
			'id_calon_siswa'=>$id_calon_siswa
		]);
	}

	function proses_naik_kelas()
	{
		$kelas_asal = $this->my_where("kelas", ['id_kelas'=>$_POST['idkelas_asal']])->row_array();
		$kelas_tujuan = $this->my_where("kelas", ['id_kelas'=>$_POST['idkelas_tujuan']])->row_array();
		$id_calon_siswa = $_POST['idcalon_siswa_fk'];

		$this->save_data("log_kelas_calon_siswa", [
			'idcalon_siswa_fk' 			=> $id_calon_siswa,
			'idkelasbefore_fk' 		=> $_POST['idkelas_asal'],
			'idkelasafter_fk' 		=> $_POST['idkelas_tujuan'],
			'keterangan'	=>	'',
			'status'		=>	'NAIK KELAS'
		]);
		$this->my_update("calon_siswa", [
			'idkelas_fk' => $_POST['idkelas_tujuan'],
			'idjurusan_fk' => $kelas_tujuan['idjurusan_fk']
		],[
			'id_calon_siswa'=>$id_calon_siswa
		]);
	}

	function proses_alumni()
	{
		$id_calon_siswa = $_POST['idcalon_siswa_fk'];

		$calon_siswa = $this->my_where('calon_siswa', ['id_calon_siswa'=>$id_calon_siswa])->row_array();
		$jurusan = $this->my_where('jurusan', ['id_jurusan'=>$calon_siswa['idjurusan_fk']])->row_array();
		$alumni = [
			'foto'					=>	$calon_siswa['foto'],
			'tahun_lulus' 			=>	$_POST['tahun_lulus'], 	
			'nis'					=>	$calon_siswa['nis'],
			'nama' 					=>	$calon_siswa['nama'],
			'jurusan'				=>	$jurusan['jurusan'],
			'agama' 				=>	$calon_siswa['agama'],
			'jenis_kelamin'			=>	$calon_siswa['jenis_kelamin'],
			'nisn' 					=>	$calon_siswa['nisn'],
			'no_ijazah_sekolah_asal'=>	$calon_siswa['no_ijazah_sekolah_asal'],
			'no_skhun_sekolah_asal'	=>	$calon_siswa['no_skhun_sekolah_asal'],
			'no_un_sekolah_asal'	=>	$calon_siswa['no_un_sekolah_asal'],
			'no_kk'					=>	$calon_siswa['no_kk'],
			'npsn_sekolah_asal'		=>	$calon_siswa['npsn_sekolah_asal'],
			'nama_sekolah_asal'		=>	$calon_siswa['nama_sekolah_asal'],	
			'tempat_lahir'			=>	$calon_siswa['tempat_lahir'],
			'tanggal_lahir'			=>	$calon_siswa['tanggal_lahir'],
			'berkebutuhan_khusus'	=>	$calon_siswa['berkebutuhan_khusus'],
			'alamat'				=>	$calon_siswa['alamat'],
			'dusun'					=>	$calon_siswa['dusun'],
			'rt'					=>	$calon_siswa['rt'],
			'rw'					=>	$calon_siswa['rw'],
			'kelurahan'				=>	$calon_siswa['kelurahan'],
			'idprovince_fk'			=>	$calon_siswa['idprovince_fk'],
			'idcities_fk'			=>	$calon_siswa['idcities_fk'],
			'nama_ayah'				=>	$calon_siswa['nama_ayah'],
			'tempat_lahir_ayah'		=>	$calon_siswa['tempat_lahir_ayah'],
			'tanggal_lahir_ayah'	=>	$calon_siswa['tanggal_lahir_ayah'],
			'pendidikan_ayah'		=>	$calon_siswa['pendidikan_ayah'],
			'pekerjaan_ayah'		=>	$calon_siswa['pekerjaan_ayah'],
			'penghasilan_ayah'		=>	$calon_siswa['penghasilan_ayah'],
			'nama_ibu'				=>	$calon_siswa['nama_ibu'],
			'tempat_lahir_ibu'		=>	$calon_siswa['tempat_lahir_ibu'],
			'tanggal_lahir_ibu'		=>	$calon_siswa['tanggal_lahir_ibu'],
			'pendidikan_ibu'		=>	$calon_siswa['pendidikan_ibu'],
			'pekerjaan_ibu'			=>	$calon_siswa['pekerjaan_ibu'],
			'penghasilan_ibu'		=>	$calon_siswa['penghasilan_ibu'],
			'tinggi_badan'			=>	$calon_siswa['tinggi_badan'],
			'berat_badan'			=>	$calon_siswa['berat_badan'],
			'jarak_ke_sekolah'		=>	$calon_siswa['jarak_ke_sekolah'],
			'jumlah_saudara'		=>	$calon_siswa['jumlah_saudara'],
			'is_calon_siswa_id'			=>	$id_calon_siswa,
		];
		$this->save_data('alumni', $alumni);
		$this->my_update('calon_siswa', ['is_alumni'=>1, 'idkelas_fk'=>'', 'idjurusan_fk'=>''], ['id_calon_siswa' =>$id_calon_siswa]);
	}

	function proses_alumni_kelas()
	{
		$calon_siswa_kelas = $this->my_where("calon_siswa", ['idkelas_fk'=>$_POST['idkelas_asal']])->result_array();

		foreach ($calon_siswa_kelas as $calon_siswa) {
			$jurusan = $this->my_where('jurusan', ['id_jurusan'=>$calon_siswa['idjurusan_fk']])->row_array();
			$alumni = [
				'foto'					=>	$calon_siswa['foto'],
				'nis'					=>	$calon_siswa['nis'],
				'tahun_lulus' 			=>	$_POST['tahun_lulus'], 	
				'nama' 					=>	$calon_siswa['nama'],
				'jurusan'				=>	$jurusan['jurusan'],
				'agama' 				=>	$calon_siswa['agama'],
				'jenis_kelamin'			=>	$calon_siswa['jenis_kelamin'],
				'nisn' 					=>	$calon_siswa['nisn'],
				'no_ijazah_sekolah_asal'=>	$calon_siswa['no_ijazah_sekolah_asal'],
				'no_skhun_sekolah_asal'	=>	$calon_siswa['no_skhun_sekolah_asal'],
				'no_un_sekolah_asal'	=>	$calon_siswa['no_un_sekolah_asal'],
				'no_kk'					=>	$calon_siswa['no_kk'],
				'npsn_sekolah_asal'		=>	$calon_siswa['npsn_sekolah_asal'],
				'nama_sekolah_asal'		=>	$calon_siswa['nama_sekolah_asal'],	
				'tempat_lahir'			=>	$calon_siswa['tempat_lahir'],
				'tanggal_lahir'			=>	$calon_siswa['tanggal_lahir'],
				'berkebutuhan_khusus'	=>	$calon_siswa['berkebutuhan_khusus'],
				'alamat'				=>	$calon_siswa['alamat'],
				'dusun'					=>	$calon_siswa['dusun'],
				'rt'					=>	$calon_siswa['rt'],
				'rw'					=>	$calon_siswa['rw'],
				'kelurahan'				=>	$calon_siswa['kelurahan'],
				'idprovince_fk'			=>	$calon_siswa['idprovince_fk'],
				'idcities_fk'			=>	$calon_siswa['idcities_fk'],
				'nama_ayah'				=>	$calon_siswa['nama_ayah'],
				'tempat_lahir_ayah'		=>	$calon_siswa['tempat_lahir_ayah'],
				'tanggal_lahir_ayah'	=>	$calon_siswa['tanggal_lahir_ayah'],
				'pendidikan_ayah'		=>	$calon_siswa['pendidikan_ayah'],
				'pekerjaan_ayah'		=>	$calon_siswa['pekerjaan_ayah'],
				'penghasilan_ayah'		=>	$calon_siswa['penghasilan_ayah'],
				'nama_ibu'				=>	$calon_siswa['nama_ibu'],
				'tempat_lahir_ibu'		=>	$calon_siswa['tempat_lahir_ibu'],
				'tanggal_lahir_ibu'		=>	$calon_siswa['tanggal_lahir_ibu'],
				'pendidikan_ibu'		=>	$calon_siswa['pendidikan_ibu'],
				'pekerjaan_ibu'			=>	$calon_siswa['pekerjaan_ibu'],
				'penghasilan_ibu'		=>	$calon_siswa['penghasilan_ibu'],
				'tinggi_badan'			=>	$calon_siswa['tinggi_badan'],
				'berat_badan'			=>	$calon_siswa['berat_badan'],
				'jarak_ke_sekolah'		=>	$calon_siswa['jarak_ke_sekolah'],
				'jumlah_saudara'		=>	$calon_siswa['jumlah_saudara'],
				'is_calon_siswa_id'			=>	$calon_siswa['id_calon_siswa'],
			];
			$this->save_data('alumni', $alumni);
			$this->my_update('calon_siswa', ['is_alumni'=>1, 'idkelas_fk'=>'', 'idjurusan_fk'=>''], ['id_calon_siswa' =>$calon_siswa['id_calon_siswa']]);
		}
	}
	function get_kelas_kenaikan()
	{
		$id 		= (isset($_POST['id_tingkat'])) ? $_POST['id_tingkat'] : 0;
		$id_jurusan 	= (isset($_POST['id_jurusan'])) ? $_POST['id_jurusan'] : '';
		$get 		= $this->my_where('kelas', ['idtingkat_fk'=>$id, 'idjurusan_fk'=>$id_jurusan]);
		$send 		= "";
		if ($get->num_rows() > 0) {
			$get = $get->result_array();

			$send = '<select data-placeholder="Pilih Kelas" name="id_kelas" required class="select select_class">';
			$send .= '<option value="">Pilih Kelas</option>';
			foreach ($get as $key => $value) {
				$send.='<option value="'.$value['id_kelas'].'">'.$value['kelas'].'</option>';
			}
			$send .='</select>';
			$send .= "<script>$('.select').select2();</script>";
		}else{
			$send 	= "<code>Tidak ada data</code>";
		}
		echo $send;
	}
	function get_kelas_kenaikan_next()
	{
		$id 		= (isset($_POST['id_tingkat'])) ? ($_POST['id_tingkat'] + 1) : 0;
		$id_jurusan 	= (isset($_POST['id_jurusan'])) ? $_POST['id_jurusan'] : '';
		$get 		= $this->my_where('kelas', ['idtingkat_fk'=>$id, 'idjurusan_fk'=>$id_jurusan]);
		$send 		= "";
		if ($get->num_rows() > 0) {
			$get = $get->result_array();
			$send = '<select data-placeholder="Pilih Kelas" name="id_kelas" required class="select select_class_tujuan">';
			$send .= '<option value="">Pilih Kelas</option>';
			foreach ($get as $key => $value) {
				$send.='<option value="'.$value['id_kelas'].'">'.$value['kelas'].'</option>';
			}
			$send .='</select>';
			$send .= "<script>$('.select').select2();</script>";
		}else{
			$send 	= "<code>Tidak ada data</code>";
		}
		echo $send;
	}
}