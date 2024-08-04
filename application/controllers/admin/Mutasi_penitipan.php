<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class mutasi_penitipan extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman mutasi_penitipan',
			'table'				=>	'mutasi_penitipan',
			'column'			=>	['mutasi_penitipan'],
			'column_order'		=>	[ 'id_mutasi_penitipan','idpenitipanbarang_fk', 'pinjam', 'tanggal','kembali'],
			'column_search'		=>	[ 'id_mutasi_penitipan','idpenitipanbarang_fk', 'pinjam', 'tanggal','kembali'],
			'order'				=>	['id_mutasi_penitipan'	=>	'DESC'],
			'id'				=>	'id_mutasi_penitipan'
	];





	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/admin/page/mutasi_penitipan/index_page/index','role/admin/page/mutasi_penitipan/index_page/js'],$data);
	}

	public function add_page()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['lokasi_penitipan']	=	$this->my_where('lokasi_penitipan', [])->result_array();
		$data['kategori_penitipan']	=	$this->my_where('kategori_penitipan', [])->result_array();
		$this->my_view(['role/admin/page/mutasi_penitipan/add_page/index','role/admin/page/mutasi_penitipan/add_page/js'],$data);
	}

	public function edit_page($id)
	{
		if (isset($id)) {
				$data['param'] 		= 	$this->arr;
				$data['mutasi_penitipan'] = 	$this->my_where('mutasi_penitipan',['id_mutasi_penitipan'=>$id])->row_array();
				$this->my_view(['role/admin/page/mutasi_penitipan/edit_page/index','role/admin/page/mutasi_penitipan/edit_page/js'],$data);
		} else {
			$this->get_data();
		}
	}
	
	/*
		ADD DATA
	*/


	public function simpan_data()
	{	
		$foto = $this->save_media([
			'path'	=>	"./include/media/foto_mutasi_penitipan/",
			'filename' => 'foto',
		]);

		$data = [
			'table' 	=> $_POST['table'],
			'idtable_fk' 	=> $_POST['idtable_fk'],
			'nama_barang' 	=> $_POST['nama_barang'],
			'idlokasipenitipan_fk' 	=> $_POST['idlokasipenitipan_fk'],
			'idkategoripenitipan_fk' 	=> $_POST['idkategoripenitipan_fk'],
			'tanggal' 	=> $_POST['tanggal'],
			'spesifikasi' 	=> $_POST['spesifikasi'],
			'keterangan' 	=> $_POST['keterangan'],
			'foto'					=>	((isset($foto)) ? $foto['file_name'] : ''),
			'kode' 	=> $_POST['kode'],
			'rfid' => $_POST['rfid']
		];

		if ($this->save_data('mutasi_penitipan', $data)) {
			echo "Success";
		}
	}

	/*
		EDIT DATA
	*/

	function update_data()
	{
		$data = [
			'kategori' 	=> $_POST['kategori'],
		];
		if ($this->my_update('mutasi_penitipan',$data,['id_mutasi_penitipan'=>$_POST['id_mutasi_penitipan']])) {
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
		MANIPULATE DATA
	*/

	public function datatable()
	{
		if ($_POST['status'] != "") {
			if ($_POST['status'] == "belum_kembali") {
				$this->db->where("kembali", "");
			}else{

				$this->db->where("kembali <>", "");
			}
		}

		if ($_POST['tanggal'] != "") {
			$this->db->where("tanggal", $_POST['tanggal']);
		}
        $_POST['frm']   =   $this->arr;
        $list           =   $this->mod_datatable->get_datatables();
        $data           =   array();
        $no             =   $_POST['start'];
        foreach ($list as $field) {

            $no++;
			$detail_penitipan = $this->db->get_where("penitipan_barang", ['id_penitipan_barang'=>$field['idpenitipanbarang_fk']])->row_array();
			$penitip = $this->db->get_where($detail_penitipan['table'], ['id_'.$detail_penitipan['table']=>$detail_penitipan['idtable_fk']])->row_array();
            $row        =   array();
            $row[]      =   '<input type="checkbox" name="get-check" value="'.$field['id_mutasi_penitipan'].'"></input>';
            $row[]		=	date('d-m-Y', strtotime($field['tanggal']));
            $row[]		=	'<b>'.strtoupper($detail_penitipan['table']).'</b>'.' - '.strtoupper($penitip['nama']);
            $row[]		=	'<a href="mutasi_penitipan/edit_page/'.$field['id_mutasi_penitipan'].'" class="app-item"><b>'.strtoupper($detail_penitipan['nama_barang']).'</b></a>';
            $row[]		=	$field['pinjam'];
            $row[]		=	$field['kembali'];
            
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
	
	public function get_user($table = "")
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
}