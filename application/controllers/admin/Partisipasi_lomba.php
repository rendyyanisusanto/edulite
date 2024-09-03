<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class partisipasi_lomba extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman partisipasi_lomba',
			'table'				=>	'partisipasi_lomba',
			'column'			=>	['partisipasi_lomba','penyelenggara', 'tanggal', 'bidang', 'foto_brosur', 'proposal', 'peserta'],
			'column_order'		=>	[ 'id_partisipasi_lomba','partisipasi_lomba','penyelenggara', 'tanggal', 'bidang', 'foto_brosur', 'proposal', 'peserta'],
			'column_search'		=>	[ 'id_partisipasi_lomba','partisipasi_lomba','penyelenggara', 'tanggal', 'bidang', 'foto_brosur', 'proposal', 'peserta'],
			'order'				=>	['id_partisipasi_lomba'	=>	'DESC'],
			'id'				=>	'id_partisipasi_lomba'
	];
	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/admin/page/partisipasi_lomba/index_page/index','role/admin/page/partisipasi_lomba/index_page/js'],$data);
	}

	public function add_page()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;

		$this->my_view(['role/admin/page/partisipasi_lomba/add_page/index','role/admin/page/partisipasi_lomba/add_page/js'],$data);
	}

	public function edit_page($id)
	{
		if (isset($id)) {
				$data['param'] 		= 	$this->arr;
				$data['partisipasi_lomba'] 	= 	$this->my_where('partisipasi_lomba',['id_partisipasi_lomba'=>$id])->row_array();
				$data['kondisi_partisipasi_lomba']	=	$this->my_where('kondisi_partisipasi_lomba', [])->result_array();
				$data['prapartisipasi_lomba']	=	$this->my_where('prapartisipasi_lomba', [])->result_array();
				$data['kelompok_partisipasi_lomba']	=	$this->my_where('kelompok_partisipasi_lomba', [])->result_array();
				$this->my_view(['role/admin/page/partisipasi_lomba/edit_page/index','role/admin/page/partisipasi_lomba/edit_page/js'],$data);
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
			'path'	=>	"./include/media/partisipasi_lomba/",
			'filename' => 'foto_brosur',
		]);
		$proposal = $this->save_media([
			'path'	=>	"./include/media/partisipasi_lomba/",
			'filename' => 'proposal',
		]);
		$data = [
			'lomba' 							=> $_POST['lomba'],
			'penyelenggara' 					=> $_POST['penyelenggara'],
			'tanggal' 							=> $_POST['tanggal'],
			'bidang' 							=> $_POST['bidang'],
			'foto_brosur'						=>	((isset($file_arsip)) ? $file_arsip['file_name'] : ''),
			'proposal'							=>	((isset($proposal)) ? $proposal['file_name'] : ''),
			'kode' 								=> $_POST['kode']
		];

		if ($this->save_data('partisipasi_lomba', $data)) {
			$lomba = $this->my_where('partisipasi_lomba', [
				'kode' 	=> $_POST['kode'],
				'lomba' 			=> $_POST['lomba'],
				'penyelenggara' 	=> $_POST['penyelenggara'],
				'tanggal' 			=> $_POST['tanggal'],
			])->row_array();

			foreach ($_POST['data'] as $key => $value) {
				$this->save_data('peserta_partisipasi_lomba', [
					'table'					=>	$value['table'],
					'idanggota_fk'			=>	$value['idanggota_fk'],
					'idpartisipasilomba_fk'	=>	$lomba['id_partisipasi_lomba']
				]);
			}
		}
	}



	/*
		EDIT DATA
	*/

	function update_data()
	{
		$file_arsip = $this->save_media([
			'path'	=>	"./include/media/partisipasi_lomba/",
			'filename' => 'file_arsip',
		]);
		$data = [
			'partisipasi_lomba' 					=> $_POST['partisipasi_lomba'],
			'jumlah' 					=> $_POST['jumlah'],
			'idkelompokpartisipasi_lomba_fk' 		=> $_POST['idkelompokpartisipasi_lomba_fk'],
			'idkondisipartisipasi_lomba_fk' 		=> $_POST['idkondisipartisipasi_lomba_fk'],
			'spesifikasi' 				=> $_POST['spesifikasi'],
			'no_inventaris' 			=> $_POST['no_inventaris'],
			'tahun_pengadaan' 			=> $_POST['tahun_pengadaan'],
			'tanggal_pengadaan' 		=> $_POST['tanggal_pengadaan'],
			'idlokasi_fk' 				=> $_POST['idlokasi_fk'],
			'foto'	=>	((isset($file_arsip)) ? $file_arsip['file_name'] : $_POST['file_arsip_before']),
		];
		if ($this->my_update('partisipasi_lomba',$data,['id_partisipasi_lomba'=>$_POST['id_partisipasi_lomba']])) {
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
				$data['partisipasi_lomba'] 	= $this->db->query('SELECT * FROM `partisipasi_lomba` where date(tanggal_surat) = DATE(NOW())')->result_array();
				$this->load->view('role/admin/page/partisipasi_lomba/print/index',$data);
		}

		public function print_semua()
		{
				$data['param'] 		= 	$this->arr;
				$data['partisipasi_lomba'] 	= $this->db->query('SELECT *, (select prapartisipasi_lomba from prapartisipasi_lomba where id_prapartisipasi_lomba = partisipasi_lomba.idlokasi_fk) as ruang FROM `partisipasi_lomba` ')->result_array();
				$data['kondisi_partisipasi_lomba'] 	= $this->db->query('SELECT * FROM `kondisi_partisipasi_lomba` ')->result_array();
				$this->load->view('role/admin/page/partisipasi_lomba/print/all',$data);
		}
		public function print_kategori()
		{
				$data['param'] 		= 	$this->arr;
				$data['partisipasi_lomba'] 	= $this->db->query('SELECT *, (select sum(jumlah) from partisipasi_lomba where idkelompokpartisipasi_lomba_fk=id_kelompok_partisipasi_lomba) as jumlah FROM `kelompok_partisipasi_lomba` ')->result_array();
				$this->load->view('role/admin/page/partisipasi_lomba/print/kategori',$data);
		}

		public function print_ruangan()
		{
				$data['param'] 		= 	$this->arr;
				$data['send']	=	[];
				$data['kondisi_partisipasi_lomba'] 	= $this->db->query('SELECT * FROM `kondisi_partisipasi_lomba` ')->result_array();
				$ruangan =	$this->my_where("prapartisipasi_lomba", [])->result_array();
				foreach ($ruangan as $key => $value) {
					$partisipasi_lomba = $this->my_where("partisipasi_lomba", ['idlokasi_fk'=>$value['id_prapartisipasi_lomba']])->result_array();
					if (!empty($partisipasi_lomba)) {
						// code...
						$data['send'][] = [
							'ruangan'	=> $value,
							'partisipasi_lomba'	=>	$partisipasi_lomba
						];
					}
				}
				$this->load->view('role/admin/page/partisipasi_lomba/print/ruangan',$data);
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
			$this->my_view(['role/admin/page/partisipasi_lomba/print_page/index','role/admin/page/partisipasi_lomba/print_page/js'],$data);
			
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
		if ($_POST['idkondisipartisipasi_lomba_fk'] != "") {
			$this->db->where("idkondisipartisipasi_lomba_fk", $_POST['idkondisipartisipasi_lomba_fk']);
		}
        $_POST['frm']   =   $this->arr;
        $list           =   $this->mod_datatable->get_datatables();
        $data           =   array();
        $no             =   $_POST['start'];
        foreach ($list as $field) {
            $no++;
            $row        =   array();
            $row[]      =   '<input type="checkbox" name="get-check" value="'.$field['id_partisipasi_lomba'].'"></input>';
            $row[]		=	!empty($field['tanggal']) ? $field['tanggal'] : '-';
            $row[]		=	'<a href="partisipasi_lomba/edit_page/'.$field['id_partisipasi_lomba'].'" class="app-item"><b>'.strtoupper($field['kode']).'</b></a>';
            $row[]		=	!empty($field['lomba']) ? strtoupper($field['lomba']) : '-';
            $row[]		=	!empty($field['penyelenggara']) ? $field['penyelenggara'] : '-';
			$row[]		=	!empty($field['proposal']) ? '<a href="'.base_url('include/media/partisipasi_lomba/'.$field['proposal']).'" target="__blank">Download Proposal</a>' : '-';
			$row[]		=	!empty($field['foto_brosur']) ? '<a href="'.base_url('include/media/partisipasi_lomba/'.$field['foto_brosur']).'" target="__blank">Download Foto</a>' : '-';

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

	function get_user($table = ""){
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
	
}