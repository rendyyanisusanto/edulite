<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class alumni extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman alumni',
			'table'				=>	'alumni',
			'column'			=>	['kode_arsip','pengirim','tanggal_surat','perihal','no_surat'],
			'column_order'		=>	[ 'id_alumni','kode_arsip','pengirim','tanggal_surat','perihal','no_surat'],
			'column_search'		=>	[ 'id_alumni','kode_arsip','pengirim','tanggal_surat','perihal','no_surat'],
			'order'				=>	['id_alumni'	=>	'DESC'],
			'id'				=>	'id_alumni'
	];

	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/admin/page/alumni/index_page/index','role/admin/page/alumni/index_page/js'],$data);
	}

	public function add_page()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/admin/page/alumni/add_page/index','role/admin/page/alumni/add_page/js'],$data);
	}

	public function edit_page($id)
	{
		if (isset($id)) {
				$data['param'] 		= 	$this->arr;
				$data['alumni'] = 	$this->my_where('alumni',['id_alumni'=>$id])->row_array();
				$this->my_view(['role/admin/page/alumni/edit_page/index','role/admin/page/alumni/edit_page/js'],$data);
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
			'nama' 				=> $_POST['nama'],
			'tahun_lulus' 		=> $_POST['tahun_lulus'],
			'alamat' 			=> $_POST['alamat'],
			'no_hp' 			=> $_POST['no_hp'],
			'kuliah' 			=> $_POST['kuliah'],
			'longitude'			=> $_POST['lng'],
			'latitude'			=> $_POST['lat'],
			'menikah' 			=> $_POST['menikah'],
			'bekerja' 			=> $_POST['bekerja'],
			'pesantren' 		=> $_POST['pesantren'],
		];

		if ($this->save_data('alumni', $data)) {
			echo "Success";
		}
	}


	/*
		EDIT DATA
	*/

	function update_data()
	{
		$data = [
			'kode_arsip' 	=> $_POST['kode_arsip'],
			'pengirim' 		=> $_POST['pengirim'],
			'tanggal_surat' => $_POST['tanggal_surat'],
			'perihal' 		=> $_POST['perihal'],
			'no_surat' 		=> $_POST['no_surat'],
		];
		if ($this->my_update('alumni',$data,['id_alumni'=>$_POST['id_alumni']])) {
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
				$data['alumni'] 	= $this->db->query('SELECT * FROM `alumni` where date(tanggal_surat) = DATE(NOW())')->result_array();
				$this->load->view('role/admin/page/alumni/print/print_surat',$data);
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
			$this->my_view(['role/admin/page/alumni/print_page/index','role/admin/page/alumni/print_page/js'],$data);
			
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
            $row[]      =   '<input type="checkbox" name="get-check" value="'.$field['id_alumni'].'"></input>';
            $row[]		=	!empty($field['nama']) ? strtoupper($field['nama']) : '-';
            $row[]		=	!empty($field['tahun_lulus']) ? $field['tahun_lulus'] : '-';
            $row[]		=	!empty($field['alamat']) ? $field['alamat'] : '-';
            $row[]		=	!empty($field['no_hp']) ? $field['no_hp'] : '-';
            $row[]		=	'<b>Kuliah </b> : '.(!empty($field['kuliah']) ? $field['kuliah'] : '-').'<br>'.
            '<b>Menikah </b> : '.(!empty($field['menikah']) ? $field['menikah'] : '-').
            '<br>'.'<b>Bekerja </b> : '.(!empty($field['bekerja']) ? $field['bekerja'] : '-').
            '<br>'.'<b>Pesantren </b> : '.(!empty($field['pesantren']) ? $field['pesantren'] : '-').'<br>';

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