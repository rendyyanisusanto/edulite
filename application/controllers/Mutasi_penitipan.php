<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Mutasi_penitipan extends CI_Controller {
	
	/*
		CHANGE PAGE
	*/
	public function index()
	{
		$data = [];
		$this->load->view('role/mutasi_penitipan/index', $data);
	}

	function table_mutasi(){
		$data['mutasi_penitipan'] = [];
		$mutasi_penitipan	=	$this->db->get_where("mutasi_penitipan", ['tanggal' => date('Y-m-d')])->result_array();
		foreach ($mutasi_penitipan as $value) {
			$detail_penitipan = $this->db->get_where("penitipan_barang", ['id_penitipan_barang'=>$value['idpenitipanbarang_fk']])->row_array();
			$penitip = $this->db->get_where($detail_penitipan['table'], ['id_'.$detail_penitipan['table']=>$detail_penitipan['idtable_fk']])->row_array();
			if ($detail_penitipan['table'] == 'siswa') {
				$kelas = $this->db->get_where('kelas', ['id_kelas'=>$penitip['idkelas_fk']])->row_array();
			}
			$data['mutasi_penitipan'][]	=	[
				'mutasi_penitipan'=>$value,
				'detail_penitipan'=>$detail_penitipan,
				'kelas'		=>(($detail_penitipan['table'] == 'siswa') ? $kelas : ""),
				'penitip' => $penitip
			];
		}
		$this->load->view('role/mutasi_penitipan/table_mutasi', $data);
	}

	function data_peminjam(){
		$rfid = $_POST['rfid'];
		$send = [];
		$penitip = $this->db->get_where('penitipan_barang', ['rfid'=>$rfid]);

		if ($penitip->num_rows() > 0) {
			$data['penitipan_barang']= $penitip->row_array();
			$data['penitip'] = $this->db->get_where($data['penitipan_barang']['table'], ['id_'.$data['penitipan_barang']['table']=>$data['penitipan_barang']['idtable_fk']])->row_array();
			$mutasi_penitipan	=	$this->db->get_where('mutasi_penitipan', ['idpenitipanbarang_fk'=>$data['penitipan_barang']['id_penitipan_barang'], 'tanggal'=>date('Y-m-d')]);

			if ($mutasi_penitipan->num_rows() == 0) {
				$this->db->insert('mutasi_penitipan', [
					'idpenitipanbarang_fk' => $data['penitipan_barang']['id_penitipan_barang'],
					'tanggal'=>date('Y-m-d'),
					'pinjam'	=>	date('H:i:s')
				]);
			}else{
				$this->db->update('mutasi_penitipan', [
					'kembali'	=>	date('H:i:s')
				], [
					'idpenitipanbarang_fk' => $data['penitipan_barang']['id_penitipan_barang'],
					'tanggal'=>date('Y-m-d'),
				]);
			}

			$data['mutasi_penitipan'] = $mutasi_penitipan->row_array();
			$send = [
				'status' => 200,
				'data' => $data,
				'msg' => ($mutasi_penitipan->num_rows() == 0) ? "Berhasil Meminjam Barang \n (".$data['penitip']['nama'].")" : "Berhasil Mengembalikan Barang \n (".$data['penitip']['nama'].")"
			];
		}else{
			$send = [
				'status' => 500
			];
		}

		echo json_encode($send);
	}
}