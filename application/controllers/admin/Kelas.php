<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class kelas extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman Kelas',
			'table'				=>	'kelas',
			'column'			=>	[ 'kelas','idtingkat_fk','idjurusan_fk','idtahunajaran_fk','iddepartment_fk'],
			'column_order'		=>	[ 'id_kelas','kelas','idtingkat_fk','idjurusan_fk','idtahunajaran_fk','iddepartment_fk'],
			'column_search'		=>	[ 'id_kelas','kelas','idtingkat_fk','idjurusan_fk','idtahunajaran_fk','iddepartment_fk'],
			'order'				=>	['id_kelas'	=>	'DESC'],
			'id'				=>	'id_kelas'
	];

	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		/*if you need custom page*/

		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/admin/page/kelas/index_page/index','role/admin/page/kelas/index_page/js'],$data);

	}

	public function add_page()
	{
		$data['department']	=	$this->my_where('department', [])->result_array();
		$data['tahun_ajaran']	=	$this->my_where('tahun_ajaran', [])->result_array();
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/admin/page/kelas/add_page/index','role/admin/page/kelas/add_page/js'],$data);
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
		
		$data = [
			'kelas' => 	$_POST['kelas'],
			'idtingkat_fk' => $_POST['idtingkat_fk'],
			'idjurusan_fk'=> $_POST['idjurusan_fk'],
			'idtahunajaran_fk'=> $_POST['idtahunajaran_fk'],
			'iddepartment_fk'=> $_POST['iddepartment_fk']

		];
		if ($this->save_data('kelas', $data)) {
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
		$data = [
			'kelas' => 	$_POST['kelas'],
			'idtingkat_fk' => $_POST['idtingkat_fk'],
			'idjurusan_fk'=> $_POST['idjurusan_fk'],
			'idtahunajaran_fk'=> $_POST['idtahunajaran_fk'],
			'iddepartment_fk'=> $_POST['iddepartment_fk']

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
            $department 	=	$this->my_where('department', ['id_department'=>$field['iddepartment_fk']])->row_array();
            $tingkat 	=	$this->my_where('tingkat', ['id_tingkat'=>$field['idtingkat_fk']])->row_array();
            $jurusan 	=	$this->my_where('jurusan', ['id_jurusan'=>$field['idjurusan_fk']])->row_array();
            $tahun_ajaran 	 	=	$this->my_where('tahun_ajaran', ['id_tahun_ajaran'=>$field['idtahunajaran_fk']])->row_array();
            $jmlsiswa	=	$this->my_where('siswa', ['idkelas_fk'=>$field['id_kelas']])->num_rows();	
            $row[]      =   '<input type="checkbox" name="get-check" value="'.$field['id_kelas'].'"></input>';
            $row[]		=	$tingkat['tingkat'];
            $row[]		=	$jurusan['jurusan'];
            $row[]		=	$field['kelas'];
            $row[]		=	$department['department'];
            $row[]		=	'<b class="text-'.(($jmlsiswa > 0) ? "success" : "danger").'">'.$jmlsiswa.'</b>';
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

	function get_jur(){
		$id = $_POST['id'];

		if ($id) {
			$data['tingkat']	=	$this->my_where('tingkat', ['iddepartment_fk'=>$id])->result_array();
			$data['jurusan']	=	$this->my_where('jurusan', ['iddepartment_fk'=>$id])->result_array();

			$this->my_view(['role/admin/page/kelas/add_page/get_jur'], $data);
		}
	}
	
	
}