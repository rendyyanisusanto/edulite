<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Rpp extends MY_Controller {

	public $arr = [
			'title'				=>	'Halaman Rpp',
			'table'				=>	'Rpp',
			'column'			=>	[ 'idguru_fk','idkelas_fk'],
			'column_order'		=>	[ 'id_rpp','idguru_fk','idkelas_fk'],
			'column_search'		=>	[ 'id_rpp','idguru_fk','idkelas_fk'],
			'order'				=>	['id_rpp'	=>	'DESC'],
			'id'				=>	'id_rpp'
	];

	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['guru']		=	$this->my_where('guru', ['id_guru'=>$data['account']['anggota_id']])->row_array();
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', [])->result_array();
		$data['dt_guru']	=	$this->get_guru();
		$this->my_view(['role/guru/page/rpp/index_page/index','role/guru/page/rpp/index_page/js'],$data);
	}

	function add_page()
	{

		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', [])->result_array();
		$data['dt_guru']	=	$this->get_guru();
		$this->my_view(['role/guru/page/rpp/add_page/index','role/guru/page/rpp/add_page/js'],$data);
	}
	public function datatable()
	{

		$data['account']	=	$this->get_user_account();
		$_POST['frm']   =   $this->arr;
		$this->db->where('idguru_fk', $data['account']['anggota_id']);
        $list           =   $this->mod_datatable->get_datatables();
        $data           =   array();
        $no             =   $_POST['start'];
        foreach ($list as $field) {
            $no++;
            $row        =   array();
            $materi		=	$this->my_where('materi', ['id_materi'=>$field['idmateri_fk']])->row_array();
            $kelas		=	$this->my_where('kelas', ['id_kelas'=>$field['idkelas_fk']])->row_array();
            $mata_pelajaran		=	$this->my_where('mata_pelajaran', ['id_mata_pelajaran'=>$field['idmatapelajaran_fk']])->row_array();
            $row[]      =   '<input type="checkbox" name="get-check" value="'.$field['id_rpp'].'"></input>';
            $row[]		=	!empty($materi['materi']) ? $materi['materi'] : '-';
            $row[]		=	!empty($mata_pelajaran['mata_pelajaran']) ? $mata_pelajaran['mata_pelajaran'] : '-';
            $row[]		=	!empty($kelas['kelas']) ? $kelas['kelas'] : '-';
            $row[]		=	!empty($field['file']) ? '<a target="__blank" href="'.base_url('include/media/rpp/'.$field['file']).'">Download file</a>' : '-';
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
	function set_materi()
	{
		$idmapel = $_POST['idmapel'];
		$idkelas = $_POST['idkelas'];

		$dataset = $this->my_where('materi', ['idmatapelajaran_fk'=>$idmapel, 'idkelas_fk'=>$idkelas])->result_array();
		$send    = '<select required class="form-control" name="idmateri_fk">';
		foreach ($dataset as $value) {
			$send .= '<option value="'.$value['id_materi'].'">'.$value['materi'].'</option>';
		}
		$send .='</select>';

		echo $send;
	}

	function simpan_data()
	{

		$account	=	$this->get_user_account();
		$file = $this->save_media([
			'path'	=>	"./include/media/rpp/",
			'filename' => 'file',
		]);

		$kelasmapel = explode('/', $_POST['kelas_mapel']);
		$data = [
			'idguru_fk'				=>	$account['anggota_id'],
			'idtahunajaran_fk'		=>	$_POST['idtahunajaran_fk'],
			'idkelas_fk'			=>	$kelasmapel[1],
			'idmateri_fk'			=>	$_POST['idmateri_fk'],
			'file'					=>	((isset($file)) ? $file['file_name'] : ''),
			'idmatapelajaran_fk'	=>	$kelasmapel[0]
		];

		$this->save_data('rpp', $data);
	}
	
}