<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class mutasi_siswa extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman mutasi_siswa',
			'table'				=>	'mutasi_siswa',
			'column'			=>	['mutasi_siswa'],
			'column_order'		=>	[ 'id_mutasi_siswa'],
			'column_search'		=>	[ 'id_mutasi_siswa'],
			'order'				=>	['id_mutasi_siswa'	=>	'DESC'],
			'id'				=>	'id_mutasi_siswa'
	];

	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/admin/page/mutasi_siswa/index_page/index','role/admin/page/mutasi_siswa/index_page/js'],$data);
	}

	public function add_page()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;

		$this->my_view(['role/admin/page/mutasi_siswa/add_page/index','role/admin/page/mutasi_siswa/add_page/js'],$data);
	}

	public function edit_page($id)
	{
		if (isset($id)) {
				$data['param'] 		= 	$this->arr;
				$data['mutasi_siswa'] 	= 	$this->my_where('mutasi_siswa',['id_mutasi_siswa'=>$id])->row_array();
				$data['kondisi_mutasi_siswa']	=	$this->my_where('kondisi_mutasi_siswa', [])->result_array();
				$data['pramutasi_siswa']	=	$this->my_where('pramutasi_siswa', [])->result_array();
				$data['kelompok_mutasi_siswa']	=	$this->my_where('kelompok_mutasi_siswa', [])->result_array();
				$this->my_view(['role/admin/page/mutasi_siswa/edit_page/index','role/admin/page/mutasi_siswa/edit_page/js'],$data);
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
			'path'	=>	"./include/media/mutasi_siswa/",
			'filename' => 'foto',
		]);
		$data = [
			'mutasi_siswa' 					=> $_POST['mutasi_siswa'],
			'jumlah' 					=> $_POST['jumlah'],
			'idkelompokmutasi_siswa_fk' 		=> $_POST['idkelompokmutasi_siswa_fk'],
			'idkondisimutasi_siswa_fk' 		=> $_POST['idkondisimutasi_siswa_fk'],
			'spesifikasi' 				=> $_POST['spesifikasi'],
			'no_inventaris' 			=> $_POST['no_inventaris'],
			'tahun_pengadaan' 			=> $_POST['tahun_pengadaan'],
			'tanggal_pengadaan' 		=> $_POST['tanggal_pengadaan'],
			'idlokasi_fk' 				=> $_POST['idlokasi_fk'],
			'foto'						=>	((isset($file_arsip)) ? $file_arsip['file_name'] : ''),
		];

		if ($this->save_data('mutasi_siswa', $data)) {
			echo "Success";
		}
	}

	/*
		EDIT DATA
	*/

	function update_data()
	{
		$file_arsip = $this->save_media([
			'path'	=>	"./include/media/mutasi_siswa/",
			'filename' => 'file_arsip',
		]);
		$data = [
			'mutasi_siswa' 					=> $_POST['mutasi_siswa'],
			'jumlah' 					=> $_POST['jumlah'],
			'idkelompokmutasi_siswa_fk' 		=> $_POST['idkelompokmutasi_siswa_fk'],
			'idkondisimutasi_siswa_fk' 		=> $_POST['idkondisimutasi_siswa_fk'],
			'spesifikasi' 				=> $_POST['spesifikasi'],
			'no_inventaris' 			=> $_POST['no_inventaris'],
			'tahun_pengadaan' 			=> $_POST['tahun_pengadaan'],
			'tanggal_pengadaan' 		=> $_POST['tanggal_pengadaan'],
			'idlokasi_fk' 				=> $_POST['idlokasi_fk'],
			'foto'	=>	((isset($file_arsip)) ? $file_arsip['file_name'] : $_POST['file_arsip_before']),
		];
		if ($this->my_update('mutasi_siswa',$data,['id_mutasi_siswa'=>$_POST['id_mutasi_siswa']])) {
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

	
	public function datatable()
	{
		
        $_POST['frm']   =   $this->arr;
        $list           =   $this->mod_datatable->get_datatables();
        $data           =   array();
        $no             =   $_POST['start'];
        foreach ($list as $field) {
            $no++;
            $row        =   array();
            $row[]      =   '<input type="checkbox" name="get-check" value="'.$field['id_mutasi_siswa'].'"></input>';
            $row[]		=	'<a href="mutasi_siswa/edit_page/'.$field['id_mutasi_siswa'].'" class="app-item"><b>'.strtoupper($field['no_inventaris']).'</b></a>';
            
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