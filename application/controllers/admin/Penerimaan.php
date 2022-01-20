<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class penerimaan extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman penerimaan',
			'table'				=>	'penerimaan',
			'column'			=>	[ 'penerimaan','idtingkat_fk','idjurusan_fk','idtahunajaran_fk'],
			'column_order'		=>	[ 'id_penerimaan','penerimaan','idtingkat_fk','idjurusan_fk','idtahunajaran_fk'],
			'column_search'		=>	[ 'id_penerimaan','penerimaan','idtingkat_fk','idjurusan_fk','idtahunajaran_fk'],
			'order'				=>	['id_penerimaan'	=>	'DESC'],
			'id'				=>	'id_penerimaan'
	];

	/*
		CHANGE PAGE
	*/
	public function spp()
	{
		/*if you need custom page*/

		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/admin/page/penerimaan/spp/index','role/admin/page/penerimaan/spp/js'],$data);

	}

	public function find_siswa()
	{
		if (isset($_POST['key'])) {
			$send = '<div class="panel panel-white">
						<div class="panel-body">
							<table class="table table-xss table-bordered table-framed">
							<thead>
								<tr>
									<th>Nama</th>
									<th width="2%">#</th>
								</tr>
							</thead>
							<tbody>
						';
			      // Produces: WHERE `title` LIKE 'match' ESCAPE '!'
			$this->db->like('nama', $_POST['key'], 'both');  
			$this->db->limit(10);
			$query = $this->db->get('siswa')->result_array();
			foreach ($query as $key => $value) {
				$send .= '<tr>';
				$send .= '<td>'.$value['nama'].'</td>';
				$send .= '<td><button type="button" class="btn btn-info btn-xs btn-proses" data-id="'.$value['id_siswa'].'" type="button"><b><i class="icon-spinner"></i></b> </button></td>';
				$send .= '</tr>';

			}
			$send .= '</tbody></table></div></div>';
			echo $send;
		}
	}

	public function get_data_siswa($id='')
	{
		$data_siswa = $this->my_where('siswa',['id_siswa'=>$id])->row_array();

		$send = '
				<div class="col-md-3">
					<img src="'. base_url(((!empty($data_siswa['foto']) ? 'include/media/foto_siswa/'.$data_siswa['foto'] : 'include/media/system/no_image.jpg'))) .'" class="img-responsive" style="width:100%;max-width: 100px;max-height: 200px" >
				</div>
				<div class="col-md-9">
					<table class="table table-xxs table-framed table-bordered">
						<tr>
							<td>NIS</td>
							<td>'.$data_siswa['nis'].'</td>
						</tr>
						<tr>
							<td>Nama</td>
							<td>'.$data_siswa['nama'].'</td>
						</tr>
						<tr>
							<td>Alamat</td>
							<td>'.$data_siswa['alamat'].'</td>
						</tr>
					</table>
				</div>
				';
		echo $send;
	}
	public function simpan_data()
	{
		$data = [
			'idsiswa_fk' => $_POST['idsiswa_fk'],
			'bulan'			=>	$_POST['bulan'],
			'tahun'			=>	$_POST['tahun'],
			'tanggal'		=>	$_POST['tanggal'],
			'jumlah_bayar'	=>	$_POST['jumlah_bayar'],
		];
		$this->save_data('pembayaran_spp', $data);
	}
}