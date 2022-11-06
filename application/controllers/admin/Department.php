<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class department extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman department',
			'table'				=>	'department',
			'column'			=>	[ 'department'],
			'column_order'		=>	[ 'id_department','department'],
			'column_search'		=>	[ 'id_department','department'],
			'order'				=>	['id_department'	=>	'DESC'],
			'id'				=>	'id_department'
	];

	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/admin/page/department/index_page/index','role/admin/page/department/index_page/js'],$data);

	}

	public function add_page()
	{

		$data['param'] 		= 	$this->arr;
		$data['department'] = $this->my_where('department', [])->result_array();
		$this->my_view(['role/admin/page/department/add_page/index', 'role/admin/page/department/add_page/js'],$data);
	}

	public function edit_page($id)
	{
		if (isset($id)) {
				$data['param'] 		= 	$this->arr;
				$data['department'] = $this->my_where('department', [])->result_array();
				$data['department'] = 	$this->my_where('department',['id_department'=>$id])->row_array();
				$this->my_view(['role/admin/page/department/edit_page/index','role/admin/page/department/edit_page/js'],$data);
		} else {
			// $this->get_data();
		}
	}

	/*
		ADD DATA
	*/


	public function simpan_data()
	{	
		$data = [
			'department' => $_POST['department'],
		];
		if ($this->save_data('department', $data)) {
			$this->get_data();
		}	else 	{
			echo "error";
		}
	}


	/*
		EDIT DATA
	*/

	function update_data()
	{
		$dt = $this->arr;
		$data = [
			'department' => $_POST['department'],
		];
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
		$_POST['frm']   =   $this->arr;
        $list           =   $this->mod_datatable->get_datatables();
        $data           =   array();
        $no             =   $_POST['start'];
        foreach ($list as $field) {
            $no++;
            $row        =   array();
            $row[]      =   '<input type="checkbox" name="get-check" value="'.$field['id_department'].'"></input>';
            $row[]		=	$field['department'];
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
	
	
	
}