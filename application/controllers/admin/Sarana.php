<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class sarana extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman sarana',
			'table'				=>	'sarana',
			'column'			=>	['sarana','jumlah','idkelompoksarana_fk','idkondisisarana_fk','no_inventaris','tahun_pengadaan','tanggal_pengadaan','spesifikasi','foto'],
			'column_order'		=>	[ 'id_sarana','sarana','jumlah','idkelompoksarana_fk','idkondisisarana_fk','no_inventaris','tahun_pengadaan','tanggal_pengadaan','spesifikasi','foto'],
			'column_search'		=>	[ 'id_sarana','sarana','jumlah','idkelompoksarana_fk','idkondisisarana_fk','no_inventaris','tahun_pengadaan','tanggal_pengadaan','spesifikasi','foto'],
			'order'				=>	['id_sarana'	=>	'DESC'],
			'id'				=>	'id_sarana'
	];

	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['kondisi_sarana']	=	$this->my_where('kondisi_sarana', [])->result_array();
		$this->my_view(['role/admin/page/sarana/index_page/index','role/admin/page/sarana/index_page/js'],$data);
	}

	public function add_page()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['prasarana']	=	$this->my_where('prasarana', [])->result_array();
		$data['kondisi_sarana']	=	$this->my_where('kondisi_sarana', [])->result_array();
		$data['kelompok_sarana']	=	$this->my_where('kelompok_sarana', [])->result_array();

		$this->my_view(['role/admin/page/sarana/add_page/index','role/admin/page/sarana/add_page/js'],$data);
	}

	public function edit_page($id)
	{
		if (isset($id)) {
				$data['param'] 		= 	$this->arr;
				$data['sarana'] 	= 	$this->my_where('sarana',['id_sarana'=>$id])->row_array();
				$data['kondisi_sarana']	=	$this->my_where('kondisi_sarana', [])->result_array();
				$data['prasarana']	=	$this->my_where('prasarana', [])->result_array();
				$data['kelompok_sarana']	=	$this->my_where('kelompok_sarana', [])->result_array();
				$this->my_view(['role/admin/page/sarana/edit_page/index','role/admin/page/sarana/edit_page/js'],$data);
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
			'path'	=>	"./include/media/sarana/",
			'filename' => 'foto',
		]);
		$data = [
			'sarana' 					=> $_POST['sarana'],
			'jumlah' 					=> $_POST['jumlah'],
			'idkelompoksarana_fk' 		=> $_POST['idkelompoksarana_fk'],
			'idkondisisarana_fk' 		=> $_POST['idkondisisarana_fk'],
			'spesifikasi' 				=> $_POST['spesifikasi'],
			'no_inventaris' 			=> $_POST['no_inventaris'],
			'tahun_pengadaan' 			=> $_POST['tahun_pengadaan'],
			'tanggal_pengadaan' 		=> $_POST['tanggal_pengadaan'],
			'idlokasi_fk' 				=> $_POST['idlokasi_fk'],
			'foto'						=>	((isset($file_arsip)) ? $file_arsip['file_name'] : ''),
		];

		if ($this->save_data('sarana', $data)) {
			echo "Success";
		}
	}

	/*
		EDIT DATA
	*/

	function update_data()
	{
		$file_arsip = $this->save_media([
			'path'	=>	"./include/media/sarana/",
			'filename' => 'file_arsip',
		]);
		$data = [
			'sarana' 					=> $_POST['sarana'],
			'jumlah' 					=> $_POST['jumlah'],
			'idkelompoksarana_fk' 		=> $_POST['idkelompoksarana_fk'],
			'idkondisisarana_fk' 		=> $_POST['idkondisisarana_fk'],
			'spesifikasi' 				=> $_POST['spesifikasi'],
			'no_inventaris' 			=> $_POST['no_inventaris'],
			'tahun_pengadaan' 			=> $_POST['tahun_pengadaan'],
			'tanggal_pengadaan' 		=> $_POST['tanggal_pengadaan'],
			'idlokasi_fk' 				=> $_POST['idlokasi_fk'],
			'foto'	=>	((isset($file_arsip)) ? $file_arsip['file_name'] : $_POST['file_arsip_before']),
		];
		if ($this->my_update('sarana',$data,['id_sarana'=>$_POST['id_sarana']])) {
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
				$data['sarana'] 	= $this->db->query('SELECT * FROM `sarana` where date(tanggal_surat) = DATE(NOW())')->result_array();
				$this->load->view('role/admin/page/sarana/print/index',$data);
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
			$this->my_view(['role/admin/page/sarana/print_page/index','role/admin/page/sarana/print_page/js'],$data);
			
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
		if ($_POST['idkondisisarana_fk'] != "") {
			$this->db->where("idkondisisarana_fk", $_POST['idkondisisarana_fk']);
		}
        $_POST['frm']   =   $this->arr;
        $list           =   $this->mod_datatable->get_datatables();
        $data           =   array();
        $no             =   $_POST['start'];
        foreach ($list as $field) {
            $no++;
            $row        =   array();
            $prasarana = $this->my_where('prasarana', ['id_prasarana'=>$field['idlokasi_fk']])->row_array();
            $kondisi_sarana = $this->my_where('kondisi_sarana', ['id_kondisi_sarana'=>$field['idkondisisarana_fk']])->row_array();
            $kelompok_sarana = $this->my_where('kelompok_sarana', ['id_kelompok_sarana'=>$field['idkelompoksarana_fk']])->row_array();
            $row[]      =   '<input type="checkbox" name="get-check" value="'.$field['id_sarana'].'"></input>';
            $row[]		=	'<a href="sarana/edit_page/'.$field['id_sarana'].'" class="app-item"><b>'.strtoupper($field['no_inventaris']).'</b></a>';
            $row[]		=	!empty($field['sarana']) ? strtoupper($field['sarana']) : '-';
            $row[]		=	!empty($field['jumlah']) ? $field['jumlah'] : '-';
            $row[]		=	$prasarana['prasarana'];
            $row[]		=	$kelompok_sarana['kelompok_sarana'];
            $row[]		=	'<b style="color:'.$kondisi_sarana['warna'].'">'.$kondisi_sarana['kondisi_sarana'].'</b>';
            $row[]		=	'<b>'.$field['tahun_pengadaan']." </b>(".$field['tanggal_pengadaan'].")";
            $row[]		=	!empty($field['foto']) ? '<a href="'.base_url('include/media/sarana/'.$field['foto']).'" target="__blank">Download Foto</a>' : '-';

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