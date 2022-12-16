<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class prasarana extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman prasarana',
			'table'				=>	'prasarana',
			'column'			=>	['prasarana','idkelompokprasarana_fk','idkondisiprasarana_fk','no_inventaris','spesifikasi','foto'],
			'column_order'		=>	[ 'id_prasarana','prasarana','idkelompokprasarana_fk','idkondisiprasarana_fk','no_inventaris','spesifikasi','foto'],
			'column_search'		=>	[ 'id_prasarana','prasarana','idkelompokprasarana_fk','idkondisiprasarana_fk','no_inventaris','spesifikasi','foto'],
			'order'				=>	['id_prasarana'	=>	'DESC'],
			'id'				=>	'id_prasarana'
	];

	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/admin/page/prasarana/index_page/index','role/admin/page/prasarana/index_page/js'],$data);
	}

	public function add_page()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['kondisi_prasarana']	=	$this->my_where('kondisi_prasarana', [])->result_array();
		$data['kelompok_prasarana']	=	$this->my_where('kelompok_prasarana', [])->result_array();

		$this->my_view(['role/admin/page/prasarana/add_page/index','role/admin/page/prasarana/add_page/js'],$data);
	}

	public function edit_page($id)
	{
		if (isset($id)) {
				$data['param'] 		= 	$this->arr;
				$data['prasarana'] = 	$this->my_where('prasarana',['id_prasarana'=>$id])->row_array();
				$data['kondisi_prasarana']	=	$this->my_where('kondisi_prasarana', [])->result_array();
				$data['kelompok_prasarana']	=	$this->my_where('kelompok_prasarana', [])->result_array();
				$this->my_view(['role/admin/page/prasarana/edit_page/index','role/admin/page/prasarana/edit_page/js'],$data);
		} else {
			$this->get_data();
		}
	}

	/*
		ADD DATA
	*/


	public function simpan_data()
	{	
		$file_arsip = $this->save_media([
			'path'	=>	"./include/media/prasarana/",
			'filename' => 'foto',
		]);
		$data = [
			'prasarana' 					=> $_POST['prasarana'],
			'idkelompokprasarana_fk' 		=> $_POST['idkelompokprasarana_fk'],
			'idkondisiprasarana_fk' 		=> $_POST['idkondisiprasarana_fk'],
			'spesifikasi' 				=> $_POST['spesifikasi'],
			'no_inventaris' 			=> $_POST['no_inventaris'],
			'foto'						=>	((isset($file_arsip)) ? $file_arsip['file_name'] : ''),
		];

		if ($this->save_data('prasarana', $data)) {
			echo "Success";
		}
	}









	/*
		EDIT DATA
	*/

	function update_data()
	{
		$file_arsip = $this->save_media([
			'path'	=>	"./include/media/prasarana/",
			'filename' => 'file_arsip',
		]);
		$data = [
			'prasarana' 					=> $_POST['prasarana'],
			'idkelompokprasarana_fk' 		=> $_POST['idkelompokprasarana_fk'],
			'idkondisiprasarana_fk' 		=> $_POST['idkondisiprasarana_fk'],
			'spesifikasi' 					=> $_POST['spesifikasi'],
			'no_inventaris' 				=> $_POST['no_inventaris'],
			'foto'	=>	((isset($file_arsip)) ? $file_arsip['file_name'] : $_POST['file_arsip_before']),
		];
		if ($this->my_update('prasarana',$data,['id_prasarana'=>$_POST['id_prasarana']])) {
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
				$data['prasarana'] 	= $this->db->query('SELECT * FROM `prasarana` where date(tanggal_surat) = DATE(NOW())')->result_array();
				$this->load->view('role/admin/page/prasarana/print/index',$data);
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
			$this->my_view(['role/admin/page/prasarana/print_page/index','role/admin/page/prasarana/print_page/js'],$data);
			
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
            $kondisi_prasarana = $this->my_where('kondisi_prasarana', ['id_kondisi_prasarana'=>$field['idkondisiprasarana_fk']])->row_array();
            $kelompok_prasarana = $this->my_where('kelompok_prasarana', ['id_kelompok_prasarana'=>$field['idkelompokprasarana_fk']])->row_array();
            $row[]      =   '<input type="checkbox" name="get-check" value="'.$field['id_prasarana'].'"></input>';
            $row[]		=	'<a href="prasarana/edit_page/'.$field['id_prasarana'].'" class="app-item"><b>'.strtoupper($field['no_inventaris']).'</b></a>';
            $row[]		=	!empty($field['prasarana']) ? strtoupper($field['prasarana']) : '-';
            $row[]		=	$kelompok_prasarana['kelompok_prasarana'];
            $row[]		=	'<b style="color:'.$kondisi_prasarana['warna'].'">'.$kondisi_prasarana['kondisi_prasarana'].'</b>';
            $row[]		=	!empty($field['foto']) ? '<a href="'.base_url('include/media/prasarana/'.$field['foto']).'" target="__blank">Download Foto</a>' : '-';

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