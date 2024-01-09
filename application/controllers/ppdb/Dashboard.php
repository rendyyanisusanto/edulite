<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends MY_Controller {
	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['ijin_siswa']	=	$this->db->query('select *, (select nama from siswa where id_siswa=idsiswa_fk) as nama, (select idkelas_fk from siswa where id_siswa=idsiswa_fk) as idkelas_fk,(select jenis_ijin from jenis_ijin where id_jenis_ijin=idjenisijin_fk) as jenis_ijin,(select color from jenis_ijin where id_jenis_ijin=idjenisijin_fk) as c_jenis_ijin, (select kelas from kelas where kelas.id_kelas=idkelas_fk) as kelas from ijin_siswa where idoperator_fk = '.$data['account']['anggota_id'].' Order by id_ijin_siswa DESC limit 5 ')->result_array();
		$data['ijin_hari_ini']	=	$this->db->query("select * from ijin_siswa where tanggal = '".date('Y-m-d')."' and idoperator_fk =".$data['account']['anggota_id'])->num_rows();
		$data['total_ijin']	=	$this->db->query("select * from ijin_siswa where idoperator_fk =".$data['account']['anggota_id'])->num_rows();
		$this->my_view(['role/ppdb/page/dashboard/index_page/index','role/ppdb/page/dashboard/index_page/js'],$data);
	}
	
	
}
