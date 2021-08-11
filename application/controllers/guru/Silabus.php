<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class silabus extends MY_Controller {

	public $arr = [
			'title'				=>	'Halaman silabus',
			'table'				=>	'silabus',
			'column'			=>	[ 'idguru_fk','idkelas_fk'],
			'column_order'		=>	[ 'id_silabus','idguru_fk','idkelas_fk'],
			'column_search'		=>	[ 'id_silabus','idguru_fk','idkelas_fk'],
			'order'				=>	['id_silabus'	=>	'DESC'],
			'id'				=>	'id_silabus'
	];

	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['guru']		=	$this->my_where('guru', ['id_guru'=>$data['account']['anggota_id']])->row_array();
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', [])->result_array();
		
		$data['dt_guru']	=	$this->get_guru();
		// print_r($data['dt_guru']);
		$this->my_view(['role/guru/page/silabus/index_page/index','role/guru/page/silabus/index_page/js'],$data);
	}

	function get_silabus()
	{
		$data['dt_guru']	=	$this->get_guru();
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', ['is_active'=>1])->row_array();
		$data['set_guru']	=	[];
		foreach ($data['dt_guru']['mapel'] as $key => $value) {
			$data['set_guru'][] = [
				'dt_guru'	=>	$value,
				'silabus'	=>	$this->my_where("silabus", ['idguru_fk'=>$value['id_guru'],'idtahunajaran_fk'=>$data['tahun_ajaran']['id_tahun_ajaran'], 'idtingkat_fk'=>$value['idtingkat_fk'],'idmatapelajaran_fk'=>$value['idmapel_fk'], 'idjurusan_fk'=>$value['idjurusan_fk']])->row_array()
			];
		}
		$this->my_view(['role/guru/page/silabus/index_page/silabus'],$data);
	}


	function add_page()
	{

		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', [])->result_array();
		$data['dt_guru']	=	$this->get_guru();
		$this->my_view(['role/guru/page/silabus/add_page/index','role/guru/page/silabus/add_page/js'],$data);
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
            $tingkat		=	$this->my_where('tingkat', ['id_tingkat'=>$field['idtingkat_fk']])->row_array();
            $jurusan		=	$this->my_where('jurusan', ['id_jurusan'=>$field['idjurusan_fk']])->row_array();
            $mata_pelajaran		=	$this->my_where('mata_pelajaran', ['id_mata_pelajaran'=>$field['idmatapelajaran_fk']])->row_array();
            $row[]      =   '<input type="checkbox" name="get-check" value="'.$field['id_silabus'].'"></input>';
            $row[]		=	!empty($materi['materi']) ? $materi['materi'] : '-';
            $row[]		=	!empty($mata_pelajaran['mata_pelajaran']) ? $mata_pelajaran['mata_pelajaran'] : '-';
            $row[]		=	!empty($jurusan['jurusan']) ? $jurusan['jurusan'] : '-';
            $row[]		=	!empty($field['file']) ? '<a target="__blank" href="'.base_url('include/media/silabus/'.$field['file']).'">Download file</a>' : '-';
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

	function save_file()
	{

		$account	=	$this->get_user_account();
		$file = $this->save_media([
				'path'	=>	"./include/media/silabus/",
				'filename' => 'silabus',
		]);
		$tahun_ajaran = $this->my_where('tahun_ajaran', ['is_active'=>1])->row_array();
		if ($this->my_where('silabus', [
			'idguru_fk'				=>	$account['anggota_id'],
			'idtahunajaran_fk'		=>	$tahun_ajaran['id_tahun_ajaran'],
			'idtingkat_fk'			=>	$_POST['idtingkat_fk'],
			'idjurusan_fk'			=>	$_POST['idjurusan_fk'],
			'idmatapelajaran_fk'	=>	$_POST['idmatapelajaran_fk'],
		])->num_rows() > 0) {
			$this->my_update('silabus', [ 
				'file'					=>	((isset($file)) ? $file['file_name'] : '')
				],
				[
					'idguru_fk'				=>	$account['anggota_id'],
					'idtahunajaran_fk'		=>	$tahun_ajaran['id_tahun_ajaran'],
					'idtingkat_fk'			=>	$_POST['idtingkat_fk'],
					'idjurusan_fk'			=>	$_POST['idjurusan_fk'],
					'idmatapelajaran_fk'	=>	$_POST['idmatapelajaran_fk'],
				]
				);
		}else{
			$data = [
				'idguru_fk'				=>	$account['anggota_id'],
				'idtahunajaran_fk'		=>	$tahun_ajaran['id_tahun_ajaran'],
				'idtingkat_fk'			=>	$_POST['idtingkat_fk'],
				'idjurusan_fk'			=>	$_POST['idjurusan_fk'],
				'idmatapelajaran_fk'	=>	$_POST['idmatapelajaran_fk'],
				'file'					=>	((isset($file)) ? $file['file_name'] : ''),
			];

			$this->save_data('silabus', $data);
		}
		
		
		
	}
	
}