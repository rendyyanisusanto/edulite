<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class kondisi_prasarana extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman kondisi_prasarana',
			'table'				=>	'kondisi_prasarana',
			'column'			=>	['kondisi_prasarana'],
			'column_order'		=>	[ 'id_kondisi_prasarana','kondisi_prasarana','warna'],
			'column_search'		=>	[ 'id_kondisi_prasarana','kondisi_prasarana','warna'],
			'order'				=>	['id_kondisi_prasarana'	=>	'DESC'],
			'id'				=>	'id_kondisi_prasarana'
	];

	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/sarpras/page/kondisi_prasarana/index_page/index','role/sarpras/page/kondisi_prasarana/index_page/js'],$data);
	}

	public function add_page()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/sarpras/page/kondisi_prasarana/add_page/index','role/sarpras/page/kondisi_prasarana/add_page/js'],$data);
	}

	public function edit_page($id)
	{
		if (isset($id)) {
				$data['param'] 		= 	$this->arr;
				$data['kondisi_prasarana'] = 	$this->my_where('kondisi_prasarana',['id_kondisi_prasarana'=>$id])->row_array();
				$this->my_view(['role/sarpras/page/kondisi_prasarana/edit_page/index','role/sarpras/page/kondisi_prasarana/edit_page/js'],$data);
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
			'kondisi_prasarana' 	=> $_POST['kondisi_prasarana'],
			'warna' 			=> $_POST['warna'],
		];

		if ($this->save_data('kondisi_prasarana', $data)) {
			echo "Success";
		}
	}


	/*
		EDIT DATA
	*/

	function update_data()
	{
		$data = [
			'kondisi_prasarana' 	=> $_POST['kondisi_prasarana'],
			'warna' 			=> $_POST['warna'],
		];
		if ($this->my_update('kondisi_prasarana',$data,['id_kondisi_prasarana'=>$_POST['id_kondisi_prasarana']])) {
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
				$data['kondisi_prasarana'] 	= $this->db->query('SELECT * FROM `kondisi_prasarana` where date(tanggal_surat) = DATE(NOW())')->result_array();
				$this->load->view('role/sarpras/page/kondisi_prasarana/print/index',$data);
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
			$this->my_view(['role/sarpras/page/kondisi_prasarana/print_page/index','role/sarpras/page/kondisi_prasarana/print_page/js'],$data);
			
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
            $jmlprasarana = $this->my_where('prasarana', ['idkondisiprasarana_fk'=>$field['id_kondisi_prasarana']])->num_rows();
            $row[]      =   '<input type="checkbox" name="get-check" value="'.$field['id_kondisi_prasarana'].'"></input>';
            $row[]		=	'<a style="color:'.$field['warna'].'" href="kondisi_prasarana/edit_page/'.$field['id_kondisi_prasarana'].'" class="app-item"><b>'.strtoupper($field['kondisi_prasarana']).'</b></a>';
            $row[]		=	'<b>'.$jmlprasarana.'</b>';

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