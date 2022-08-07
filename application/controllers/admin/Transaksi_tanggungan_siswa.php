<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class transaksi_tanggungan_siswa extends MY_Controller {
	
	public $arr = [
			'title'				=>	'Halaman transaksi_tanggungan_siswa',
			'table'				=>	'transaksi_tanggungan_siswa',
			'column'			=>	[ 'invoice'],
			'column_order'		=>	[ 'id_transaksi_tanggungan_siswa','invoice'],
			'column_search'		=>	[ 'id_transaksi_tanggungan_siswa','invoice'],
			'order'				=>	['id_transaksi_tanggungan_siswa'	=>	'DESC'],
			'id'				=>	'id_transaksi_tanggungan_siswa'
	];

	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		/*if you need custom page*/

		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/admin/page/transaksi_tanggungan_siswa/index_page/index','role/admin/page/transaksi_tanggungan_siswa/index_page/js'],$data);

	}

	public function add_page()
	{

		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;

		$data['akun_kas']		=	$this->my_where('akun', ['idindukakun_fk'=>1])->result_array();
		$data['akun_beban']		=	$this->db->where('idindukakun_fk', 9)->or_where('idindukakun_fk', 10)->get('akun')->result_array();
		$this->my_view(['role/admin/page/transaksi_tanggungan_siswa/add_page/index','role/admin/page/transaksi_tanggungan_siswa/add_page/js'],$data);
	}

	public function edit_page($id)
	{
		if (isset($id)) {
				$data['param'] 						= 	$this->arr;
				$data['akun_kas']					=	$this->my_where('akun', ['idindukakun_fk'=>1])->result_array();
				$data['akun_beban']					=	$this->db->where('idindukakun_fk', 9)->or_where('idindukakun_fk', 10)->get('akun')->result_array();
				$data['transaksi_tanggungan_siswa'] 			= 	$this->my_where('transaksi_tanggungan_siswa',['id_transaksi_tanggungan_siswa'=>$id])->row_array();
				$data['detail_transaksi_tanggungan_siswa']	=	$this->my_where('detail_transaksi_tanggungan_siswa', ['idpengeluaranlain_fk'=>$id])->result_array();
				$this->my_view(['role/admin/page/transaksi_tanggungan_siswa/edit_page/index','role/admin/page/transaksi_tanggungan_siswa/edit_page/js'],$data);
		} else {
			$this->get_data();
		}
	}
	/*
		ADD DATA
	*/


	public function simpan_data()
	{	
		// $foto = $this->save_media([
		// 	'path'	=>	"./include/media/transaksi_tanggungan_siswa/",
		// 	'filename' => 'foto',
		// ]);
		
		$data = [
			'trans_code' 	=>$_POST['trans_code'],
			'tanggal'		=>$_POST['tanggal'],
			'keterangan'	=>$_POST['keterangan'],
			'jenis'			=>	$_POST['jenis'],
			'jenis_kas'			=>	$_POST['jenis_kas'],
			'total'			=>	$_POST['total']
		];
		if ($this->save_data('transaksi_tanggungan_siswa', $data)) {
			$transaksi_tanggungan_siswa = $this->my_where('transaksi_tanggungan_siswa', $data)->row_array();

			foreach ($_POST['detail'] as $key => $value) {
				$data_detail = [
					'idpengeluaranlain_fk'	=>	$transaksi_tanggungan_siswa['id_transaksi_tanggungan_siswa'],
					'keterangan'			=>	$value['keterangan'],
					'jumlah'				=>	$value['jumlah']
				];
				$this->save_data('detail_transaksi_tanggungan_siswa', $data_detail);
			}
		}	else 	{
			echo "error";
		}
		echo json_encode($_POST);
	}


	/*
		EDIT DATA
	*/

	function update_data()
	{
		$data = [
			'trans_code' 	=>$_POST['trans_code'],
			'tanggal'		=>$_POST['tanggal'],
			'keterangan'	=>$_POST['keterangan'],
			'jenis'			=>	$_POST['jenis'],
			'jenis_kas'			=>	$_POST['jenis_kas'],
			'total'			=>	$_POST['total']
		];
		if ($this->my_update('transaksi_tanggungan_siswa', $data, ['id_transaksi_tanggungan_siswa' => $_POST['id_transaksi_tanggungan_siswa']])) {
			$this->db->delete('detail_transaksi_tanggungan_siswa', ['idpengeluaranlain_fk' => $_POST['id_transaksi_tanggungan_siswa']]);
			$transaksi_tanggungan_siswa = $this->my_where('transaksi_tanggungan_siswa', $data)->row_array();

			foreach ($_POST['detail'] as $key => $value) {
				$data_detail = [
					'idpengeluaranlain_fk'	=>	$transaksi_tanggungan_siswa['id_transaksi_tanggungan_siswa'],
					'keterangan'			=>	$value['keterangan'],
					'jumlah'				=>	$value['jumlah']
				];
				$this->save_data('detail_transaksi_tanggungan_siswa', $data_detail);
			}
		}	else 	{
			echo "error";
		}
		echo json_encode($_POST);
	}

	/*
		DELETE DATA
	*/

	function hapus()
	{
		foreach ($_POST['data_get'] as $key => $value) {
			$this->db->delete('transaksi_tanggungan_siswa',['id_transaksi_tanggungan_siswa'=>$value]);
		}
		
	}

	/*
		PRINT DATA
	*/
		
		function cetak_page()
		{
			$dt = $this->arr;
			$data['sum_selected']=0;
			if (isset($_POST['send_data'])) {
				$data_edit=[];
				foreach ($_POST['send_data'] as $key => $value) {
					$data_set = $this->my_where($dt['table'],[$dt['id']=>$value])->row_array();
					foreach ($dt['column_order'] as $keycolumn => $value_column) {
					$data_edit[$value_column]	= $data_set[$value_column];
					}
				}
				$data['data_edit']			=	$data_edit;
				$data['sum_selected']		=	count($_POST['send_data']);
				$data['input_selected']		=	implode(',', $_POST['send_data']);
			}

			$this->display_view('print_page', $data);
			// $this->my_view(['role/admin/page/guru/print_page/index','role/admin/page/guru/print_page/js'],$data);
			
		}

		function cetak_data()
		{
			$dt = $this->arr;
			$this->my_delete_file(FCPATH.'/include/pdf_temp');

			$data=[];
			$where_send		=	[];

			if ($_POST['data_yg_dicetak']	==	'manual') {
				foreach ($dt['column'] as $key => $value) {
					if (!empty($_POST['f_'.$value])) {
						$where_send[$value]	=	$_POST['f_'.$value];
					}
				}
			} else if($_POST['data_yg_dicetak']	==	'pilih')
			{
				$data_selected = explode(',', $_POST['input_selected']);
				foreach ($data_selected as $key => $value) {
					$this->db->or_where($dt['id'], $value);
				}
			}

			$data_set = $this->my_where($dt['table'],$where_send);
			
			$url	=	($_POST['laporan']	==	'data')	?	'role/core_page/print_page/cetak_data'	:	'role/core_page/print_page/cetak_kartu';
			
		    if ($_POST['tipe_laporan'] == 'pdf') {

		    	$param	=	[
	                'url'			=>	$url,
	                'customPaper'	=>	array(0,0,381.89,595.28),
	                'data_value'	=>	[
	                	"data"		=>	$data_set->result_array(),
	                	"param"		=>	$dt
	                ],
	                'name'			=>	md5(rand(0,9999999)),
	                'pos' 			=> 'landscape'
	            ];

	            $this->my_pdf($param);

		    }
		    
		    else if($_POST['tipe_laporan'] == 'excel')

		    {
		    	
	            $param  =   [
	                'filename'			=>		'Jadwal Kegiatan Sekolah',
	                'data_obj'			=>		$data_set->result(),
	                'header_table'		=>		$dt['column'],
	                'print_field'		=>		$dt['column']
	            ];

	            $this->my_export_excel($param);
	        
		    }

		}

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

            $row[]      =   '<input type="checkbox" name="get-check" value="'.$field['id_transaksi_tanggungan_siswa'].'"></input>';
            $row[]		=	date_format(date_create($field['tanggal']), 'd-M-Y');
            $row[]		=	'<b class="text-danger">'.$field['invoice'].'</b>';
            $row[]		=	$field['catatan'];
            $row[]		=	'<button class="btn btn-success btn-dtl btn-sm" data-id="'.$field['id_transaksi_tanggungan_siswa'].'" type="button" ><i class="icon-eye"></i></button>';
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

	public function get_produk_add_cart($kode='')
	{
		$produk = $this->my_where('produk', ['kode'=>$kode])->row_array();
		$rand = rand(0,999999);
		$data = '<tr id="tr'.$rand.'">';
		$data .= '<td><button class="btn btn-xs btn-danger btn-dl-item" data-rowid="'.$rand.'" type="button"><i class="icon-trash"></i></button></td>';
		$data .= '<td>'.$produk['kode'].'</td>';
		$data .= '<td>'.$produk['nama'].'</td>';
		$data .= '<td>'.(($produk['stok'] > $produk['stok_limit']) ? "<b class='text-success'>".$produk['stok']."</b>" : "<b class='text-danger'>".$produk['stok']."</b>").'</td>';
		$data .= '<td><input type="number" name="produk['.$rand.'][qty]" class="form-control"></input>
		<input type="hidden" name="produk['.$rand.'][idproduk_fk]" value="'.$produk['id_produk'].'" class="form-control"></input>
		</td>';
		$data .= '</tr>';

		echo $data;
	}

	public function get_detail($id='')
	{
		
		$detail		=	$this->my_where('detail_transaksi_tanggungan_siswa',['idpengeluaranlain_fk' => $id])->result_array();

		$send = '<table class="table table-framed table-xs">';
		$send .= '<thead>';
		$send .= '<tr>';
		$send .= '	<th>Keterangan</th>';
		$send .= '	<th>Jumlah</th>';
		$send .= '</tr>';
		$send .= '</thead>';
		$send .= '<tbody>';

			foreach ($detail as $key => $value) {
				$send .= '<tr>';
				$send .= '<td>'.$value['keterangan'].'</td>';
				$send .= '<td>Rp. '.number_format($value['jumlah'],0,'','.').'</td>';
				$send .= '</tr>';
			}

		$send .= '</tbody>';
		$send .= '</table>';
		echo $send;
	}
	function add_row(){
		$data['tanggungan']			=	[];
		$tanggungan 				= 	$this->my_where('v_tanggungan_siswa', ['idsiswa_fk'=>$_POST['id']])->result_array();
		foreach ($tanggungan as $value) {
				$pembayaran = $this->db->select('sum(jumlah) as jml')->get_where('penerimaan', ['idsiswa_fk'=>$_POST['id'], 'idjenispenerimaan_fk'=>$value['id_jenis_penerimaan']])->row_array();
				$data['tanggungan'][]	=	[
					'id_jenis_penerimaan'	=>	$value['idjenispenerimaan_fk'],
					'nama'					=>	$value['nama'],
					'jumlah'				=>	$value['jumlah'],
					'pembayaran'			=>	$pembayaran['jml']
				];
		}
		$data['rand']	=	rand(0,99999);

		$this->my_view(['role/admin/page/transaksi_tanggungan_siswa/add_page/row'],$data);
	}

	
	
}