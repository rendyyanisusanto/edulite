<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class Tanggungan_alumni extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman Tanggungan Alumni',
			'table'				=>	'Tanggungan_alumni',
			'column'			=>	['nama','tahun_lulus','no_hp','alamat','jurusan'],
			'column_order'		=>	[ 'id_alumni','nama','tahun_lulus','no_hp','alamat','jurusan'],
			'column_search'		=>	[ 'id_alumni','nama','tahun_lulus','no_hp','alamat','jurusan'],
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
		$this->my_view(['role/admin/page/tanggungan_alumni/index_page/index','role/admin/page/tanggungan_alumni/index_page/js'],$data);
	}

	public function add_page()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/admin/page/tanggungan_alumni/add_page/index','role/admin/page/tanggungan_alumni/add_page/js'],$data);
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

		$trans_code = rand(0,99999).rand(0,99999);
		$data = [
			'idalumni_fk' 				=> $_POST['id_alumni'],
			'keterangan' 				=> $_POST['keterangan'],
			'jumlah' 					=> $_POST['jumlah'],
			'trans_code' 				=> $trans_code,
			'idjenispenerimaan_fk' 		=> $_POST['idjenispenerimaan_fk']
		];

		if ($this->save_data('tanggungan_alumni', $data)) {
						$get_penerimaan			=	$this->my_where('v_jenis_penerimaan', ['id_jenis_penerimaan'=>$_POST['idjenispenerimaan_fk']])->row_array();
						$tanggungan 			=	$this->my_where('tanggungan_alumni', $data)->row_array();
						$alumni 					=	$this->my_where('alumni', ['id_alumni'=>$_POST['id_alumni']])->row_array();
						$rand_jurnal 			= rand(1,9999999);
						$component_jurnal 		= [
											[
												'akun'			=>	$get_penerimaan['piutang'],
												'debit'			=>	(($get_penerimaan['snpiutang'] == 'D') ? $_POST['jumlah'] : 0),
												'kredit'		=>	(($get_penerimaan['snpiutang'] == 'K') ? $_POST['jumlah'] : 0),
											],
											[
												'akun'			=>	$get_penerimaan['pendapatan'],
												'debit'			=>	(($get_penerimaan['snpendapatan'] == 'D') ? $_POST['jumlah'] : 0),
												'kredit'		=>	(($get_penerimaan['snpendapatan'] == 'K') ? $_POST['jumlah'] : 0),
											]
									];
						
						$data_jurnal 			= [
									'ref'			=>	$rand_jurnal,
									'keterangan'	=>	'Pendataan Tanggungan Alumni a/n '.$alumni['nama'],
									'table'			=>	'tanggungan_alumni',
									'idtable_fk' 	=>	$tanggungan['id_tanggungan_alumni'],
									'referensi'		=> $component_jurnal
								];
						if (!empty($data_jurnal)) {
							$this->save_my_jurnal($data_jurnal);	
						}	
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
		$this->arr['table']	=	"alumni";
        $_POST['frm']   =   $this->arr;
        $list           =   $this->mod_datatable->get_datatables();
        $data           =   array();
        $no             =   $_POST['start'];
        foreach ($list as $field) {
            $no++;
			$total_tanggungan = 0;
            
            if (!empty($field['is_siswa_id'])) {
				$tanggungan_siswa 				= 	$this->my_where('v_tanggungan_siswa', ['idsiswa_fk'=>$field['is_siswa_id']])->result_array();

				foreach ($tanggungan_siswa as $value_penerimaan) {
					$pembayaran = $this->db->select('sum(jumlah) as jml')->get_where('penerimaan', ['idsiswa_fk'=>$field['is_siswa_id'], 'idjenispenerimaan_fk'=>$value_penerimaan['id_jenis_penerimaan']])->row_array();
					$tanggungan[]	=	[
						'id_jenis_penerimaan'	=>	$value_penerimaan['id_jenis_penerimaan'],
						'jumlah'				=>	$value_penerimaan['jumlah'],
						'nama'					=>	$value_penerimaan['nama'],
						'pembayaran'			=>	$pembayaran['jml']
					];
					$total_tanggungan += ($value_penerimaan['jumlah']-$pembayaran['jml']);
				}
            }

            $tanggungan_alumni = $this->db->query('select sum(jumlah) as jml from tanggungan_alumni where idalumni_fk='.$field['id_alumni'])->row_array();
            $total_tanggungan += ((!empty($tanggungan_alumni['jml'])) ? $tanggungan_alumni['jml'] : 0);

            $row        =   array();
            $row[]		=	!empty($field['nama']) ? strtoupper($field['nama']) : '-';
            $row[]		=	'<b class="text-danger">Rp.'.number_format($total_tanggungan, 0, '.','.').'</b>';
            $row[]      =   '<button class="btn btn-primary btn-xxs btn-proc" data-id="'.$field['id_alumni'].'"><i class="icon-eye"></i></button>';
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
	
	function content_panel(){
		$data['alumni'] = $this->my_where('alumni', ['id_alumni'=>$_POST['id_alumni']])->row_array();
		$status = 0;
		$total_tanggungan = 0;
		$tanggungan = [];
		$data['tanggungan_siswa'] = [];

		$data['jenis_penerimaan'] =	$this->my_where('jenis_penerimaan', [])->result_array();
		$data['tanggungan_alumni'] = $this->my_where('tanggungan_alumni', ['idalumni_fk'=>$_POST['id_alumni']])->result_array();
		if (!empty($data['alumni']['is_siswa_id'])) {
				$tanggungan_siswa 				= 	$this->my_where('v_tanggungan_siswa', ['idsiswa_fk'=>$data['alumni']['is_siswa_id']])->result_array();

				foreach ($tanggungan_siswa as $value_penerimaan) {
					$pembayaran = $this->db->select('sum(jumlah) as jml')->get_where('penerimaan', ['idsiswa_fk'=>$data['alumni']['is_siswa_id'], 'idjenispenerimaan_fk'=>$value_penerimaan['id_jenis_penerimaan']])->row_array();
					$tanggungan[]	=	[
						'id_jenis_penerimaan'	=>	$value_penerimaan['id_jenis_penerimaan'],
						'jumlah'				=>	$value_penerimaan['jumlah'],
						'nama'					=>	$value_penerimaan['nama'],
						'pembayaran'			=>	$pembayaran['jml']
					];
					$total_tanggungan += ($value_penerimaan['jumlah']-$pembayaran['jml']);
				}

				$data['tanggungan_siswa'] = $tanggungan;
        }

        // print_r($tanggungan_siswa);

		$this->my_view(['role/admin/page/tanggungan_alumni/index_page/content_panel', 'role/admin/page/tanggungan_alumni/index_page/content_panel_alumni'],$data);

	}
}