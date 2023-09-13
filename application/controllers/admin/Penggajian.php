<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class penggajian extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman penggajian',
			'table'				=>	'penggajian',
			'column'			=>	['bulan','tahun', 'keterangan'],
			'column_order'		=>	[ 'id_penggajian','bulan','tahun', 'keterangan'],
			'column_search'		=>	[ 'id_penggajian','bulan','tahun', 'keterangan'],
			'order'				=>	['id_penggajian'	=>	'DESC'],
			'id'				=>	'id_penggajian',
			'parents_link'		=>	'role/admin/page/penggajian'
	];

	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', [])->result_array();
		$this->my_view(['role/admin/page/penggajian/index_page/index','role/admin/page/penggajian/index_page/js'],$data);
	}


	function proses(){
		$id_template_penggajian = $_POST['idtemplate'];
		$data['param'] 		= 	$this->arr;
		$data['guru']		=	$this->my_where('guru', ['is_active'=>1])->result_array();

		$data['komponen_penggajian_debit']	=	$this->my_where('v_komponen_penggajian', ['idtemplatepenggajian_fk'=>$id_template_penggajian, 'saldo'=>'D'])->result_array();
		$data['komponen_penggajian_kredit']	=	$this->my_where('v_komponen_penggajian', ['idtemplatepenggajian_fk'=>$id_template_penggajian, 'saldo'=>'K'])->result_array();
		$this->my_view([$data['param']['parents_link'].'/add_page/proses'],$data);
	}

	function proses_index(){

		$data['param'] 		= 	$this->arr;
		$bulan			=	date_format(date_create($_POST['bulan']), 'm');
		$tahun			=	date_format(date_create($_POST['bulan']), 'Y');
		$data['guru']	=	$this->db->query("select *, (select count(*) from penggajian where idguru_fk=id_guru and bulan=".$bulan." and tahun=".$tahun.") as status_penggajian from guru where is_active = 1")->result_array();
		$data['bulan']	=	$bulan;
		$data['tahun']	=	$tahun;
		$this->my_view([$data['param']['parents_link'].'/index_page/proses'],$data);
	}

	function modal_proses(){
		
		$data['param'] 		= 	$this->arr;
		$data['guru']		=	$this->my_where('guru', ['id_guru'=>$_POST['id']])->row_array();
		$data['post']		=	$_POST;
		$id_template_penggajian = $this->my_where('template_penggajian', ['is_active'=>1])->row_array()['id_template_penggajian'];
		$data['komponen_penggajian_debit']	=	$this->my_where('v_komponen_penggajian', ['idtemplatepenggajian_fk'=>$id_template_penggajian, 'saldo'=>'D'])->result_array();
		$data['komponen_penggajian_kredit']	=	$this->my_where('v_komponen_penggajian', ['idtemplatepenggajian_fk'=>$id_template_penggajian, 'saldo'=>'K'])->result_array();
		
		$this->my_view([$data['param']['parents_link'].'/index_page/proses_modal'],$data);
	}
	public function add_page()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['template_penggajian']		=	$this->my_where('template_penggajian', [])->result_array();
		$this->my_view(['role/admin/page/penggajian/add_page/index','role/admin/page/penggajian/add_page/js'],$data);
	}
	
	public function edit_page($id)
	{
		if (isset($id)) {
				$data['param'] 			= 	$this->arr;
				$data['data_edit']		=	$this->my_where('penggajian', ['id_penggajian'=>$id])->row_array();
				$data['kas']			=	$this->my_where('akun', ['idindukakun_fk'=>1])->result_array();
				$data['pendapatan']		=	$this->db->where('idindukakun_fk', 7)->or_where('idindukakun_fk', 8)->get('akun')->result_array();
				$data['diskon']			=	$this->my_where('akun', ['idindukakun_fk'=>6])->result_array();
				$data['piutang']		=	$this->my_where('akun', ['idindukakun_fk'=>1])->result_array();
				$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', [])->result_array();
				$this->my_view(['role/admin/page/penggajian/edit_page/index','role/admin/page/penggajian/edit_page/js'],$data);
		} else {
			$this->get_data();
		}
	}

	function print_nota($id='', $bulan='', $tahun = '')
	{
		$data['guru']	=	$this->my_where('guru', ['id_guru'=>$id])->row_array();
		$data['penggajian']	=	$this->my_where('penggajian', ['idguru_fk'=>$id, 'bulan'=>$bulan, 'tahun'=>$tahun])->row_array();
		$data['detail_komponen_penggajian_deb']	=	$this->my_where('v_detail_komponen_penggajian', [ 'idpenggajian_fk'=>$data['penggajian']['id_penggajian'], 'saldo'=>'D'])->result_array();
		$data['detail_komponen_penggajian_kred']	=	$this->my_where('v_detail_komponen_penggajian', [ 'idpenggajian_fk'=>$data['penggajian']['id_penggajian'], 'saldo'=>'K'])->result_array();
		$data['detail_tambahan_penggajian_deb']	=	$this->my_where('detail_tambahan_penggajian', [ 'idpenggajian_fk'=>$data['penggajian']['id_penggajian'], 'saldo'=>'D'])->result_array();
		$data['detail_tambahan_penggajian_kred']	=	$this->my_where('detail_tambahan_penggajian', [ 'idpenggajian_fk'=>$data['penggajian']['id_penggajian'], 'saldo'=>'K'])->result_array();
		$data['bulan']	=	$bulan;
		$data['tahun']	=	$tahun;
		$this->load->view('role/admin/page/penggajian/print/index', $data);
	}
	/*
		ADD DATA
	*/



	public function simpan_data()
	{	


		$res = [
			'status' => 500,
			'msg' => 'error'
		];

		$data = [
			'bulan' 						=> $_POST['bulan'],
			'tahun' 						=> $_POST['tahun'],
			'idguru_fk' 					=> $_POST['idguru_fk'],
			'total' 						=> $_POST['total'],
		];

		if ($this->save_data('penggajian', $data)) {
			$detail_penggajian = $this->my_where('penggajian', [
				'bulan' 						=> $_POST['bulan'],
				'tahun' 						=> $_POST['tahun'],
				'idguru_fk' 					=> $_POST['idguru_fk'],
			])->row_array();

				foreach ($_POST['data']['komponen'] as $value_komponen) {
					
					$this->save_data('detail_komponen_penggajian', [
						'idkomponenpenggajian_fk' => $value_komponen['idkomponenpenggajian_fk'],
						'jumlah' => $value_komponen['jumlah'],
						'idpenggajian_fk' => $detail_penggajian['id_penggajian'],
						'keterangan' => $value_komponen['keterangan'],
						'sum' => (isset($value_komponen['sum'])) ? $value_komponen['sum'] : 1 ,
						'total' => $value_komponen['total'],
					]);
				}
				foreach ($_POST['data']['komponen_kredit'] as $value_komponen_kredit) {
					
					$this->save_data('detail_komponen_penggajian', [
						'idkomponenpenggajian_fk' => $value_komponen_kredit['idkomponenpenggajian_fk'],
						'jumlah' => $value_komponen_kredit['jumlah'],
						'idpenggajian_fk' => $detail_penggajian['id_penggajian'],
						'keterangan' => $value_komponen_kredit['keterangan'],
						'sum' =>  1 ,
						'total' => $value_komponen_kredit['jumlah'],
					]);
				}

				if (isset($_POST['data']['komponen_tambahan_debit'])) {
					foreach ($_POST['data']['komponen_tambahan_debit'] as $value_komponen_tambahan_debit) {
						$this->save_data('detail_tambahan_penggajian', [
							'nama' => $value_komponen_tambahan_debit['nama'],
							'jumlah' => $value_komponen_tambahan_debit['jumlah'],
							'idpenggajian_fk' => $detail_penggajian['id_penggajian'],
							'keterangan' => $value_komponen_tambahan_debit['keterangan'],
							'saldo' =>  'D' 
						]);
					}
				}
				if (isset($_POST['data']['komponen_tambahan_kredit'])) {
					foreach ($_POST['data']['komponen_tambahan_kredit'] as $value_komponen_tambahan_kredit) {
						$this->save_data('detail_tambahan_penggajian', [
							'nama' => $value_komponen_tambahan_kredit['nama'],
							'jumlah' => $value_komponen_tambahan_kredit['jumlah'],
							'idpenggajian_fk' => $detail_penggajian['id_penggajian'],
							'keterangan' => $value_komponen_tambahan_kredit['keterangan'],
							'saldo' =>  'K' 
						]);
					}
				}
				$res = [
					'status' => 200,
					'msg' => 'Berhasil menambahkan data'
				];
			}

		echo json_encode($res);
	}

	function batal(){
		if ($this->db->delete('penggajian', [
			'idguru_fk' => $_POST['id'],
			'bulan' => $_POST['bulan'],
			'tahun' => $_POST['tahun']
		])) {
			$res = [
					'status' => 200,
					'msg' => 'Berhasil membatalkan data'
				];	

			echo json_encode($res);
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
		if ($this->my_update('penggajian',$data,['id_penggajian'=>$_POST['id_penggajian']])) {
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
            $row[]      =   '<input type="checkbox" name="get-check" value="'.$field['id_penggajian'].'"></input>';
            $row[]		=	$field['bulan'].'/'.$field['tahun'];
            $row[]		=	!empty($field['keterangan']) ? $field['keterangan'] : '-';
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
			$penggajian = $this->my_where('v_penggajian', ['idsiswa_fk'=>$id, 'id_jenis_pelanggaran'=>$value['id_jenis_pelanggaran']])->result_array();
			$data_pelanggaran[] = 
			[
				'jenis_pelanggaran' => $value,
				'data_penggajian' => $penggajian
			]; 
		}
		$data['pelanggaran'] = $data_pelanggaran;
		$this->my_view(['role/admin/page/penggajian/print_page/cetak_kartu_kendali'],$data);
	}

	public function get_poin_pelanggaran($value='')
	{

	}
}