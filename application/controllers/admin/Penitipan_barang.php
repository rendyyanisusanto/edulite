<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class penitipan_barang extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman penitipan_barang',
			'table'				=>	'penitipan_barang',
			'column'			=>	['penitipan_barang'],
			'column_order'		=>	[ 'id_penitipan_barang','table', 'idtable_fk', 'nama_barang','idlokasipenitipan_fk', 'idkategoripenitipan_fk','tanggal', 'spesifikasi','keterangan','kode','rfid'],
			'column_search'		=>	[ 'id_penitipan_barang','table', 'idtable_fk', 'nama_barang','idlokasipenitipan_fk', 'idkategoripenitipan_fk','tanggal', 'spesifikasi','keterangan','kode','rfid'],
			'order'				=>	['id_penitipan_barang'	=>	'DESC'],
			'id'				=>	'id_penitipan_barang'
	];
	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/admin/page/penitipan_barang/index_page/index','role/admin/page/penitipan_barang/index_page/js'],$data);
	}

	public function add_page()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['lokasi_penitipan']	=	$this->my_where('lokasi_penitipan', [])->result_array();
		$data['kategori_penitipan']	=	$this->my_where('kategori_penitipan', [])->result_array();
		$this->my_view(['role/admin/page/penitipan_barang/add_page/index','role/admin/page/penitipan_barang/add_page/js'],$data);
	}

	public function edit_page($id)
	{
		if (isset($id)) {
				$data['param'] 		= 	$this->arr;
				$data['penitipan_barang'] = 	$this->my_where('penitipan_barang',['id_penitipan_barang'=>$id])->row_array();
				$this->my_view(['role/admin/page/penitipan_barang/edit_page/index','role/admin/page/penitipan_barang/edit_page/js'],$data);
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
			'path'	=>	"./include/media/foto_penitipan_barang/",
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

		if ($this->save_data('penitipan_barang', $data)) {
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
		if ($this->my_update('penitipan_barang',$data,['id_penitipan_barang'=>$_POST['id_penitipan_barang']])) {
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
        $_POST['frm']   =   $this->arr;
        $list           =   $this->mod_datatable->get_datatables();
        $data           =   array();
        $no             =   $_POST['start'];
        foreach ($list as $field) {
            $no++;
            $user 		=	$this->my_where($field['table'], ['id_'.$field['table'] => $field['idtable_fk']])->row_array();
            $lokasi 	=	$this->my_where('lokasi_penitipan', ['id_lokasi_penitipan'=>$field['idlokasipenitipan_fk']])->row_array();
            $row        =   array();
            $row[]      =   '<input type="checkbox" name="get-check" value="'.$field['id_penitipan_barang'].'"></input>';
            $row[]		=	date('d-m-Y', strtotime($field['tanggal']));
            $row[]		=	$field['kode'];
            $row[]		=	'<b>'.strtoupper($field['table']).'</b>'.' - '.strtoupper($user['nama']);
            $row[]		=	'<a href="penitipan_barang/edit_page/'.$field['id_penitipan_barang'].'" class="app-item"><b>'.strtoupper($field['nama_barang']).'</b></a>';
            $row[]		=	$lokasi['lokasi'];
            $row[]		=	$field['spesifikasi'];
            $row[]		=	$field['keterangan'];
            $row[]		=	'<img src="'.((!empty($field['foto'])) ? base_url('include/media/foto_penitipan_barang/'.$field['foto']) : base_url('include/media/system/no_image.jpg')).'" style="width : 50px;height: 50px;"></img>';
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