<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class jenis_penerimaan extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman jenis_penerimaan',
			'table'				=>	'jenis_penerimaan',
			'column'			=>	['nama'],
			'column_order'		=>	[ 'id_jenis_penerimaan','nama'],
			'column_search'		=>	[ 'id_jenis_penerimaan','nama'],
			'order'				=>	['id_jenis_penerimaan'	=>	'DESC'],
			'id'				=>	'id_jenis_penerimaan'
	];

	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/bendahara/page/jenis_penerimaan/index_page/index','role/bendahara/page/jenis_penerimaan/index_page/js'],$data);
	}

	public function add_page()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['kas']		=	$this->my_where('akun', ['idindukakun_fk'=>1])->result_array();
		$data['pendapatan']		=	$this->db->where('idindukakun_fk', 7)->or_where('idindukakun_fk', 8)->get('akun')->result_array();
		$data['diskon']			=	$this->my_where('akun', ['idindukakun_fk'=>6])->result_array();
		$data['piutang']		=	$this->my_where('akun', ['idindukakun_fk'=>1])->result_array();
		$this->my_view(['role/bendahara/page/jenis_penerimaan/add_page/index','role/bendahara/page/jenis_penerimaan/add_page/js'],$data);
	}
	
	public function cetak_kartu()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/bendahara/page/jenis_penerimaan/print_page/cetak_kartu','role/bendahara/page/jenis_penerimaan/print_page/js_kartu'],$data);
	}

	public function set_laporan()
	{
		$data = [];
		$this->my_view(['role/bendahara/page/jenis_penerimaan/print_page/p'.$_POST['tipe']],$data);
	}

	public function print_pelanggaran()
	{
		$data = [];
		$data['pelanggaran']	=	[];

		if ($_POST['tipe'] == 0) {
			$data['periode']		=	'Tanggal '.$_POST['tanggal'];
			$data['pelanggaran']	=	$this->my_where('v_jenis_penerimaan', ['tanggal' => $_POST['tanggal']])->result_array();
		}else if($_POST['tipe'] == 2){
			$data['periode']		=	'Bulan '.date_format(date_create($_POST['tanggal']), "m").' Tahun '.date_format(date_create($_POST['tanggal']), "Y");
			$data['pelanggaran']	=	$this->my_where('v_jenis_penerimaan', [
				'MONTH(tanggal)'		=>	date_format(date_create($_POST['tanggal']), "m"),
				'YEAR(tanggal)'			=>	date_format(date_create($_POST['tanggal']), "Y"),
			])->result_array();
		}
		$this->my_view(['role/bendahara/page/jenis_penerimaan/print_page/table_pelanggaran'],$data);
	}

	public function cetak()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/bendahara/page/jenis_penerimaan/print_page/cetak','role/bendahara/page/jenis_penerimaan/print_page/js_cetak'],$data);
	}


	public function edit_page($id)
	{
		if (isset($id)) {
				$data['param'] 		= 	$this->arr;
				$data['poinpelanggaran']	=	$this->my_where('poin_pelanggaran',[])->result_array();
				$data['jenis_penerimaan'] = 	$this->my_where('jenis_penerimaan',['id_jenis_penerimaan'=>$id])->row_array();
				$data['siswa']				=	$this->my_where('siswa', ['id_siswa'=>$data['jenis_penerimaan']['idsiswa_fk']])->row_array();
				$this->my_view(['role/bendahara/page/jenis_penerimaan/edit_page/index','role/bendahara/page/jenis_penerimaan/edit_page/js'],$data);
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
			'idsiswa_fk' 				=> $_POST['idsiswa_fk'],
			'uraian_pelanggaran' 		=> $_POST['uraian_pelanggaran'],
			'idpoinpelanggaran_fk' 		=> $_POST['idpoinpelanggaran_fk'],
			'tanggal' 					=> $_POST['tanggal'],
		];

		if ($this->save_data('jenis_penerimaan', $data)) {
			echo "Success";
		}
	}
	public function simpan_data_pelanggaran()
	{
		$data = [
			'idsiswa_fk' 				=> $_POST['idsiswa_fk'],
			'uraian_pelanggaran' 		=> $_POST['uraian_pelanggaran'],
			'idpoinpelanggaran_fk' 		=> $_POST['idpoinpelanggaran_fk'],
			'tanggal' 					=> $_POST['tanggal'],
		];

		if ($this->save_data('jenis_penerimaan', $data)) {
			$this->my_update('catatan_siswa', ['is_tindakan'=>1], ['id_catatan_siswa'=>$_POST['id']]);
		}
	}

	public function simpan_poin()
	{	
		$data = [
			'idjenispelanggaran_fk' 				=> $_POST['idjenispelanggaran_fk'],
			'nama_pelanggaran' 						=> $_POST['nama_pelanggaran'],
			'poin' 									=> $_POST['poin'],
			'kode_pelanggaran' 						=> $_POST['kode_pelanggaran'],
		];

		if ($this->save_data('poin_pelanggaran', $data)) {
			echo "Success";
		}
	}

	public function update_poin()
	{	
		$data = [
			'idjenispelanggaran_fk' 				=> $_POST['idjenispelanggaran_fk'],
			'nama_pelanggaran' 						=> $_POST['nama_pelanggaran'],
			'poin' 									=> $_POST['poin'],
			'kode_pelanggaran' 						=> $_POST['kode_pelanggaran'],
		];

		if ($this->my_update('poin_pelanggaran', $data, ['id_poin_pelanggaran'=>$_POST['id']])) {
			echo "Success";
		}
	}


	/*
		EDIT DATA
	*/

	function update_data()
	{
		$data = [
			'uraian_pelanggaran' 		=> $_POST['uraian_pelanggaran'],
			'idpoinpelanggaran_fk' 		=> $_POST['idpoinpelanggaran_fk'],
			'tanggal' 					=> $_POST['tanggal'],
		];
		if ($this->my_update('jenis_penerimaan',$data,['id_jenis_penerimaan'=>$_POST['id_jenis_penerimaan']])) {
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
				$data['jenis_penerimaan'] 	= $this->db->query('SELECT * FROM `jenis_penerimaan` where date(tanggal_surat) = DATE(NOW())')->result_array();
				$this->load->view('role/bendahara/page/jenis_penerimaan/print/index',$data);
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
			$this->my_view(['role/bendahara/page/jenis_penerimaan/print_page/index','role/bendahara/page/jenis_penerimaan/print_page/js'],$data);
			
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
            $kas 		=	$this->my_where('akun', ['id_akun'=>$field['kas']])->row_array();
            $pendapatan 		=	$this->my_where('akun', ['id_akun'=>$field['pendapatan']])->row_array();
            $piutang 		=	$this->my_where('akun', ['id_akun'=>$field['piutang']])->row_array();
            $diskon 		=	$this->my_where('akun', ['id_akun'=>$field['diskon']])->row_array();
            $row[]      =   '<input type="checkbox" name="get-check" value="'.$field['id_jenis_penerimaan'].'"></input>';
            $row[]		=	!empty($field['nama']) ? $field['nama'] : '-';
            $row[]		=	'<ul><li>Kas : <b>('.$kas['no_ref'].') '.$kas['nama'].'</b></li>'.
            				'<li>Pendapatan : <b>('.$pendapatan['no_ref'].') '.$pendapatan['nama'].'</b></li>'.
            				'<li>piutang : <b>('.$piutang['no_ref'].') '.$piutang['nama'].'</b></li>'.
            				'<li>diskon : <b>('.$diskon['no_ref'].') '.$diskon['nama'].'</b></li>'.
            				'</ul>'
            ;

            $row[]		=	!empty($field['template_nota']) ? $field['template_nota'] : '-';
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

	public function print_kartu($id='')
	{
		$data['siswa'] = $this->my_where('v_siswa_jurusan', ['id_siswa' => $id])->row_array();
		$jenis_pelanggaran = $this->my_where('jenis_pelanggaran',[])->result_array();
		$data_pelanggaran = [];
		foreach ($jenis_pelanggaran as $key => $value) {
			$jenis_penerimaan = $this->my_where('v_jenis_penerimaan', ['idsiswa_fk'=>$id, 'id_jenis_pelanggaran'=>$value['id_jenis_pelanggaran']])->result_array();
			$data_pelanggaran[] = 
			[
				'jenis_pelanggaran' => $value,
				'data_jenis_penerimaan' => $jenis_penerimaan
			]; 
		}
		$data['pelanggaran'] = $data_pelanggaran;
		$this->my_view(['role/bendahara/page/jenis_penerimaan/print_page/cetak_kartu_kendali'],$data);
	}

	public function get_poin_pelanggaran($value='')
	{

	}
}