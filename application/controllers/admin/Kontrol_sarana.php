<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class kontrol_sarana extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman kontrol_sarana',
			'table'				=>	'kontrol_sarana',
			'column'			=>	['no_kontrol_sarana','tanggal','idguru_fk'],
			'column_order'		=>	[ 'id_kontrol_sarana','no_kontrol_sarana','tanggal','idguru_fk'],
			'column_search'		=>	[ 'id_kontrol_sarana','no_kontrol_sarana','tanggal','idguru_fk'],
			'order'				=>	['id_kontrol_sarana'	=>	'DESC'],
			'id'				=>	'id_kontrol_sarana'
	];







	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/admin/page/kontrol_sarana/index_page/index','role/admin/page/kontrol_sarana/index_page/js'],$data);
	}

	public function add_page()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['guru']		=	$this->my_where('guru', [])->result_array();
		$this->my_view(['role/admin/page/kontrol_sarana/add_page/index','role/admin/page/kontrol_sarana/add_page/js'],$data);
	}

	public function edit_page($id)
	{
		if (isset($id)) {
				$data['param'] 				= 	$this->arr;
				$data['kontrol_sarana'] 	= 	$this->my_where('kontrol_sarana',['id_kontrol_sarana'=>$id])->row_array();
				$data['pemohon']			=	$this->my_where($data['kontrol_sarana']['table_pemohon'], ['id_'.$data['kontrol_sarana']['idtablepemohon_fk']])->row_array();
				$detail 					=	$this->my_where('detail_kontrol_sarana', ['idpeminjamansarana_fk'=>$id])->result_array();
				$sarana 					= 	$this->my_where('sarana', [])->result_array();
				$data['sarana']				=	$sarana;
				$data['detail_kontrol_sarana'] = [];
				$data['rand']			=	rand(0,99999);
				foreach ($detail as $value) {
					$sarana = $this->my_where("sarana", ['id_sarana'=>$value['idsarana_fk']])->row_array();
					$kondisi = $this->my_where('kondisi_sarana', ['id_kondisi_sarana'=>$value['idkondisisarana_fk']])->row_array();
					$data['detail_kontrol_sarana'][]	=	[
						'val'		=>	$value,
						'sarana'	=>	$sarana,
						'kondisi'	=> 	$kondisi
					];
				}

				$data['kondisi_sarana']	=	$this->my_where('kondisi_sarana', [])->result_array();
				$this->my_view(['role/admin/page/kontrol_sarana/edit_page/index','role/admin/page/kontrol_sarana/edit_page/js'],$data);
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
			'tanggal' 			=>	$_POST['tanggal'],
			'idguru_fk'			=>	$_POST['idguru_fk'],
			'no_kontrol_sarana'				=>	$_POST['no_kontrol_sarana'],
		];
		if ($this->save_data('kontrol_sarana', $data)) {
			$datatrs = $this->my_where('kontrol_sarana', $data)->row_array();
			foreach ($_POST['detail'] as $key => $value) {
				$detail = [
					'idkontrolsarana_fk'			=>	$datatrs['id_kontrol_sarana'],
					'idsarana_fk'					=>	$value['idsarana_fk'],
					'jumlah_awal'					=>	$value['jumlah_awal'],
					'jumlah_akhir'					=>	$value['jumlah_akhir'],
					'idkondisisarana_fk'			=>	$value['idkondisisarana_fk']
				];

				$this->save_data('detail_kontrol_sarana', $detail);
			}
		}
		echo json_encode($_POST);
	}

	/*
		EDIT DATA
	*/

	function update_data()
	{
		$data = [
			'tanggal_mulai' 			=>	$_POST['tanggal_mulai'],
			'tanggal_selesai'			=>	$_POST['tanggal_selesai'],
			'table_pemohon'				=>	$_POST['table_pemohon'],
			'idtablepemohon_fk'			=>	$_POST['idtablepemohon_fk'],
			'tujuan'					=>	$_POST['tujuan'],
			'no_kontrol_sarana'		=>	$_POST['no_kontrol_sarana']
		];
		if ($this->my_update('kontrol_sarana',$data,['id_kontrol_sarana'=>$_POST['id_kontrol_sarana']])) {
			$del = $this->db->delete('detail_kontrol_sarana', ['idpeminjamansarana_fk'=>$_POST['id_kontrol_sarana']]);
			if ($del) {
				$datatrs = $this->my_where('kontrol_sarana', $data)->row_array();
					foreach ($_POST['detail'] as $key => $value) {
						$detail = [
							'idpeminjamansarana_fk'			=>	$datatrs['id_kontrol_sarana'],
							'idsarana_fk'					=>	$value['idsarana_fk'],
							'idkondisisarana_fk'			=>	$value['idkondisisarana_fk'],
							'keterangan'					=>	$value['keterangan'],
							'jumlah'						=>	$value['jumlah']
						];

						$this->save_data('detail_kontrol_sarana', $detail);
					}
			}
			
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
				$data['kontrol_sarana'] 	= $this->db->query('SELECT * FROM `kontrol_sarana` where date(tanggal_surat) = DATE(NOW())')->result_array();
				$this->load->view('role/admin/page/kontrol_sarana/print/index',$data);
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
			$this->my_view(['role/admin/page/kontrol_sarana/print_page/index','role/admin/page/kontrol_sarana/print_page/js'],$data);
			
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
            $guru 		=	$this->my_where('guru', ['id_guru'=>$field['idguru_fk']])->row_array();
            $row[]      =   '<input type="checkbox" name="get-check" value="'.$field['id_kontrol_sarana'].'"></input>';
            $row[]		=	'<a href="kontrol_sarana/edit_page/'.$field['id_kontrol_sarana'].'" class="app-item"><b>'.strtoupper($field['no_kontrol_sarana']).'</b></a>';
            $row[]		=	$guru['nama'];
            $row[]		=	'<button class="btn btn-success btn-rounded btn-xs" onclick="get_detail('.$field['id_kontrol_sarana'].');" type="button"><i class="icon-file-text2"></i></button> '.
            '<a class="btn btn-primary btn-rounded btn-xs" target="__blank" href="kontrol_sarana/create_invoice/'.$field['id_kontrol_sarana'].'"><i class="icon-printer"></i></a> ';

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
	
	function get_pengembalian_sarana($table)
	{
		$searchTerm = $this->input->post('searchTerm');

      // Get users

      	 $this->db->select('*');
	     $this->db->where("nama like '%".$searchTerm."%' ")->limit(5);
	     $fetched_records = $this->db->get($table);
	     $users = $fetched_records->result_array();

	     // Initialize Array with fetched data
	     $data = array();
	     foreach($users as $user){
	        $data[] = array("id"=>$user['id_'.$table], "text"=>$user['nama']);
	     }

      	echo json_encode($data);
	}
	function create_invoice($id){
		$param	=	[
	                'url'			=>	'role/admin/page/kontrol_sarana/print_page/invoice',
	                'customPaper'	=>	array(0,0,381.89,595.28),
	                'data_value'	=>	[
	                	"data"		=>	[],
	                	"param"		=>	[]
	                ],
	                'name'			=>	md5(rand(0,9999999)),
	                'pos' 			=> 'landscape'
	            ];

	   	$this->my_pdf($param);
	}
	function add_row(){
		$sarana = $this->my_where('sarana', [])->result_array();
		$data['sarana']	=	$sarana;
		$data['kondisi_sarana']	=	$this->my_where('kondisi_sarana', [])->result_array();


		$data['rand']			=	rand(0,99999);

		$this->my_view(['role/admin/page/kontrol_sarana/add_page/row'],$data);
	}

	function get_detail($id)
	{
		$detail_kontrol_sarana = $this->my_where('detail_kontrol_sarana', ['idpeminjamansarana_fk'=>$id])->result_array();
		$data['kontrol_sarana']	=	$this->my_where('kontrol_sarana', ['id_kontrol_sarana'=>$id])->row_array();
		$data['profil_peminjam'] =	$this->my_where($data['kontrol_sarana']['table_pemohon'], ['id_'.$data['kontrol_sarana']['table_pemohon'] =>$data['kontrol_sarana']['idtablepemohon_fk'] ])->row_array();
		foreach ($detail_kontrol_sarana as $value) {
			$sarana = $this->my_where('sarana', ['id_sarana'=>$value['idsarana_fk']])->row_array();
			$kondisi = $this->my_where('kondisi_sarana', ['id_kondisi_sarana'=>$value['idkondisisarana_fk']])->row_array();
			$data['sarana'][] = [
				'detail' => $value,
				'sarana' => $sarana,
				'kondisi'=> $kondisi
			];
		}
		
		$this->my_view(['role/admin/page/kontrol_sarana/index_page/detail'],$data);
	}
	function get_stats_nav()
	{
		$data['total']	=	$this->my_where('kontrol_sarana', [])->num_rows();
		$data['sarana']	=	$this->my_where('sarana', [])->num_rows();
		$data['prasarana']	=	$this->my_where('prasarana', [])->num_rows();

		$this->my_view(['role/admin/page/kontrol_sarana/index_page/stats'],$data);
	}
	function get_detail_item($id)
	{
		echo json_encode([
			'sarana' => $this->my_where('sarana', ['id_sarana'=>$id])->row_array(),
		]);
	}
}