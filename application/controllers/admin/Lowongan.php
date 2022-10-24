<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class lowongan extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman lowongan',
			'table'				=>	'lowongan',
			'column'			=>	[ 'tanggal','judul','keterangan','rentang_gaji','iddudi_fk', 'berkas', 'deadline'],
			'column_order'		=>	[ 'id_lowongan','tanggal','judul','keterangan','rentang_gaji','iddudi_fk', 'berkas', 'deadline'],
			'column_search'		=>	[ 'id_lowongan','tanggal','judul','keterangan','rentang_gaji','iddudi_fk', 'berkas', 'deadline'],
			'order'				=>	['id_lowongan'	=>	'DESC'],
			'id'				=>	'id_lowongan'
	];

	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran',['is_active'=>1])->row_array();

		$this->my_view(['role/admin/page/lowongan/index_page/index','role/admin/page/lowongan/index_page/js'],$data);
	}

	public function add_page()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['dudi']		=	$this->my_where('dudi',[])->result_array();

		$this->my_view(['role/admin/page/lowongan/add_page/index','role/admin/page/lowongan/add_page/js'],$data);
	}

	public function edit_page($id)
	{
		if (isset($id)) {
				$data['param'] 		= 	$this->arr;
				$data['lowongan'] = 	$this->my_where('lowongan',['id_lowongan'=>$id])->row_array();
				$data['dudi']		=	$this->my_where('dudi',[])->result_array();
				$this->my_view(['role/admin/page/lowongan/edit_page/index','role/admin/page/lowongan/edit_page/js'],$data);
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
			'path'	=>	"./include/media/berkas_lowongan/",
			'filename' => 'file_arsip',
		]);
		$data = [
			'judul' 		=> $_POST['judul'],
			'iddudi_fk' 	=> $_POST['iddudi_fk'],
			'rentang_gaji' 	=> $_POST['rentang_gaji'],
			'keterangan' 	=> $_POST['keterangan'],
			'deadline' 		=> $_POST['deadline'],
			'berkas'		=>	((isset($file_arsip)) ? $file_arsip['file_name'] : ''),
		];

		if ($this->save_data('lowongan', $data)) {
			echo "Success";
		}
	}


	/*
		EDIT DATA
	*/

	function update_data()
	{
		$file_arsip = $this->save_media([
			'path'	=>	"./include/media/berkas_lowongan/",
			'filename' => 'file_arsip',
		]);
		$data = [
			'judul' 		=> $_POST['judul'],
			'iddudi_fk' 	=> $_POST['iddudi_fk'],
			'rentang_gaji' 	=> $_POST['rentang_gaji'],
			'keterangan' 	=> $_POST['keterangan'],
			'deadline' 		=> $_POST['deadline'],
			'berkas'	=>	((isset($file_arsip)) ? $file_arsip['file_name'] : $_POST['file_arsip_before']),
		];
		if ($this->my_update('lowongan',$data,['id_lowongan'=>$_POST['id_lowongan']])) {
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
			$dudi		=	$this->my_where('dudi', ['id_dudi'=>$field['iddudi_fk']])->row_array();
            $row        =   array();
            $row[]      =   '<input type="checkbox" name="get-check" value="'.$field['id_lowongan'].'"></input>';
            $row[]		=	!empty($field['deadline']) ? date_format(date_create($field['deadline']), 'd-M-y') : '-';
            $row[]		=	'<b>'.$field['judul'].'</b>';
            $row[]		=	$dudi['nama'];
            $row[]		=	$field['rentang_gaji'];
            $row[]		=	$field['keterangan'];
            $row[]      =   '<a target="__blank" href="'.base_url('include/media/berkas_lowongan/'.$field['berkas']).'">Unduh Berkas</a>';
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