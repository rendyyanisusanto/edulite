<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class pelanggaran_siswa extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman pelanggaran_siswa',
			'table'				=>	'pelanggaran_siswa',
			'column'			=>	['kode_arsip','tujuan','tanggal_surat','perihal','no_surat'],
			'column_order'		=>	[ 'id_pelanggaran_siswa','kode_arsip','tujuan','tanggal_surat','perihal','no_surat'],
			'column_search'		=>	[ 'id_pelanggaran_siswa','kode_arsip','tujuan','tanggal_surat','perihal','no_surat'],
			'order'				=>	['id_pelanggaran_siswa'	=>	'DESC'],
			'id'				=>	'id_pelanggaran_siswa'
	];

	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/BK/page/pelanggaran_siswa/index_page/index','role/BK/page/pelanggaran_siswa/index_page/js'],$data);
	}

	public function proses_catatan($id='')
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['pelanggaran_siswa'] = 	$this->my_where('catatan_siswa',['id_catatan_siswa'=>$id])->row_array();
		$data['siswa']				=	$this->my_where('siswa', ['id_siswa'=>$data['pelanggaran_siswa']['idsiswa_fk']])->row_array();
		$this->my_view(['role/BK/page/pelanggaran_siswa/proses_catatan/index','role/BK/page/pelanggaran_siswa/proses_catatan/js'],$data);
	}

	public function poin_pelanggaran_setup()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['jenis_pelanggaran']	=	$this->my_where('jenis_pelanggaran',[])->result_array();
		$this->my_view(['role/BK/page/pelanggaran_siswa/index_page/poin_pelanggaran_setup','role/BK/page/pelanggaran_siswa/index_page/js_poin_pelanggaran_setup'],$data);
	}
	
	public function catatan_siswa()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/BK/page/pelanggaran_siswa/index_page/catatan_siswa','role/BK/page/pelanggaran_siswa/index_page/js_catatan_siswa'],$data);
	}

	public function add_page()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/BK/page/pelanggaran_siswa/add_page/index','role/BK/page/pelanggaran_siswa/add_page/js'],$data);
	}
	
	public function cetak_kartu()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/BK/page/pelanggaran_siswa/print_page/cetak_kartu','role/BK/page/pelanggaran_siswa/print_page/js_kartu'],$data);
	}


	public function edit_page($id)
	{
		if (isset($id)) {
				$data['param'] 		= 	$this->arr;
				$data['poinpelanggaran']	=	$this->my_where('poin_pelanggaran',[])->result_array();
				$data['pelanggaran_siswa'] = 	$this->my_where('pelanggaran_siswa',['id_pelanggaran_siswa'=>$id])->row_array();
				$data['siswa']				=	$this->my_where('siswa', ['id_siswa'=>$data['pelanggaran_siswa']['idsiswa_fk']])->row_array();
				$this->my_view(['role/BK/page/pelanggaran_siswa/edit_page/index','role/BK/page/pelanggaran_siswa/edit_page/js'],$data);
		} else {
			$this->get_data();
		}
	}

	/*
		ADD DATA
	*/


	public function simpan_data()
	{	
		$data = [
			'idsiswa_fk' 				=> $_POST['idsiswa_fk'],
			'uraian_pelanggaran' 		=> $_POST['uraian_pelanggaran'],
			'idpoinpelanggaran_fk' 		=> $_POST['idpoinpelanggaran_fk'],
			'tanggal' 					=> $_POST['tanggal'],
		];

		if ($this->save_data('pelanggaran_siswa', $data)) {
			echo "Success";
		}
	}
	public function simpan_data_pelanggaran()
	{
		$data = [
			'idsiswa_fk' 				=> $_POST['idsiswa_fk'],
			'uraian_pelanggaran' 		=> $_POST['uraian_pelanggaran'],
			'idpoinpelanggaran_fk' 		=> $_POST['idpoinpelanggaran_fk'],
			'tanggal' 					=> $_POST['tanggal'],
		];

		if ($this->save_data('pelanggaran_siswa', $data)) {
			$this->my_update('catatan_siswa', ['is_tindakan'=>1], ['id_catatan_siswa'=>$_POST['id']]);
		}
	}

	public function simpan_poin()
	{	
		$data = [
			'idjenispelanggaran_fk' 				=> $_POST['idjenispelanggaran_fk'],
			'nama_pelanggaran' 						=> $_POST['nama_pelanggaran'],
			'poin' 									=> $_POST['poin'],
			'kode_pelanggaran' 						=> $_POST['kode_pelanggaran'],
		];

		if ($this->save_data('poin_pelanggaran', $data)) {
			echo "Success";
		}
	}

	public function update_poin()
	{	
		$data = [
			'idjenispelanggaran_fk' 				=> $_POST['idjenispelanggaran_fk'],
			'nama_pelanggaran' 						=> $_POST['nama_pelanggaran'],
			'poin' 									=> $_POST['poin'],
			'kode_pelanggaran' 						=> $_POST['kode_pelanggaran'],
		];

		if ($this->my_update('poin_pelanggaran', $data, ['id_poin_pelanggaran'=>$_POST['id']])) {
			echo "Success";
		}
	}


	/*
		EDIT DATA
	*/

	function update_data()
	{
		$data = [
			'uraian_pelanggaran' 		=> $_POST['uraian_pelanggaran'],
			'idpoinpelanggaran_fk' 		=> $_POST['idpoinpelanggaran_fk'],
			'tanggal' 					=> $_POST['tanggal'],
		];
		if ($this->my_update('pelanggaran_siswa',$data,['id_pelanggaran_siswa'=>$_POST['id_pelanggaran_siswa']])) {
			// print_r(((isset($foto)) ? $foto['file_name'] : $_POST['foto_before']));
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
				$data['pelanggaran_siswa'] 	= $this->db->query('SELECT * FROM `pelanggaran_siswa` where date(tanggal_surat) = DATE(NOW())')->result_array();
				$this->load->view('role/BK/page/pelanggaran_siswa/print/index',$data);
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
			$this->my_view(['role/BK/page/pelanggaran_siswa/print_page/index','role/BK/page/pelanggaran_siswa/print_page/js'],$data);
			
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
        	$siswa 		=	$this->my_where('v_siswa_jurusan', ['id_siswa'=>$field['idsiswa_fk']])->row_array();
        	$poin 		=	$this->my_where('poin_pelanggaran', ['id_poin_pelanggaran'=>$field['idpoinpelanggaran_fk']])->row_array();
            $no++;
            $row        =   array();
            $row[]      =   '<input type="checkbox" name="get-check" value="'.$field['id_pelanggaran_siswa'].'"></input>';
            $row[]		=	!empty($field['tanggal']) ? date_format(date_create($field['tanggal']),'d-m-Y') : '-';
            $row[]		=	'<b>'.(!empty($siswa['nama']) ? strtoupper($siswa['nama']) : '-').'</b><br>'.
            				'('.(!empty($siswa['kelas']) ? strtoupper($siswa['kelas']) : '-').')<br>';
            $row[]		=	!empty($field['uraian_pelanggaran']) ? $field['uraian_pelanggaran'] : '-';
            $row[]		=	!empty($poin['poin']) ? $poin['poin'] : '-';
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

	public function datatable_poin()
	{
		$arr = [
			'table'				=>	'v_poin_pelanggaran',
			'column'			=>	['nama_pelanggaran','poin','kode_pelanggaran','jenis_pelanggaran'],
			'column_order'		=>	[ 'id_poin_pelanggaran','nama_pelanggaran','poin','kode_pelanggaran','jenis_pelanggaran'],
			'column_search'		=>	[ 'id_poin_pelanggaran','nama_pelanggaran','poin','kode_pelanggaran','jenis_pelanggaran'],
			'order'				=>	['id_poin_pelanggaran'	=>	'DESC'],
			'id'				=>	'id_poin_pelanggaran'
		];
        $_POST['frm']   =   $arr;
        $list           =   $this->mod_datatable->get_datatables();
        $data           =   array();
        $no             =   $_POST['start'];
        foreach ($list as $field) {
            $no++;
            $row        =   array();
            $row[]		=	'';
            $row[]		=	!empty($field['kode_pelanggaran']) ? $field['kode_pelanggaran'] : '-';
            $row[]		=	!empty($field['nama_pelanggaran']) ? $field['nama_pelanggaran'] : '-';
            $row[]		=	!empty($field['jenis_pelanggaran']) ? $field['jenis_pelanggaran'] : '-';
            $row[]		=	!empty($field['poin']) ? $field['poin'] : '-';
            $row[]		=	'<button type="button" data-id="'.$field['id_poin_pelanggaran'].'" 
            			data-kode_pelanggaran="'.$field['kode_pelanggaran'].'"
            			data-nama_pelanggaran="'.$field['nama_pelanggaran'].'"
            			data-idjenispelanggaran_fk="'.$field['idjenispelanggaran_fk'].'"
            			data-poin="'.$field['poin'].'"
            class="btn btn-xs btn-edit btn-success"><i class="icon-pencil3"></i></button>';
            $row[]		=	'<button type="button" class="btn btn-xs btn-hps btn-danger"><i class="icon-trash"></i></button>';
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
	public function datatable_catatan()
	{
		$arr = [
			'table'				=>	'v_catatan_siswa_harian',
			'column'			=>	['tanggal','nama','kelas','uraian', 'nama_guru'],
			'column_order'		=>	[ 'id_catatan_siswa','tanggal','nama','kelas','uraian', 'nama_guru'],
			'column_search'		=>	[ 'id_catatan_siswa','tanggal','nama','kelas','uraian', 'nama_guru'],
			'order'				=>	['id_catatan_siswa'	=>	'DESC'],
			'id'				=>	'id_catatan_siswa'
		];
		$_POST['frm']   =   $arr;
		$this->db->where('teruskan_ke', 'BK');
        $list           =   $this->mod_datatable->get_datatables();
        $data           =   array();
        $no             =   $_POST['start'];
        foreach ($list as $field) {
        	$kelas		=	$this->my_where('kelas', ['id_kelas'=>$field['idkelas_fk']])->row_array();
        	$guru		=	$this->my_where('guru', ['id_guru'=>$field['idguru_fk']])->row_array();
            $no++;
            $row        =   array();
            $row[]      =   '<a href="pelanggaran_siswa/proses_catatan/'.$field['id_catatan_siswa'].'" class="app-item">Proses</a>';
            $row[]		=	!empty($field['tanggal']) ? date_format(date_create($field['tanggal']),'d-m-Y') : '-';
            $row[]		=	'<b>'.(!empty($field['nama']) ? strtoupper($field['nama']) : '-').'</b><br>'.
            				'('.(!empty($kelas['kelas']) ? strtoupper($kelas['kelas']) : '-').')<br>';
            $row[]		=	!empty($field['uraian']) ? $field['uraian'] : '-';
            $row[]		=	!empty($guru['nama']) ? $guru['nama'] : '-';
            $row[]		=	(!empty($field['is_tindakan'])) ? "<b class='text-success'>Sudah</b>" : "<b class='text-danger'>Belum</b>" ;
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
	public function get_siswa()
	{
		$searchTerm = $this->input->post('searchTerm');

      // Get users

      	 $this->db->select('*');
	     $this->db->where("nama like '%".$searchTerm."%' ")->limit(5);
	     $fetched_records = $this->db->get('v_siswa_jurusan');
	     $users = $fetched_records->result_array();
 
	     // Initialize Array with fetched data
	     $data = array();
	     foreach($users as $user){
	        $data[] = array("id"=>$user['id_siswa'], "text"=>$user['nama'].'('.$user['kelas'].')');
	     }

      	echo json_encode($data);
	}

	public function get_poinpelanggaran()
	{
		$searchTerm = $this->input->post('searchTerm');

      // Get users

      	 $this->db->select('*');
	     $this->db->where("nama_pelanggaran like '%".$searchTerm."%' ")->limit(5);
	     $fetched_records = $this->db->get('poin_pelanggaran');
	     $users = $fetched_records->result_array();
 
	     // Initialize Array with fetched data
	     $data = array();
	     foreach($users as $user){
	        $data[] = array("id"=>$user['id_poin_pelanggaran'], "text"=>$user['nama_pelanggaran'].'('.$user['poin'].')');
	     }

      	echo json_encode($data);
	}

	public function print_kartu($id='')
	{
		$data['siswa'] = $this->my_where('v_siswa_jurusan', ['id_siswa' => $id])->row_array();
		$jenis_pelanggaran = $this->my_where('jenis_pelanggaran',[])->result_array();
		$data_pelanggaran = [];
		foreach ($jenis_pelanggaran as $key => $value) {
			$pelanggaran_siswa = $this->my_where('v_pelanggaran_siswa', ['idsiswa_fk'=>$id, 'id_jenis_pelanggaran'=>$value['id_jenis_pelanggaran']])->result_array();
			$data_pelanggaran[] = 
			[
				'jenis_pelanggaran' => $value,
				'data_pelanggaran_siswa' => $pelanggaran_siswa
			]; 
		}
		$data['pelanggaran'] = $data_pelanggaran;
		$this->my_view(['role/BK/page/pelanggaran_siswa/print_page/cetak_kartu_kendali'],$data);
	}

	public function get_poin_pelanggaran($value='')
	{

	}
}