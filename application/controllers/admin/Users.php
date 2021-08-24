<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class users extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman users',
			'table'				=>	'users',
			'column'			=>	[ 'anggota_id','username', 'first_name','table'],
			'column_order'		=>	[ 'anggota_id','username', 'first_name','table'],
			'column_search'		=>	[ 'anggota_id','username', 'first_name','table'],
			'order'				=>	['id'	=>	'DESC'],
			'id'				=>	'id'
	];

	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		$this->display_view();

		/*if you need custom page*/

		// $data['account']	=	$this->get_user_account();
		// $this->my_view(['role/admin/page/siswa/index','role/admin/page/siswa/js_siswa'],$data);

	}

	public function add_page()
	{
		$data['account']			=	$this->get_user_account();
		$data['groups']				=	$this->my_where('groups',[])->result_array();
		$data['random_username']	=	"is_".rand(0,999999);
		$data['param']	=	$this->arr;
		$this->my_view(['role/admin/page/users/add_page/index','role/admin/page/users/add_page/js'],$data);
	}

	public function edit_page()
	{
		$dt = $this->arr;
		if (isset($_POST['send_data'])) {
			$data_edit=[];
				$data_set = $this->my_where($dt['table'],[$dt['id']=>$_POST['send_data']])->row_array();
				foreach ($dt['column_order'] as $keycolumn => $value_column) {
					$data_edit[$value_column]	= $data_set[$value_column];
				}
			$data['data_edit']	=	$data_edit;
			$this->display_view('edit_page', $data);
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
				'username'	=>	$_POST['username'],
				'password'	=>	$_POST['password'],
				'email'		=>	$_POST['username'].'@gmail.com',
				'additional_data'	=>	[
					'first_name'	=>	$_POST['identity_name'],
					'table'			=>	$_POST['table'],
					'anggota_id'	=>	$_POST['user']
				],
				'group'	=>	[$_POST['hak_akses']]
			];
			$this->ion_auth->register($data['username'], $data['password'], $data['email'], $data['additional_data'], $data['group']);
	}


	/*
		EDIT DATA
	*/

	function update_data()
	{
		$dt = $this->arr;
		$data=[];
		foreach ($dt['column'] as $key => $value) {
			$data[$value] = $_POST[$value];
		}
		if ($this->my_update($dt['table'],$data,[$dt['id']=>$_POST[$dt['id']]])) {
			$this->get_data();
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

	/*
		MANIPULATE DATA
	*/

	public function datatable()
	{
        echo json_encode($this->call_datatable($this->arr));
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
	public function get_user_data()
	{
		$send = $this->my_where($_POST['table'], ['id_'.$_POST['table'] => $_POST['id']])->row_array();
		echo json_encode($send);
	}
}