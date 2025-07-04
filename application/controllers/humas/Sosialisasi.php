<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class sosialisasi extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman sosialisasi',
			'table'				=>	'sosialisasi',
			'column'			=>	[ 'tanggal','judul','keterangan', 'berkas'],
			'column_order'		=>	[ 'id_sosialisasi','tanggal','judul','keterangan', 'berkas'],
			'column_search'		=>	[ 'id_sosialisasi','tanggal','judul','keterangan', 'berkas'],
			'order'				=>	['id_sosialisasi'	=>	'DESC'],
			'id'				=>	'id_sosialisasi'
	];

	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran',['is_active'=>1])->row_array();

		$this->my_view(['role/humas/page/sosialisasi/index_page/index','role/humas/page/sosialisasi/index_page/js'],$data);
	}

	public function add_page()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran',['is_active'=>1])->row_array();

		$this->my_view(['role/humas/page/sosialisasi/add_page/index','role/humas/page/sosialisasi/add_page/js'],$data);
	}

	public function edit_page($id)
	{
		if (isset($id)) {
				$data['param'] 		= 	$this->arr;
				$data['sosialisasi'] = 	$this->my_where('sosialisasi',['id_sosialisasi'=>$id])->row_array();
				$this->my_view(['role/humas/page/sosialisasi/edit_page/index','role/humas/page/sosialisasi/edit_page/js'],$data);
		} else {
			// $this->get_data();
		}
	}

	/*
		ADD DATA
	*/


	public function simpan_data()
	{	
		$file_arsip = $this->save_media([
			'path'	=>	"./include/media/berkas_sosialisasi/",
			'filename' => 'file_arsip',
		]);
		$data = [
			'judul' 		=> $_POST['judul'],
			'keterangan' 	=> $_POST['keterangan'],
			'tanggal' 		=> $_POST['tanggal'],
			'berkas'		=>	((isset($file_arsip)) ? $file_arsip['file_name'] : ''),
		];

		if ($this->save_data('sosialisasi', $data)) {
			echo "Success";
		}
	}


	/*
		EDIT DATA
	*/

	function update_data()
	{
		$file_arsip = $this->save_media([
			'path'	=>	"./include/media/berkas_sosialisasi/",
			'filename' => 'file_arsip',
		]);
		$data = [
			'judul' 		=> $_POST['judul'],
			'keterangan' 	=> $_POST['keterangan'],
			'tanggal' 		=> $_POST['tanggal'],
			'berkas'	=>	((isset($file_arsip)) ? $file_arsip['file_name'] : $_POST['file_arsip_before']),
		];
		if ($this->my_update('sosialisasi',$data,['id_sosialisasi'=>$_POST['id_sosialisasi']])) {
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
			// $this->my_view(['role/humas/page/guru/print_page/index','role/humas/page/guru/print_page/js'],$data);
			
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
            $row[]      =   '<input type="checkbox" name="get-check" value="'.$field['id_sosialisasi'].'"></input>';
            $row[]		=	!empty($field['tanggal']) ? date_format(date_create($field['tanggal']), 'd-M-y') : '-';
            $row[]		=	'<b>'.$field['judul'].'</b>';
            $row[]		=	$field['keterangan'];
            $row[]      =   '<a target="__blank" href="'.base_url('include/media/berkas_sosialisasi/'.$field['berkas']).'">Unduh Berkas</a>';
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