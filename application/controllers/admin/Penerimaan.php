<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Penerimaan extends MY_Controller {


	public $arr = [
			'title'				=>	'Halaman Data Tanggungan Siswa',
			'table'				=>	'penerimaan',
			'column'			=>	[ 'idsiswa_fk','idjenispenerimaan_fk','metode_pembayaran','tanggal','jumlah','catatan','create_at','invoice','diskon'],
			'column_order'		=>	[ 'id_penerimaan','idsiswa_fk','idjenispenerimaan_fk','metode_pembayaran','tanggal','jumlah','catatan','create_at','invoice','diskon'],
			'column_search'		=>	[ 'id_penerimaan','idsiswa_fk','idjenispenerimaan_fk','metode_pembayaran','tanggal','jumlah','catatan','create_at','invoice','diskon'],
			'order'				=>	['id_penerimaan'	=>	'DESC'],
			'id'				=>	'id_penerimaan'
	];

	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		
		$this->my_view(['role/admin/page/penerimaan/index_page/index','role/admin/page/penerimaan/index_page/js'],$data);
	}
	public function add_page()
	{
		$data['account']	=	$this->get_user_account();
		$data['jenis_penerimaan'] =	$this->my_where('jenis_penerimaan', [])->result_array();
		
		$this->my_view(['role/admin/page/penerimaan/add_page/index','role/admin/page/penerimaan/add_page/js'],$data);
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
	function proses_penerimaan(){
		if (isset($_POST)) {
			$tanggungan 				= 	$this->my_where('v_tanggungan_siswa', ['idsiswa_fk'=>$_POST['id']])->result_array();
			$data['siswa']				=	$this->my_where('v_siswa_jurusan', ['id_siswa'=>$_POST['id']])->row_array();
			$data['jenis_penerimaan']	=	$this->my_where('jenis_penerimaan',[])->result_array();
			$data['tanggungan']			=	[];
			$this->db->order_by('tanggal', 'DESC');
			$data['histori_pembayaran']	=	$this->my_where('v_penerimaan', ['idsiswa_fk'=>$_POST['id']])->result_array();
			foreach ($tanggungan as $value) {
				$pembayaran = $this->db->select('sum(jumlah) as jml')->get_where('penerimaan', ['idsiswa_fk'=>$_POST['id'], 'idjenispenerimaan_fk'=>$value['id_jenis_penerimaan']])->row_array();
				$data['tanggungan'][]	=	[
					'id_jenis_penerimaan'	=>	$value['idjenispenerimaan_fk'],
					'nama'		=>	$value['nama'],
					'jumlah'	=>	$value['jumlah'],
					'pembayaran'	=>	$pembayaran['jml']
				];

			}
			if (!empty($data['tanggungan'])) {
				$this->my_view(['role/admin/page/penerimaan/add_page/proses_penerimaan','role/admin/page/penerimaan/add_page/list_tanggungan'],$data);
			}else{
				$this->my_view(['role/admin/page/penerimaan/add_page/proses_tanggungan'],$data);
			}
		}
	}
	function save_transaksi()
	{
		$jumlah =(int) preg_replace("/[^0-9]/", "", $_POST['jumlah']);
		$diskon =(int) preg_replace("/[^0-9]/", "", $_POST['diskon']);
		$data = [
			'idsiswa_fk'					=> $_POST['idsiswa_fk'],
			'idjenispenerimaan_fk'			=> $_POST['idjenispenerimaan_fk'],
			'metode_pembayaran'				=> $_POST['metode_pembayaran'],
			'tanggal'						=> $_POST['tanggal'],
			'catatan'						=> $_POST['catatan'],
			'jumlah'						=> $jumlah,
			'invoice'						=> $_POST['invoice'],
			'diskon'						=> $diskon
		];

		if ($this->save_data('penerimaan', $data)) {
			
			/*
			tunai
				Kas 				20000	0
				Pendapatan			0		20000
			
			utang
				kas 				10000	0
				piutang				10000	0
			*/

				$get_penerimaan			=	$this->my_where('v_jenis_penerimaan', ['id_jenis_penerimaan'=>$_POST['idjenispenerimaan_fk']])->row_array();
				$penerimaan 			=	$this->my_where('penerimaan', $data)->row_array();
				$siswa 					=	$this->my_where('siswa', ['id_siswa'=>$_POST['idsiswa_fk']])->row_array();
				$rand_jurnal 			= rand(1,9999999);
				$component_jurnal 		= [
									[
										'akun'			=>	$get_penerimaan['kas'],
										'debit'			=>	(($diskon > 0) ? ($jumlah-$diskon) : $jumlah),
										'kredit'		=>	0
									],
									[
										'akun'			=>	$get_penerimaan['piutang'],
										'debit'			=>	0 ,
										'kredit'		=>	$jumlah,
									]
							];
				if ($_POST['diskon'] > 0) {
					$component_jurnal[] = [
										'akun'			=>	$get_penerimaan['diskon'],
										'debit'			=>	$diskon ,
										'kredit'		=>	0,
					];
				}
				$data_jurnal 			= [
							'ref'			=>	$rand_jurnal,
							'keterangan'	=>	'Pembayaran tanggungan '.$get_penerimaan['nama'].' siswa a/n '.$siswa['nama'],
							'table'			=>	'penerimaan',
							'idtable_fk' 	=>	$penerimaan['id_penerimaan'],
							'referensi'		=> $component_jurnal
						];
				if (!empty($data_jurnal)) {
					$this->save_my_jurnal($data_jurnal);	
				}	

		}


	}
	function save_tanggungan(){
		foreach ($_POST['data'] as $key => $value) {
			$inv = rand(1,9999999);
			$data = [
				'idsiswa_fk' => $_POST['idsiswa_fk'],
				'idjenispenerimaan_fk'	=>	$value['id_jenis_penerimaan'],
				'jumlah'	=>	$value['jumlah'],
				'invoice'		=>	$inv
			];
			if($this->save_data('tanggungan_siswa', $data)){
				/*
				tunai
					Piutang 			20000	0
					Pendapatan			0		20000
				
				*/

				$get_penerimaan			=	$this->my_where('v_jenis_penerimaan', ['id_jenis_penerimaan'=>$value['id_jenis_penerimaan']])->row_array();
				$tanggungan 			=	$this->my_where('tanggungan_siswa', $data)->row_array();
				$siswa 					=	$this->my_where('siswa', ['id_siswa'=>$_POST['idsiswa_fk']])->row_array();
				$rand_jurnal 			= rand(1,9999999);
				$component_jurnal 		= [
									[
										'akun'			=>	$get_penerimaan['piutang'],
										'debit'			=>	(($get_penerimaan['snpiutang'] == 'D') ? $value['jumlah'] : 0),
										'kredit'		=>	(($get_penerimaan['snpiutang'] == 'K') ? $value['jumlah'] : 0),
									],
									[
										'akun'			=>	$get_penerimaan['pendapatan'],
										'debit'			=>	(($get_penerimaan['snpendapatan'] == 'D') ? $value['jumlah'] : 0),
										'kredit'		=>	(($get_penerimaan['snpendapatan'] == 'K') ? $value['jumlah'] : 0),
									]
							];
				
				$data_jurnal 			= [
							'ref'			=>	$rand_jurnal,
							'keterangan'	=>	'Pendataan pembayaran tanggungan '.$get_penerimaan['nama'].' siswa a/n '.$siswa['nama'],
							'table'			=>	'tanggungan',
							'idtable_fk' 	=>	$tanggungan['id_tanggungan_siswa'],
							'referensi'		=> $component_jurnal
						];
				if (!empty($data_jurnal)) {
					$this->save_my_jurnal($data_jurnal);	
				}	
			}

			

		}
		echo json_encode($_POST);
	}
	public function datatable()
	{
		$this->arr = [
			'table'				=>	'v_penerimaan',
			'column'			=>	[ 'idsiswa_fk','idjenispenerimaan_fk','metode_pembayaran','tanggal','jumlah','catatan','create_at','invoice','diskon','nama', 'nis', 'nama_siswa'],
			'column_order'		=>	[ 'id_penerimaan','idsiswa_fk','idjenispenerimaan_fk','metode_pembayaran','tanggal','jumlah','catatan','create_at','invoice','diskon','nama', 'nis', 'nama_siswa'],
			'column_search'		=>	[ 'id_penerimaan','idsiswa_fk','idjenispenerimaan_fk','metode_pembayaran','tanggal','jumlah','catatan','create_at','invoice','diskon','nama', 'nis', 'nama_siswa'],
			'order'				=>	['id_penerimaan'	=>	'DESC'],
			'id'				=>	'id_penerimaan'
		];
		$_POST['frm']   =   $this->arr;
        $list           =   $this->mod_datatable->get_datatables();
        $data           =   array();
        $no             =   $_POST['start'];
        foreach ($list as $field) {
            $no++;
            $row        =   array();
            $row[]      =   '<input type="checkbox" name="get-check" value="'.$field['id_penerimaan'].'"></input>';
            $row[]		=	date_format(date_create($field['tanggal']), 'd-M-Y');
            $row[]		=	'<b>'. $field['invoice']. '</b>';
            $row[]		=	$field['nama_siswa'];
            $row[]		=	$field['nama'];
            $row[]		=	'Rp. '.number_format($field['jumlah'], 0, '.', '.');
            $row[]		=	'<button type="button" data-id="'.$field['id_penerimaan'].'" class="btn btn-struk btn-primary btn-xs" ><i class="icon-printer"></i></button>';
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


	public function get_code()
	{
		if (isset($_POST)) {
				echo json_encode($this->generate_code($this->my_where('jenis_penerimaan',['id_jenis_penerimaan'=>$_POST['id']])->row_array()['template_nota']));
		}
	}

	function cetak_struk(){
		$data['post'] 		= 	$_POST;
		$data['profil']		=	$this->mod->get_profil_website();
		$data['penerimaan']	=	$this->my_where('v_penerimaan', ['id_penerimaan'=>$_POST['id_penerimaan']])->row_array();
		$this->load->view('role/admin/page/penerimaan/index_page/cetak_struk', $data);
	}
	function cetak_hari_ini(){
		$data['penerimaan']	=	$this->my_where('v_penerimaan', ['date(tanggal)'=>date('Y-m-d')])->result_array();
		$this->load->view('role/admin/page/penerimaan/index_page/cetak_hari_ini', $data);
	}
}
// href="'.base_url('admin/Penerimaan/cetak_struk/'.$field['id_penerimaan']).'"