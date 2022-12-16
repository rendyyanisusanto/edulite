<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class jenis_penerimaan extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman jenis_penerimaan',
			'table'				=>	'jenis_penerimaan',
			'column'			=>	['nama'],
			'column_order'		=>	[ 'id_jenis_penerimaan','nama'],
			'column_search'		=>	[ 'id_jenis_penerimaan','nama'],
			'order'				=>	['id_jenis_penerimaan'	=>	'DESC'],
			'id'				=>	'id_jenis_penerimaan'
	];

	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', [])->result_array();
		$this->my_view(['role/admin/page/jenis_penerimaan/index_page/index','role/admin/page/jenis_penerimaan/index_page/js'],$data);
	}

	public function add_page()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['kas']		=	$this->my_where('akun', ['idindukakun_fk'=>1])->result_array();
		$data['pendapatan']		=	$this->db->where('idindukakun_fk', 7)->or_where('idindukakun_fk', 8)->get('akun')->result_array();
		$data['diskon']			=	$this->my_where('akun', ['idindukakun_fk'=>6])->result_array();
		$data['piutang']		=	$this->my_where('akun', ['idindukakun_fk'=>1])->result_array();
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', [])->result_array();
		$this->my_view(['role/admin/page/jenis_penerimaan/add_page/index','role/admin/page/jenis_penerimaan/add_page/js'],$data);
	}
	
	public function edit_page($id)
	{
		if (isset($id)) {
				$data['param'] 			= 	$this->arr;
				$data['data_edit']		=	$this->my_where('jenis_penerimaan', ['id_jenis_penerimaan'=>$id])->row_array();
				$data['kas']			=	$this->my_where('akun', ['idindukakun_fk'=>1])->result_array();
				$data['pendapatan']		=	$this->db->where('idindukakun_fk', 7)->or_where('idindukakun_fk', 8)->get('akun')->result_array();
				$data['diskon']			=	$this->my_where('akun', ['idindukakun_fk'=>6])->result_array();
				$data['piutang']		=	$this->my_where('akun', ['idindukakun_fk'=>1])->result_array();
				$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', [])->result_array();
				$this->my_view(['role/admin/page/jenis_penerimaan/edit_page/index','role/admin/page/jenis_penerimaan/edit_page/js'],$data);
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
			'nama' 						=> $_POST['nama'],
			'kas' 						=> $_POST['kas'],
			'pendapatan' 				=> $_POST['pendapatan'],
			'diskon' 					=> $_POST['diskon'],
			'piutang' 					=> $_POST['piutang'],
			'template_nota' 			=> $_POST['template_nota'],
			'idtahunajaran_fk' 			=> $_POST['idtahunajaran_fk'],
		];

		if ($this->save_data('jenis_penerimaan', $data)) {
			echo "Success";
		}
	}
	
	/*
		EDIT DATA
	*/

	function update_data()
	{
		$data = [
			'nama' 						=> $_POST['nama'],
			'kas' 						=> $_POST['kas'],
			'pendapatan' 				=> $_POST['pendapatan'],
			'diskon' 					=> $_POST['diskon'],
			'piutang' 					=> $_POST['piutang'],
			'template_nota' 			=> $_POST['template_nota'],
			'idtahunajaran_fk' 			=> $_POST['idtahunajaran_fk'],
		];
		if ($this->my_update('jenis_penerimaan',$data,['id_jenis_penerimaan'=>$_POST['id_jenis_penerimaan']])) {
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
		if ($_POST['idtahunajaran_fk'] != '') {
			$this->db->where('idtahunajaran_fk', $_POST['idtahunajaran_fk']);
		}
        $_POST['frm']   =   $this->arr;
        $list           =   $this->mod_datatable->get_datatables();
        $data           =   array();
        $no             =   $_POST['start'];
        foreach ($list as $field) {
            $no++;
            $row        =   array();
            $tahun_ajaran 		=	$this->my_where('tahun_ajaran', ['id_tahun_ajaran'=>$field['idtahunajaran_fk']])->row_array();
            $kas 		=	$this->my_where('akun', ['id_akun'=>$field['kas']])->row_array();
            $pendapatan 		=	$this->my_where('akun', ['id_akun'=>$field['pendapatan']])->row_array();
            $piutang 		=	$this->my_where('akun', ['id_akun'=>$field['piutang']])->row_array();
            $diskon 		=	$this->my_where('akun', ['id_akun'=>$field['diskon']])->row_array();
            $row[]      =   '<input type="checkbox" name="get-check" value="'.$field['id_jenis_penerimaan'].'"></input>';
            $row[]		=	!empty($field['nama']) ? $field['nama'] : '-';
            $row[]		=	'<ul><li>Kas : <b>('.$kas['no_ref'].') '.$kas['nama'].'</b></li>'.
            				'<li>Pendapatan : <b>('.$pendapatan['no_ref'].') '.$pendapatan['nama'].'</b></li>'.
            				'<li>piutang : <b>('.$piutang['no_ref'].') '.$piutang['nama'].'</b></li>'.
            				'<li>diskon : <b>('.$diskon['no_ref'].') '.$diskon['nama'].'</b></li>'.
            				'</ul>'
            ;
            $row[]		=	!empty($field['template_nota']) ? $field['template_nota'] : '-';
            $row[]		=	$tahun_ajaran['tahun_ajaran'];
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

	public function print_kartu($id='')
	{
		$data['siswa'] = $this->my_where('v_siswa_jurusan', ['id_siswa' => $id])->row_array();
		$jenis_pelanggaran = $this->my_where('jenis_pelanggaran',[])->result_array();
		$data_pelanggaran = [];
		foreach ($jenis_pelanggaran as $key => $value) {
			$jenis_penerimaan = $this->my_where('v_jenis_penerimaan', ['idsiswa_fk'=>$id, 'id_jenis_pelanggaran'=>$value['id_jenis_pelanggaran']])->result_array();
			$data_pelanggaran[] = 
			[
				'jenis_pelanggaran' => $value,
				'data_jenis_penerimaan' => $jenis_penerimaan
			]; 
		}
		$data['pelanggaran'] = $data_pelanggaran;
		$this->my_view(['role/admin/page/jenis_penerimaan/print_page/cetak_kartu_kendali'],$data);
	}

	public function get_poin_pelanggaran($value='')
	{

	}
}