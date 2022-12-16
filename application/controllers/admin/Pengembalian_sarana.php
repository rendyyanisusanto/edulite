<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class pengembalian_sarana extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman pengembalian_sarana',
			'table'				=>	'pengembalian_sarana',
			'column'			=>	['idpeminjamansarana_fk','tanggal_kembali','keterangan','is_complete'],
			'column_order'		=>	[ 'id_pengembalian_sarana','idpeminjamansarana_fk','tanggal_kembali','keterangan','is_complete'],
			'column_search'		=>	[ 'id_pengembalian_sarana','idpeminjamansarana_fk','tanggal_kembali','keterangan','is_complete'],
			'order'				=>	['id_pengembalian_sarana'	=>	'DESC'],
			'id'				=>	'id_pengembalian_sarana'
	];

	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/admin/page/pengembalian_sarana/index_page/index','role/admin/page/pengembalian_sarana/index_page/js'],$data);
	}

	public function add_page()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/admin/page/pengembalian_sarana/add_page/index','role/admin/page/pengembalian_sarana/add_page/js'],$data);
	}

	public function edit_page($id)
	{
		if (isset($id)) {
				$data['param'] 				= 	$this->arr;
				$data['pengembalian_sarana'] 	= 	$this->my_where('pengembalian_sarana',['id_pengembalian_sarana'=>$id])->row_array();
				$data['peminjaman_sarana']	=	$this->my_where('peminjaman_sarana', ['id_peminjaman_sarana'=>$data['pengembalian_sarana']['idpeminjamansarana_fk']])->row_array();
			    $data['table_pemohon'] 		= 	$this->my_where($data['peminjaman_sarana']['table_pemohon'],['id_'.$data['peminjaman_sarana']['table_pemohon'] => $data['peminjaman_sarana']['idtablepemohon_fk']])->row_array();
			    $data['sarana']				=	[];
			    $data['kondisi_sarana']		=	$this->my_where("kondisi_sarana", [])->result_array();
				$detail_peminjaman_sarana = $this->my_where('detail_peminjaman_sarana', ['idpeminjamansarana_fk'=>$id])->result_array();
				foreach ($detail_peminjaman_sarana as $value) {
					$sarana = $this->my_where('sarana', ['id_sarana'=>$value['idsarana_fk']])->row_array();
					$kondisi = $this->my_where('kondisi_sarana', ['id_kondisi_sarana'=>$value['idkondisisarana_fk']])->row_array();
					$data['sarana'][] = [
						'detail' => $value,
						'sarana' => $sarana,
						'kondisi'=> $kondisi
					];
				}
				$this->my_view(['role/admin/page/pengembalian_sarana/edit_page/index','role/admin/page/pengembalian_sarana/edit_page/js'],$data);
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
			'idpeminjamansarana_fk' 		=>	$_POST['idpeminjamansarana_fk'],
			'tanggal_kembali'				=>	$_POST['tanggal_kembali'],
			'is_complete'					=>	$_POST['is_complete'],
			'no_pengembalian_sarana'		=>	$_POST['no_pengembalian_sarana'],
		];



		if ($this->save_data('pengembalian_sarana', $data)) {
			$datatrs = $this->my_where('pengembalian_sarana', $data)->row_array();
			foreach ($_POST['detail'] as $key => $value) {
				$detail = [
					'idpengembaliansarana_fk'		=>	$datatrs['id_pengembalian_sarana'],
					'idsarana_fk'					=>	$value['idsarana_fk'],
					'idkondisisarana_fk'			=>	$value['idkondisisarana_fk'],
					'keterangan'					=>	$value['keterangan'],
					'jumlah'						=>	$value['jumlah']
				];
				$this->save_data('detail_pengembalian_sarana', $detail);
				$this->my_update("sarana", ['idkondisisarana_fk'=>$value['idkondisisarana_fk']], ['id_sarana'=>$value['idsarana_fk']]);
			}

			$this->my_update("peminjaman_sarana", ['status'=>1], ['id_peminjaman_sarana'=>$_POST['idpeminjamansarana_fk']]);
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
			'no_pengembalian_sarana'		=>	$_POST['no_pengembalian_sarana']
		];
		if ($this->my_update('pengembalian_sarana',$data,['id_pengembalian_sarana'=>$_POST['id_pengembalian_sarana']])) {
			$del = $this->db->delete('detail_pengembalian_sarana', ['idpengembaliansarana_fk'=>$_POST['id_pengembalian_sarana']]);
			if ($del) {
				$datatrs = $this->my_where('pengembalian_sarana', $data)->row_array();
					foreach ($_POST['detail'] as $key => $value) {
						$detail = [
							'idpengembaliansarana_fk'			=>	$datatrs['id_pengembalian_sarana'],
							'idsarana_fk'					=>	$value['idsarana_fk'],
							'idkondisisarana_fk'			=>	$value['idkondisisarana_fk'],
							'keterangan'					=>	$value['keterangan'],
							'jumlah'						=>	$value['jumlah']
						];

						$this->save_data('detail_pengembalian_sarana', $detail);
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
			$pengembalian_sarana = $this->my_where("pengembalian_sarana", ['id_pengembalian_sarana'=>$value])->row_array();
			$this->my_update("peminjaman_sarana", ['status'=>0], ['id_peminjaman_sarana'=>$pengembalian_sarana['idpeminjamansarana_fk']]);
			$this->db->delete($dt['table'],[$dt['id']=>$value]);
		}
	}

	/*
		PRINT DATA
	*/

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
            $peminjaman_sarana = $this->my_where('peminjaman_sarana',['id_peminjaman_sarana'=> $field['idpeminjamansarana_fk']])->row_array();
            $table_pemohon = $this->my_where($peminjaman_sarana['table_pemohon'],['id_'.$peminjaman_sarana['table_pemohon'] => $peminjaman_sarana['idtablepemohon_fk']])->row_array();
            $row[]      =   '<input type="checkbox" name="get-check" value="'.$field['id_pengembalian_sarana'].'"></input>';
            $row[]		=	'<a href="pengembalian_sarana/edit_page/'.$field['id_pengembalian_sarana'].'" class="app-item"><b>'.strtoupper($field['no_pengembalian_sarana']).'</b></a>';
            $row[]		=	'<b>'.strtoupper($peminjaman_sarana['table_pemohon'].' - '.$table_pemohon['nama']).'</b>';
            $row[]		=	'<b>'.date_format(date_create($peminjaman_sarana['tanggal_mulai']), 'd-M-y').'</b> s/d <b>'.date_format(date_create($peminjaman_sarana['tanggal_selesai']), 'd-M-y').' ('.date_diff(date_create($peminjaman_sarana['tanggal_mulai']), date_create($peminjaman_sarana['tanggal_selesai']))->format('%R%a').' Hari)</b>';
            $row[]		=	date_format(date_create($field['tanggal_kembali']), 'd-M-y');
            $row[]		=	 ($field['is_complete'] == 0) ? '<span class="label label-danger">Belum Lengkap</span>' :'<span class="label label-success">Sudah Lengkap</span>';
            $row[]		=	'<button class="btn btn-success btn-rounded btn-xs" onclick="get_detail('.$field['id_pengembalian_sarana'].');" type="button"><i class="icon-file-text2"></i></button> '.
            '<a class="btn btn-primary btn-rounded btn-xs" target="__blank" href="pengembalian_sarana/create_invoice/'.$field['id_pengembalian_sarana'].'"><i class="icon-printer"></i></a> ';
         
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
	
	function get_pemohon($table)
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
	                'url'			=>	'role/admin/page/pengembalian_sarana/print_page/invoice',
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

		$this->my_view(['role/admin/page/pengembalian_sarana/add_page/row'],$data);
	}
	function get_peminjaman_sarana()
	{
		$searchTerm = $this->input->post('searchTerm');

      // Get users

      	 $this->db->select('*');
	     $this->db->where("no_peminjaman_sarana like '%".$searchTerm."%' ")->limit(5);
	     $fetched_records = $this->db->get('peminjaman_sarana');
	     $users = $fetched_records->result_array();

	     // Initialize Array with fetched data
	     $data = array();
	     foreach($users as $user){
	     	$table_pemohon = $this->my_where($user['table_pemohon'],['id_'.$user['table_pemohon'] => $user['idtablepemohon_fk']])->row_array();
	        $data[] = array("id"=>$user['id_peminjaman_sarana'], "text"=>'('.$user['no_peminjaman_sarana'].') '.$table_pemohon['nama'].'('.$user['table_pemohon'].')');
	     }

      	echo json_encode($data);
	}
	function process_data($id)
	{

		$data['param'] 		= 	$this->arr;
		$data['peminjaman_sarana']	=	$this->my_where('peminjaman_sarana', ['id_peminjaman_sarana'=>$id])->row_array();
	    $data['table_pemohon'] 		= 	$this->my_where($data['peminjaman_sarana']['table_pemohon'],['id_'.$data['peminjaman_sarana']['table_pemohon'] => $data['peminjaman_sarana']['idtablepemohon_fk']])->row_array();
	    $data['sarana']				=	[];
	    $data['kondisi_sarana']		=	$this->my_where("kondisi_sarana", [])->result_array();
		$detail_peminjaman_sarana = $this->my_where('detail_peminjaman_sarana', ['idpeminjamansarana_fk'=>$id])->result_array();
		foreach ($detail_peminjaman_sarana as $value) {
			$sarana = $this->my_where('sarana', ['id_sarana'=>$value['idsarana_fk']])->row_array();
			$kondisi = $this->my_where('kondisi_sarana', ['id_kondisi_sarana'=>$value['idkondisisarana_fk']])->row_array();
			$data['sarana'][] = [
				'detail' => $value,
				'sarana' => $sarana,
				'kondisi'=> $kondisi
			];
		}
		$this->my_view(['role/admin/page/pengembalian_sarana/add_page/proses'],$data);
	}
	function get_detail($id)
	{
		$detail_pengembalian_sarana = $this->my_where('detail_pengembalian_sarana', ['idpengembaliansarana_fk'=>$id])->result_array();
		$data['pengembalian_sarana']	=	$this->my_where('pengembalian_sarana', ['id_pengembalian_sarana'=>$id])->row_array();
		$data['peminjaman_sarana']	=	$this->my_where('peminjaman_sarana', ['id_peminjaman_sarana'=>$data['pengembalian_sarana']['idpeminjamansarana_fk']])->row_array();
		$data['profil_peminjam'] =	$this->my_where($data['peminjaman_sarana']['table_pemohon'], ['id_'.$data['peminjaman_sarana']['table_pemohon'] =>$data['peminjaman_sarana']['idtablepemohon_fk']])->row_array();
		$data['sarana']		= [];
		foreach ($detail_pengembalian_sarana as $value) {
			$sarana = $this->my_where('sarana', ['id_sarana'=>$value['idsarana_fk']])->row_array();
			$detail_peminjaman_sarana = $this->my_where('detail_peminjaman_sarana', ['idsarana_fk'=>$value['idsarana_fk'], 'idpeminjamansarana_fk'=>$data['peminjaman_sarana']['id_peminjaman_sarana']])->row_array();
			$kondisi_awal = $this->my_where('kondisi_sarana', ['id_kondisi_sarana'=>$detail_peminjaman_sarana['idkondisisarana_fk']])->row_array();
			$kondisi = $this->my_where('kondisi_sarana', ['id_kondisi_sarana'=>$value['idkondisisarana_fk']])->row_array();
			$data['sarana'][] = [
				'detail' => $value,
				'sarana' => $sarana,
				'kondisi'=> $kondisi,
				'kondisi_awal'=> $kondisi_awal
			];
		}
		
		$this->my_view(['role/admin/page/pengembalian_sarana/index_page/detail'],$data);
	}
	function get_stats_nav()
	{
		$data['total']	=	$this->my_where('pengembalian_sarana', [])->num_rows();
		$data['sarana']	=	$this->my_where('sarana', [])->num_rows();
		$data['prasarana']	=	$this->my_where('prasarana', [])->num_rows();
		$data['peminjaman_sarana']	=	$this->my_where('peminjaman_sarana', [])->num_rows();
		$data['tidak_lengkap']	=	$this->my_where('pengembalian_sarana', ['is_complete'=>0])->num_rows();
		$data['lengkap']		=	$this->my_where('pengembalian_sarana', ['is_complete'=>1])->num_rows();

		$this->my_view(['role/admin/page/pengembalian_sarana/index_page/stats'],$data);
	}
}