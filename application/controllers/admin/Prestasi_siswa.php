<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class prestasi_siswa extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman prestasi_siswa',
			'table'				=>	'prestasi_siswa',
			'column'			=>	['idsiswa_fk','prestasi','lomba','tahun','jenis_perlombaan'],
			'column_order'		=>	[ 'id_prestasi_siswa','idsiswa_fk','prestasi','lomba','tahun','jenis_perlombaan'],
			'column_search'		=>	[ 'id_prestasi_siswa','idsiswa_fk','prestasi','lomba','tahun','jenis_perlombaan'],
			'order'				=>	['id_prestasi_siswa'	=>	'DESC'],
			'id'				=>	'id_prestasi_siswa'
	];








	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/admin/page/prestasi_siswa/index_page/index','role/admin/page/prestasi_siswa/index_page/js'],$data);
	}

	public function add_page()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/admin/page/prestasi_siswa/add_page/index','role/admin/page/prestasi_siswa/add_page/js'],$data);
	}

	public function edit_page($id)
	{
		if (isset($id)) {
				$data['param'] 		= 	$this->arr;
				$data['prestasi_siswa'] = 	$this->my_where('prestasi_siswa',['id_prestasi_siswa'=>$id])->row_array();
				$this->my_view(['role/admin/page/prestasi_siswa/edit_page/index','role/admin/page/prestasi_siswa/edit_page/js'],$data);
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
			'idsiswa_fk'					=> $_POST['idsiswa_fk'],
			'prestasi'						=> $_POST['prestasi'],
			'lomba'							=> $_POST['lomba'],
			'tahun'							=> $_POST['tahun'],
			'jenis_perlombaan'				=> $_POST['jenis_perlombaan'],
		];

		if ($this->save_data('prestasi_siswa', $data)) {
			echo "Success";
		}
	}

	/*
		EDIT DATA
	*/

	function update_data()
	{
		$data = [
			
			'idsiswa_fk'					=> $_POST['idsiswa_fk'],
			'prestasi'						=> $_POST['prestasi'],
			'lomba'							=> $_POST['lomba'],
			'tahun'							=> $_POST['tahun'],
			'jenis_perlombaan'				=> $_POST['jenis_perlombaan'],

		];
		if ($this->my_update('prestasi_siswa',$data,['id_prestasi_siswa'=>$_POST['id_prestasi_siswa']])) {
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
				$data['prestasi_siswa'] 	= $this->db->query('SELECT * FROM `prestasi_siswa` where date(tanggal_surat) = DATE(NOW())')->result_array();
				$this->load->view('role/admin/page/prestasi_siswa/print/print_surat',$data);
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
			$this->my_view(['role/admin/page/prestasi_siswa/print_page/index','role/admin/page/prestasi_siswa/print_page/js'],$data);
			
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
            $siswa = $this->my_where('siswa', ['id_siswa'=>$field['idsiswa_fk']])->row_array();
            $row        =   array();
            $row[]      =   '<input type="checkbox" name="get-check" value="'.$field['id_prestasi_siswa'].'"></input>';
            
            $row[]		=	!empty($siswa['nama']) ? strtoupper($siswa['nama']) : '-';
            $row[]		=	!empty($field['prestasi']) ? $field['prestasi'] : '-';
            $row[]		=	!empty($field['lomba']) ? $field['lomba'] : '-';
            $row[]		=	!empty($field['tahun']) ? $field['tahun'] : '-';
            $row[]		=	!empty($field['jenis_perlombaan']) ? $field['jenis_perlombaan'] : '-';

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
	
}