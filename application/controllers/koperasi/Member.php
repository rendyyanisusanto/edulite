<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class member extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman member',
			'table'				=>	'member',
			'column'			=>	['kode_arsip','pengirim','tanggal_surat','perihal','no_surat'],
			'column_order'		=>	[ 'id_koperasi_member','kode_arsip','pengirim','tanggal_surat','perihal','no_surat'],
			'column_search'		=>	[ 'id_koperasi_member','kode_arsip','pengirim','tanggal_surat','perihal','no_surat'],
			'order'				=>	['id_koperasi_member'	=>	'DESC'],
			'id'				=>	'id_koperasi_member'
	];

	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/koperasi/page/member/index_page/index', 'role/koperasi/page/member/index_page/js'],$data);
	}

	public function persebaran_member()
	{

		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['member']		=	json_encode($this->my_where('member', [])->result_array());
		$this->my_view(['role/koperasi/page/member/persebaran_page/index','role/koperasi/page/member/persebaran_page/js'],$data);
	}
	public function add_page()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/koperasi/page/member/add_page/index','role/koperasi/page/member/add_page/js'],$data);
	}

	public function edit_page($id)
	{
		if (isset($id)) {
				$data['param'] 		= 	$this->arr;
				$data['member'] = 	$this->my_where('member',['id_member'=>$id])->row_array();
				$this->my_view(['role/koperasi/page/member/edit_page/index','role/koperasi/page/member/edit_page/js'],$data);
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
			'table' 				            => $_POST['table'],
			'idtable_fk' 		                => $_POST['idtable_fk'],
			'jumlah_simpanan_pokok' 			=> $_POST['jumlah_simpanan_pokok'],
			'jumlah_simpanan_wajib' 			=> $_POST['jumlah_simpanan_wajib'],
		];

		if ($this->save_data('koperasi_member', $data)) {
			echo "Success";
		}
	}


	/*
		EDIT DATA
	*/

	function update_data()
	{
		$data = [
			'nama' 				=> $_POST['nama'],
			'tahun_lulus' 		=> $_POST['tahun_lulus'],
			'alamat' 			=> $_POST['alamat'],
			'no_hp' 			=> $_POST['no_hp'],
			'kuliah' 			=> $_POST['kuliah'],
			'menikah' 			=> $_POST['menikah'],
			'bekerja' 			=> $_POST['bekerja'],
			'pesantren' 		=> $_POST['pesantren'],
			'lng'				=> $_POST['lng'],
			'lat'				=> $_POST['lat'],
		];
		if ($this->my_update('member',$data,['id_member'=>$_POST['id_member']])) {
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
				$data['member'] 	= $this->db->query('SELECT * FROM `member` where date(tanggal_surat) = DATE(NOW())')->result_array();
				$this->load->view('role/koperasi/page/member/print/print_surat',$data);
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
			$this->my_view(['role/koperasi/page/member/print_page/index','role/koperasi/page/member/print_page/js'],$data);
			
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
        $_POST['frm']['table']  =   'koperasi_member';
        $list           =   $this->mod_datatable->get_datatables();
        $data           =   array();
        $no             =   $_POST['start'];
        foreach ($list as $field) {
            $no++;
            $row        =   array();
            $table_get  =   $this->my_where($field['table'], ['id_'.$field['table'] => $field['idtable_fk']])->row_array();
            $row[]      =   '<input type="checkbox" name="get-check" value="'.$field['id_koperasi_member'].'"></input>';
            $row[]		=	$field['table'];
            $row[]		=	$table_get['nama'];
            $row[]		=	'Rp. '.number_format($field['jumlah_simpanan_pokok'], 0, '.','.');
            $row[]		=	'Rp. '.number_format($field['jumlah_simpanan_wajib'], 0, '.','.');

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
	public function get_user()
	{
		$table = $_POST['table'];

		$data = $this->my_where($table, [])->result_array();

		$send = "<select class='form-control user' name='user'>";
		$send .= "<option value=''>Pilih</option>";
		foreach ($data as $key => $value) {
			$send.="<option value='".$value['id_'.$table]."'>".$value['nama']."</option>";
		}
		$send.="</select>";
		echo $send;
	}
	
}