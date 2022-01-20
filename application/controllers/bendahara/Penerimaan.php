<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Penerimaan extends MY_Controller {

	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['jenis_penerimaan'] =	$this->my_where('jenis_penerimaan', [])->result_array();
		$this->my_view(['role/bendahara/page/penerimaan/index_page/index','role/bendahara/page/penerimaan/index_page/js'],$data);
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
			$data['tanggungan'] =	$this->my_where('v_jenis_penerimaan', ['idsiswa_fk'=>$_POST['id']])->result_array();
			$data['siswa']		=	$this->my_where('v_siswa_jurusan', ['id_siswa'=>$_POST['id']])->row_array();
			$data['jenis_penerimaan']	=	$this->my_where('jenis_penerimaan',[])->result_array();
			$this->my_view(['role/bendahara/page/penerimaan/index_page/proses_penerimaan','role/bendahara/page/penerimaan/index_page/list_tanggungan'],$data);
		}
	}
	function save_transaksi()
	{
		$data = [
			'idsiswa_fk'					=> $_POST['idsiswa_fk'],
			'idjenispenerimaan_fk'			=> $_POST['idjenispenerimaan_fk'],
			'metode_pembayaran'				=> $_POST['metode_pembayaran'],
			'tanggal'						=> $_POST['tanggal'],
			'catatan'						=> $_POST['catatan'],
			'jumlah'						=> $_POST['jumlah'],
		];

		if ($this->save_data('penerimaan', $data)) {
			
		}
	}
}
	