<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class kepegawaian extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman kepegawaian',
			'table'				=>	'guru',
			'column'			=>	['nama','nip','alamat','no_hp','kode_pegawai'],
			'column_order'		=>	[ 'id_guru','nama','nip','alamat','no_hp','kode_pegawai'],
			'column_search'		=>	[ 'id_guru','nama','nip','alamat','no_hp','kode_pegawai'],
			'order'				=>	['id_guru'	=>	'DESC'],
			'id'				=>	'id_guru'
	];




	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/admin/page/kepegawaian/index_page/index','role/admin/page/kepegawaian/index_page/js'],$data);
	}

	public function add_page()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/admin/page/kepegawaian/add_page/index','role/admin/page/kepegawaian/add_page/js'],$data);
	}

	public function edit_page($id)
	{
		if (isset($id)) {
				$data['param'] 		= 	$this->arr;
				$data['guru'] = 	$this->my_where('guru',['id_guru'=>$id])->row_array();
				$this->my_view(['role/admin/page/kepegawaian/edit_page/index','role/admin/page/kepegawaian/edit_page/js'],$data);
		} else {
			$this->get_data();
		}
	}

	public function detail_page($id)
	{
		if (isset($id)) {
				$data['param'] 		= 	$this->arr;
				$data['guru'] 		= 	$this->my_where('guru',['id_guru'=>$id])->row_array();
				$data['anak']		=	$this->my_where('anak_pegawai', ['idguru_fk'=>$id])->result_array();
				$this->my_view(['role/admin/page/kepegawaian/detail_page/index','role/admin/page/kepegawaian/detail_page/js'],$data);
		} else {
			$this->get_data();
		}
	}

	/*
		ADD DATA
	*/


	public function simpan_data()
	{	
		// $random_code = 'G'.rand(0,999999);
		$foto = '';
		if(file_exists($_FILES['foto']['tmp_name']) || is_uploaded_file($_FILES['foto']['tmp_name'])) {
			$foto = $this->save_media([
				'path'	=>	"./include/media/foto_pegawai/",
				'filename' => 'foto',
			]);
		}
		
		$data = [
			'nama'					=>	$_POST['nama'],
			'nip'					=>	$_POST['nip'],
			'alamat'				=>	$_POST['alamat'],
			'foto'					=> ((isset($foto)) ? $foto['file_name'] : ''),
			'email'					=>	$_POST['email'],
			'no_hp'					=>	$_POST['no_hp'],
			'jenis_kelamin'			=>	$_POST['jenis_kelamin'],
			'tempat_lahir'			=>	$_POST['tempat_lahir'],
			'tanggal_lahir'			=>	$_POST['tanggal_lahir'],
			'agama'					=>	$_POST['agama'],
			'kewarganegaraan'		=>	$_POST['kewarganegaraan'],
			'status_pernikahan'		=>	$_POST['status_pernikahan'],
			'status_rumah'			=>	$_POST['status_rumah'],
			'jarak_ke_kantor'		=>	$_POST['jarak_ke_kantor'],
			'bb'					=>	$_POST['bb'],
			'tb'					=>	$_POST['tb'],
			'gd'					=>	$_POST['gd'],
			'penyakit'				=>	$_POST['penyakit'],
			'kelainan'				=>	$_POST['kelainan'],
			'no_karpeg'				=>	$_POST['no_karpeg'],
			'mulai_bertugas'		=>	$_POST['mulai_bertugas'],
			'berasal_dari'			=>	$_POST['berasal_dari'],
			'tanggal_meninggalkan'	=>	$_POST['tanggal_meninggalkan'],
			'alasan_meninggalkan'	=>	$_POST['alasan_meninggalkan'],
			'kode_pegawai'			=>	$_POST['kode_pegawai'],
			'istri'					=>	$_POST['istri'],
			'status_kepegawaian'	=>	$_POST['status_kepegawaian'],
			'no_taspen'				=>	$_POST['no_taspen']
		];
		if ($this->save_data('guru', $data)) {
			$dataguru = $this->my_where('guru',['kode_pegawai'=>$random_code])->row_array();

			if (!empty($dataguru['kode_pegawai'])) {
				
				// data anak
				if (!empty($_POST['anak'])) {
					foreach ($_POST['anak'] as $key => $value) {
						$data_anak[] = [
							'idguru_fk'			=>	$dataguru['id_guru'],
							'nama'				=>	$value['nama'],
							'tempat_lahir'		=>	$value['tempat_lahir'],
							'tanggal_lahir'		=>	$value['tanggal_lahir'],
							'nama_ibu'			=>	$value['nama_ibu'],
						];
					}
					$this->save_data_batch('anak_pegawai', $data_anak);
				}

				if (!empty($_POST['pdd'])) {
					foreach ($_POST['pdd'] as $key => $value) {
						$data_pdd[] = [
							'idguru_fk'			=>	$dataguru['id_guru'],
							'jenis' 			=>	$value['jenis'],
							'berijazah'			=>	$value['berijazah'],
							'tahun'				=>	$value['tahun'],
						];
					}
					$this->save_data_batch('pendidikan_pegawai', $data_pdd);
				}

				if (!empty($_POST['kursus'])) {
					foreach ($_POST['kursus'] as $key => $value) {
						$data_kursus[] = [
							'idguru_fk'			=>	$dataguru['id_guru'],
							'jenis' 			=>	$value['jenis'],
							'tahun'				=>	$value['tahun'],
							'bulan'				=>	$value['bulan'],
							'hari'				=>	$value['hari'],
							'tingkat'			=>	$value['tingkat'],
							'keterangan'		=>	$value['keterangan'],
						];
					}
					$this->save_data_batch('kursus_pegawai', $data_kursus);
				}
				if (!empty($_POST['riwpns'])) {
					foreach ($_POST['riwpns'] as $key => $value) {
						$data_riwpns[] = [
							'idguru_fk'			=>	$dataguru['id_guru'],
							'pangkat' 			=>	$value['pangkat'],
							'jabatan'			=>	$value['jabatan'],
							'gaji'				=>	$value['gaji'],
							'terhitung_mulai'	=>	$value['terhitung_mulai'],
							'keterangan'		=>	$value['keterangan'],
						];
					}
					$this->save_data_batch('riwayat_kerja_pns_pegawai', $data_riwpns);
				}

				if (!empty($_POST['riwswasta'])) {
					foreach ($_POST['riwswasta'] as $key => $value) {
						$data_riwswasta[] = [
							'idguru_fk'			=>	$dataguru['id_guru'],
							'jenis' 			=>	$value['jenis'],
							'tahun'				=>	$value['tahun'],
							'keterangan'		=>	$value['keterangan'],
						];
					}
					$this->save_data_batch('riwayat_kerja_swasta_pegawai', $data_riwswasta);
				}

				if (!empty($_POST['mapel'])) {
					foreach ($_POST['mapel'] as $key => $value) {
						$data_mapel[] = [
							'idguru_fk'			=>	$dataguru['id_guru'],
							'mapel' 			=>	$value['mapel'],
							'sekolah'			=>	$value['sekolah'],
							'kelas'				=>	$value['kelas'],
							'tahun'				=>	$value['tahun'],
						];
					}
					$this->save_data_batch('mapel_ajar_pegawai', $data_mapel);
				}

				if (!empty($_POST['organisasi'])) {
					foreach ($_POST['organisasi'] as $key => $value) {
						$data_organisasi[] = [
							'idguru_fk'			=>	$dataguru['id_guru'],
							'organisasi' 		=>	$value['organisasi'],
							'jabatan'			=>	$value['jabatan'],
							'tahun'				=>	$value['tahun'],
						];
					}
					$this->save_data_batch('organisasi_pegawai', $data_organisasi);
				}

				if (!empty($_POST['hobi'])) {
					foreach ($_POST['hobi'] as $key => $value) {
						$data_hobi[] = [
							'idguru_fk'			=>	$dataguru['id_guru'],
							'jenis' 			=>	$value['jenis'],
							'aktif'				=>	$value['aktif'],
							'kapan'				=>	$value['kapan'],
						];
					}
					$this->save_data_batch('hobi_pegawai', $data_hobi);
				}
				if (isset($_FILES['dokumen'])) {
					for($i = 0; $i < count($_FILES['dokumen']['name']); $i++)
					{
						$_FILES['file']['name']       = $_FILES['dokumen']['name'][$i]['file_doc'];
			            $_FILES['file']['type']       = $_FILES['dokumen']['type'][$i]['file_doc'];
			            $_FILES['file']['tmp_name']   = $_FILES['dokumen']['tmp_name'][$i]['file_doc'];
			            $_FILES['file']['error']      = $_FILES['dokumen']['error'][$i]['file_doc'];
			            $_FILES['file']['size']       = $_FILES['dokumen']['size'][$i]['file_doc'];
			            // $image[] = $_FILES['file'];																														
			            // File upload configuration
			            
			            $config['upload_path'] = './include/media/dokumen_pegawai/';
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
			            $dokumen_pegawai[] = [
							'idguru_fk'		=>	$dataguru['id_guru'],
							'keterangan'	=> 'foto_siswa',
							'file'			=> $_FILES['file']['name']
			            ];
					}
		           $this->save_data_batch('dokumen_pegawai', $dokumen_pegawai);
				}
			}
		}
		echo json_encode($_POST);
	}


	/*
		EDIT DATA
	*/

	function update_data()
	{
		$foto = '';
		if(file_exists($_FILES['foto']['tmp_name']) || is_uploaded_file($_FILES['foto']['tmp_name'])) {
			$foto = $this->save_media([
				'path'	=>	"./include/media/foto_pegawai/",
				'filename' => 'foto',
			]);
		}
		


		$data = [
			'kode_pegawai'			=>	$_POST['kode_pegawai'],
			'nama'					=>	$_POST['nama'],
			'nip'					=>	$_POST['nip'],
			'alamat'				=>	$_POST['alamat'],
			'email'					=>	$_POST['email'],
			'no_hp'					=>	$_POST['no_hp'],
			'jenis_kelamin'			=>	$_POST['jenis_kelamin'],
			'tempat_lahir'			=>	$_POST['tempat_lahir'],
			'tanggal_lahir'			=>	$_POST['tanggal_lahir'],
			'agama'					=>	$_POST['agama'],
			'kewarganegaraan'		=>	$_POST['kewarganegaraan'],
			'status_pernikahan'		=>	$_POST['status_pernikahan'],
			'status_rumah'			=>	$_POST['status_rumah'],
			'jarak_ke_kantor'		=>	$_POST['jarak_ke_kantor'],
			'bb'					=>	$_POST['bb'],
			'tb'					=>	$_POST['tb'],
			'gd'					=>	$_POST['gd'],
			'penyakit'				=>	$_POST['penyakit'],
			'kelainan'				=>	$_POST['kelainan'],
			'no_karpeg'				=>	$_POST['no_karpeg'],
			'mulai_bertugas'		=>	$_POST['mulai_bertugas'],
			'berasal_dari'			=>	$_POST['berasal_dari'],
			'tanggal_meninggalkan'	=>	$_POST['tanggal_meninggalkan'],
			'alasan_meninggalkan'	=>	$_POST['alasan_meninggalkan'],
			'istri'					=>	$_POST['istri'],
			'status_kepegawaian'	=>	$_POST['status_kepegawaian'],
			'no_taspen'				=>	$_POST['no_taspen']
		];
		if(file_exists($_FILES['foto']['tmp_name']) || is_uploaded_file($_FILES['foto']['tmp_name'])) {
			$data['foto'] = ((isset($foto)) ? $foto['file_name'] : '');
		}

		if ($this->my_update('guru', $data, ['id_guru'=>$_POST['id_guru']])) {
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
				$data['kepegawaian'] 	= $this->db->query('SELECT * FROM `kepegawaian` where date(tanggal_surat) = DATE(NOW())')->result_array();
				$this->load->view('role/admin/page/kepegawaian/print/print_surat',$data);
		}
		function cetak_page()
		{
			$dt = $this->arr;
				$data['param'] 		= 	$this->arr;
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
			$this->my_view(['role/admin/page/kepegawaian/print_page/index','role/admin/page/kepegawaian/print_page/js'],$data);
			
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
            $row[]      =   '<input type="checkbox" name="get-check" value="'.$field['id_guru'].'"></input>';
            $row[]		=	!empty($field['foto']) ? "<img class='img' style='width:80px;height:100px;' src='".base_url('include/media/foto_pegawai/'.$field['foto'])."'></img>" : "<img class='img' style='max-width:100px;' src='".base_url('include/media/default_image/noimage.png')."'></img>"; 
            $row[]		=	'<a href="kepegawaian/detail_page/'.$field['id_guru'].'" class="app-item"><b>'.strtoupper($field['kode_pegawai']).'</b></a>';
            
            $row[]		=	!empty($field['nama']) ? strtoupper($field['nama']) : '-';
            $row[]		=	!empty($field['alamat']) ? strtoupper($field['alamat']) : '-';
            $row[]		=	!empty($field['no_hp']) ? $field['no_hp'] : '-';

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