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
		// $this->display_view();

		/*if you need custom page*/

		$data['param'] 		= 	$this->arr;
		$data['account']	=	$this->get_user_account();
		$this->my_view(['role/admin/page/users/index_page/index','role/admin/page/users/index_page/js'],$data);

	}

	public function add_page()
	{
		$data['account']			=	$this->get_user_account();
		$data['groups']				=	$this->my_where('groups',[])->result_array();
		$data['random_username']	=	"is_".rand(0,999999);
		$data['param']	=	$this->arr;
		$this->my_view(['role/admin/page/users/add_page/index','role/admin/page/users/add_page/js'],$data);
	}

	public function bulk_page()
	{
		$data['account']			=	$this->get_user_account();
		$data['groups']				=	$this->my_where('groups',[])->result_array();
		$data['random_username']	=	"is_".rand(0,999999);
		$data['param']				=	$this->arr;
		$data['kelas']				=	$this->my_where('kelas', [])->result_array();
		$this->my_view(['role/admin/page/users/bulk_page/index','role/admin/page/users/bulk_page/js'],$data);
	}

	public function edit_page($id)
	{
		if (isset($id)) {
				$data['param'] 		= 	$this->arr;
				$data['users'] 		= 	$this->my_where('users',['id'=>$id])->row_array();
				$data['id']			=	$id;
				$data['groups']				=	$this->my_where('groups',[])->result_array();
				$data['users_groups']		=	$this->my_where('users_groups', ['user_id'=>$id])->row_array();
				$this->my_view(['role/admin/page/users/edit_page/index','role/admin/page/users/edit_page/js'],$data);
		} else {
			$this->get_data();
		}
	}

	/*
		ADD DATA
	*/
	function bulk_proses(){

		$table = $_POST['table'];
		$hak_akses = $_POST['hak_akses'];
		$kelas =	$_POST['idkelas_fk'];


		$data['kelas']				=	$this->my_where('kelas', ['id_kelas'=>$kelas])->row_array();
		$data['siswa']	=	$this->my_where('siswa', [
			'idkelas_fk'	=> $kelas
		])->result_array();

		$this->my_view(['role/admin/page/users/bulk_page/proses'],$data);
	}

	public function save_bulk_proses()
	{
		foreach ($_POST['data'] as $key => $value) {
			$data = [
				'username'	=>	$value['username'],
				'password'	=>	$value['password'],
				'email'		=>	$value['username'].'@gmail.com',
				'additional_data'	=>	[
					'first_name'	=>	$value['username'],
					'table'			=>	'siswa',
					'c'			=>	((isset($_POST['c'])) ? 1 : 0),
					'r'			=>	((isset($_POST['r'])) ? 1 : 0),
					'u'			=>	((isset($_POST['u'])) ? 1 : 0),
					'd'			=>	((isset($_POST['d'])) ? 1 : 0),
					'anggota_id'	=>	$value['id_siswa']
				],
				'group'	=>	[2]
			];
			$this->ion_auth->register($data['username'], $data['password'], $data['email'], $data['additional_data'], $data['group']);
		}

		echo json_encode($_POST);
	}

	public function simpan_data()
	{	
			$data = [
				'username'	=>	$_POST['username'],
				'password'	=>	$_POST['password'],
				'email'		=>	$_POST['username'].'@gmail.com',
				'additional_data'	=>	[
					'first_name'	=>	$_POST['identity_name'],
					'table'			=>	$_POST['table'],
					'c'			=>	((isset($_POST['c'])) ? 1 : 0),
					'r'			=>	((isset($_POST['r'])) ? 1 : 0),
					'u'			=>	((isset($_POST['u'])) ? 1 : 0),
					'd'			=>	((isset($_POST['d'])) ? 1 : 0),
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
		$id = $_POST['id'];
		$data = [
				'username'	=>	$_POST['username'],
				'first_name'	=>	$_POST['identity_name'],
					'c'			=>	((isset($_POST['c'])) ? 1 : 0),
					'r'			=>	((isset($_POST['r'])) ? 1 : 0),
					'u'			=>	((isset($_POST['u'])) ? 1 : 0),
					'd'			=>	((isset($_POST['d'])) ? 1 : 0),
			];
		if (!empty($_POST['password'])) {
				$data['password']	=	$_POST['password'];
		}
			$this->ion_auth->update($id, $data);

			$this->my_update('users_groups', ['group_id'	=>	$_POST['hak_akses']], ['user_id'=>$id]);
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
		$_POST['frm']   =   $this->arr;
        $list           =   $this->mod_datatable->get_datatables();
        $data           =   array();
        $no             =   $_POST['start'];
        foreach ($list as $field) {
            $no++;
            $row        =   array();
            $users_groups 		=	$this->my_where("users_groups", ['user_id'=>$field['id']])->row_array();
            $groups 			=	$this->my_where("groups", ['id'=>$users_groups['group_id']])->row_array();
            $row[]      =   '<input type="checkbox" name="get-check" value="'.$field['id'].'"></input>';
            $row[]      =   $field['anggota_id'];
            $row[]		=	$field['username'];
            $row[]		=	$field['first_name'];
            $row[]		=	strtoupper($groups['name']);
            $row[]		=	($field['c'] == 1) ? "<b class='text-success'>YES</b>" :"<b class='text-danger'>NO</b>";
            $row[]		=	($field['r'] == 1) ? "<b class='text-success'>YES</b>" :"<b class='text-danger'>NO</b>";
            $row[]		=	($field['u'] == 1) ? "<b class='text-success'>YES</b>" :"<b class='text-danger'>NO</b>";
            $row[]		=	($field['d'] == 1) ? "<b class='text-success'>YES</b>" :"<b class='text-danger'>NO</b>";
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