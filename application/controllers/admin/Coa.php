<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Coa extends MY_Controller {
	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['induk_akun'] =	$this->my_where('induk_akun', [])->result_array();
		$this->my_view(['role/admin/page/coa/index_page/index','role/admin/page/coa/index_page/js'],$data);
	}
	function get_akun($id = "")
	{
		$data['akun']	=	$this->my_where('akun', ['idindukakun_fk'=>$_POST['id']])->result_array();
		$data['detail_akun']	=	$this->my_where('induk_akun', ['id_induk_akun'=>$_POST['id']])->row_array();
		$this->my_view(['role/admin/page/coa/index_page/proses_akun'],$data);
	}
	function simpan_data()
	{
		if (isset($_POST)) {
			$data = [
				'no_ref'			=>	$_POST['no_ref'],
				'nama'				=>	$_POST['nama'],
				'idindukakun_fk'	=>	$_POST['idindukakun_fk'],
				'saldo_normal'		=>	$_POST['saldo_normal'],
				'is_edit'			=> 	1
			];
			if ($this->save_data('akun', $data)) {
				
			}
		}
	}

	function update_data()
	{
		if (isset($_POST)) {
			$data = [
				'no_ref'			=>	$_POST['no_ref'],
				'nama'				=>	$_POST['nama'],
				'saldo_normal'		=>	$_POST['saldo_normal'],
			];
			if ($this->my_update('akun', $data, ['id_akun'=>$_POST['id_akun']])) {
				
			}
		}
	}

	function hapus_akun()
	{
		if(isset($_POST['id'])){
			$this->db->delete('akun', ['id_akun'=>$_POST['id']]);
		}
	}

	function cetak(){
		$data['akun'] =	$this->my_where('akun', [])->result_array();
	    $this->load->view('role/admin/page/coa/index_page/cetak', $data);
	}
}
