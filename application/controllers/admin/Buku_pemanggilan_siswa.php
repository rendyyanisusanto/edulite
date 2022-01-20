<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class buku_pemanggilan_siswa extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman buku_pemanggilan_siswa',
			'table'				=>	'v_buku_pemanggilan_siswa',
			'column'			=>	['kode_pemanggilan','tanggal','nama','masalah','pemecahan'],
			'column_order'		=>	[ 'id_buku_pemanggilan_siswa','kode_pemanggilan','tanggal','nama','masalah','pemecahan'],
			'column_search'		=>	[ 'id_buku_pemanggilan_siswa','kode_pemanggilan','tanggal','nama','masalah','pemecahan'],
			'order'				=>	['id_buku_pemanggilan_siswa'	=>	'DESC'],
			'id'				=>	'id_buku_pemanggilan_siswa'
	];

	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/admin/page/buku_pemanggilan_siswa/index_page/index','role/admin/page/buku_pemanggilan_siswa/index_page/js'],$data);
	}

	public function add_page()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/admin/page/buku_pemanggilan_siswa/add_page/index','role/admin/page/buku_pemanggilan_siswa/add_page/js'],$data);
	}

	public function edit_page($id)
	{
		if (isset($id)) {
				$data['param'] 		= 	$this->arr;
				$data['buku_pemanggilan_siswa'] = 	$this->my_where('buku_pemanggilan_siswa',['id_buku_pemanggilan_siswa'=>$id])->row_array();
				$this->my_view(['role/admin/page/buku_pemanggilan_siswa/edit_page/index','role/admin/page/buku_pemanggilan_siswa/edit_page/js'],$data);
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
			'idsiswa_fk' 	=> $_POST['idsiswa_fk'],
			'masalah' 		=> $_POST['masalah'],
			'pemecahan' => $_POST['pemecahan'],
			'tindak_lanjut' 		=> $_POST['tindak_lanjut'],
			'keterangan' 		=> $_POST['keterangan'],
			'tanggal' 		=> $_POST['tanggal'],
			'kode_pemanggilan' 		=> $_POST['kode_pemanggilan'],
		];

		if ($this->save_data('buku_pemanggilan_siswa', $data)) {
			echo "Success";
		}
	}


	/*
		EDIT DATA
	*/

	function update_data()
	{
		$data = [
			'masalah' 		=> $_POST['masalah'],
			'pemecahan' => $_POST['pemecahan'],
			'tindak_lanjut' 		=> $_POST['tindak_lanjut'],
			'keterangan' 		=> $_POST['keterangan'],
			'tanggal' 		=> $_POST['tanggal'],
			'kode_pemanggilan' 		=> $_POST['kode_pemanggilan'],
	];
		if ($this->my_update('buku_pemanggilan_siswa',$data,['id_buku_pemanggilan_siswa'=>$_POST['id_buku_pemanggilan_siswa']])) {
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
				$data['buku_pemanggilan_siswa'] 	= $this->db->query('SELECT * FROM `buku_pemanggilan_siswa` where date(tanggal_surat) = DATE(NOW())')->result_array();
				$this->load->view('role/admin/page/buku_pemanggilan_siswa/print/index',$data);
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
			$this->my_view(['role/admin/page/buku_pemanggilan_siswa/print_page/index','role/admin/page/buku_pemanggilan_siswa/print_page/js'],$data);
			
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
            $row[]      =   '<input type="checkbox" name="get-check" value="'.$field['id_buku_pemanggilan_siswa'].'"></input>';
            $row[]		=	'<a href="buku_pemanggilan_siswa/edit_page/'.$field['id_buku_pemanggilan_siswa'].'" class="app-item"><b>'.strtoupper($field['kode_pemanggilan']).'</b></a>';
            $row[]		=	!empty($field['tanggal']) ? date_format(date_create($field['tanggal']),'d-m-Y') : '-';
            $row[]		=	!empty($field['nama']) ? strtoupper($field['nama']) : '-';
            $row[]		=	!empty($field['masalah']) ? $field['masalah'] : '-';
            $row[]		=	!empty($field['pemecahan']) ? $field['pemecahan'] : '-';
            $row[]		=	!empty($field['tindak_lanjut']) ? $field['tindak_lanjut'] : '-';
            $row[]		=	'<a href="'.base_url('admin/buku_pemanggilan_siswa/cetak_bukti/'.$field['id_buku_pemanggilan_siswa']).'" target="__blank">Cetak Bukti</a>';

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
	function cetak_bukti($id)
	{
		if (isset($id)) {
				$data['param'] 		= 	$this->arr;
				$data['buku_pemanggilan_siswa'] = 	$this->my_where('v_buku_pemanggilan_siswa',['id_buku_pemanggilan_siswa'=>$id])->row_array();
				$this->my_view(['role/admin/page/buku_pemanggilan_siswa/print_page/index'],$data);
		} else {
			$this->get_data();
		}
	}
}