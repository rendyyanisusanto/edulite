<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class Penilaian_kinerja_guru extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman indikator_pkg',
			'table'				=>	'penilaian_kinerja_guru',
	];

	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		$data['param']		=	$this->arr;
		$data['account']	=	$this->get_user_account();
		$data['tahun_ajaran'] = 	$this->my_where('tahun_ajaran', [])->result_array();
		$data['guru'] 		= 	$this->my_where('guru', [])->result_array();
		$this->my_view(['role/kepsek/page/penilaian_kinerja_guru/index_page/index','role/kepsek/page/penilaian_kinerja_guru/index_page/js'],$data);
	}
	public function report_pkg()
	{
		$data['param']		=	$this->arr;
		$data['account']	=	$this->get_user_account();
		$data['tahun_ajaran'] = 	$this->my_where('tahun_ajaran', [])->result_array();
		$data['guru'] 		= 	$this->my_where('guru', [])->result_array();
		$this->my_view(['role/kepsek/page/penilaian_kinerja_guru/report_pkg/index','role/kepsek/page/penilaian_kinerja_guru/report_pkg/js'],$data);
	}
	public function get_data_bulanan()
	{
		$data['param']		=	$this->arr;
		$data['account']	=	$this->get_user_account();
		$data['tahun_ajaran'] = 	$this->my_where('tahun_ajaran', [])->result_array();
		$data['guru'] 		= 	$this->my_where('guru', [])->result_array();
		$this->my_view(['role/kepsek/page/penilaian_kinerja_guru/index2_page/index','role/kepsek/page/penilaian_kinerja_guru/index2_page/modal_pkg','role/kepsek/page/penilaian_kinerja_guru/index2_page/js'],$data);
	}

	public function proses_data()
	{
		$data['guru'] 				= 	$this->my_where('guru', ['id_guru'=>$_POST['id_guru']])->row_array();
		$data['tahun_ajaran'] 		= 	$this->my_where('tahun_ajaran', ['id_tahun_ajaran'=>$_POST['id_tahun_ajaran']])->row_array();
		$data['periode']			=	$_POST['periode'];
		$kompetensi_pkg				=	$this->my_where('kompetensi_pkg',[])->result_array();
		$data['indikator_pkg']		=	[];
		foreach ($kompetensi_pkg as $key => $value) {
			$subkompetensi_pkg = $this->my_where('subkompetensi_pkg', ['idkompetensipkg_fk'=>$value['id_kompetensi_pkg']])->result_array();	

			$data['indikator_pkg'][] = [
				'kompetensi_pkg' => $value,
				'subkompetensi_pkg' => $subkompetensi_pkg
			];
		}
		$this->my_view(['role/kepsek/page/penilaian_kinerja_guru/index_page/proses_data'],$data);
	}
	function get_proses_now()
	{
		
		$data['guru'] 		= 	$this->my_where('guru', [])->result_array();
		$data['all']		=	[];

		$data['bulan']				=	(!isset($_POST['periode'])) ? date('m') : date_format(date_create($_POST['periode']),"m" );
		$data['tahun']				=	(!isset($_POST['periode'])) ? date('Y') : date_format(date_create($_POST['periode']),"Y" );
		$data['tahun_ajaran']		=	(!isset($_POST['tahun_ajaran'])) ? $this->tahun_ajaran_aktif()['id_tahun_ajaran'] : $_POST['tahun_ajaran'];
		foreach ($data['guru'] as $value) {
			$pkg = $this->my_where('penilaian_kinerja_guru', [
				'idtahunajaran_fk'	=>	$data['tahun_ajaran'],
				'idguru_fk'			=>	$value['id_guru'],
				'bulan'				=>	$data['bulan'],
				'tahun'				=>	$data['tahun'],
			])->row_array();

			$data['all'][]	=	[
				'guru'	=>	$value,
				'pkg'	=>	$pkg
			];
		}
		$this->my_view(['role/kepsek/page/penilaian_kinerja_guru/index2_page/proses_data'],$data);
	}
	function save_pkg()
	{
		$rand = rand(0,99999);
		$data = [
			'idguru_fk'				=>	$_POST['idguru_fk'],
			'bulan'					=>	$_POST['bulan'],
			'tahun'					=>	$_POST['tahun'],
			'idtahunajaran_fk'		=>	$_POST['idtahunajaran_fk'],
			'trans_code'			=>	$rand
		];
		if ($this->save_data('penilaian_kinerja_guru', $data)) {
			$dataget = $this->my_where('penilaian_kinerja_guru', $data)->row_array();

			foreach ($_POST['data_pkg'] as $value) {
				$data_sub[] = [
					'idpenilaiankinerjaguru_fk'	=>	$dataget['id_penilaian_kinerja_guru'],
					'idsubkompetensipkg_fk'		=>	$value['idsubkompetensipkg_fk'],
					'nilai'						=>	$value['nilai']
				];
			}

			$this->save_data_batch('component_penilaian_kinerja_guru', $data_sub);
		}

		echo json_encode($_POST);
	}

	function set_pkg()
	{
		$kompetensi_pkg				=	$this->my_where('kompetensi_pkg',[])->result_array();
		$data['indikator_pkg']		=	[];


		$data['is_edit']			=	$_POST['is_edit'];
		$data['guru'] 				= 	$this->my_where('guru', ['id_guru'=>$_POST['id_guru']])->row_array();
		$data['bulan']				=	(!isset($_POST['bulan'])) ? date('m') : $_POST['bulan'];
		$data['tahun']				=	(!isset($_POST['tahun'])) ? date('Y') : $_POST['tahun'];
		$data['tahun_ajaran']		=	(!isset($_POST['tahun_ajaran'])) ? $this->tahun_ajaran_aktif()['tahun_ajaran'] : $_POST['tahun_ajaran'];
		$data['tahun_ajaran_id']		=	(!isset($_POST['tahun_ajaran'])) ? $this->tahun_ajaran_aktif()['id_tahun_ajaran'] : $_POST['tahun_ajaran'];
		foreach ($kompetensi_pkg as $key => $value) {
			$subkompetensi_pkg 	= 	$this->my_where('subkompetensi_pkg', ['idkompetensipkg_fk'=>$value['id_kompetensi_pkg']])->result_array();
			$qpkg 				=	[];
			if ($data['is_edit'] == 1) {
				foreach ($subkompetensi_pkg as $value_sub) {
					$get_pkg = $this->my_where('v_pkg', [
						'idguru_fk'	=>	$_POST['id_guru'],
						'bulan'		=>	$data['bulan'],
						'tahun'		=>	$data['tahun'],
						'idtahunajaran_fk'	=>	$data['tahun_ajaran_id'],
						'idsubkompetensipkg_fk'	=>	$value_sub['id_subkompetensi_pkg']
					])->row_array();

					$qpkg[] 	= [
						'id_subkompetensi_pkg'	=> 	$value_sub['id_subkompetensi_pkg'],
						'idkompetensipkg_fk'	=>	$value_sub['idkompetensipkg_fk'],
						'subkompetensi'			=>	$value_sub['subkompetensi'],
						'nilai'					=>	$get_pkg['nilai']
					];
				}
			}else{
				$qpkg = $subkompetensi_pkg;
			}
			$data['indikator_pkg'][] = [
				'kompetensi_pkg' => $value,
				'subkompetensi_pkg' => $qpkg
			];
		}
		$this->my_view(['role/kepsek/page/penilaian_kinerja_guru/index2_page/data_pkg'],$data);
	}

	function proses_report()
	{
		$data['guru'] 				= 	$this->my_where('guru', [])->result_array();
		$data['c_sub'] 				= 	$this->my_where('subkompetensi_pkg', [])->num_rows();
		$data['tahun_ajaran'] 		= 	$this->my_where('tahun_ajaran', ['id_tahun_ajaran'=>$_POST['id_tahun_ajaran']])->row_array();
		$data['periode']			=	$_POST['periode'];
		$kompetensi_pkg				=	$this->my_where('kompetensi_pkg',[])->result_array();
		$data['indikator_pkg']		=	[];
		$data['all']				=	[];
		foreach ($kompetensi_pkg as $key => $value) {
			$subkompetensi_pkg = $this->my_where('subkompetensi_pkg', ['idkompetensipkg_fk'=>$value['id_kompetensi_pkg']])->result_array();	
			
			$data['indikator_pkg'][] = [
				'kompetensi_pkg' => $value,
				'subkompetensi_pkg' => $subkompetensi_pkg
			];
		}
		foreach ($data['guru'] as $value) {
			$subkompetensi_pkg = $this->my_where('subkompetensi_pkg', [])->result_array();	
			$all_sub = [];
			$total = 0;
			foreach ($subkompetensi_pkg as $key => $value_sub) {
				$get_pkg = $this->my_where('v_pkg', [
							'idguru_fk'	=>	$value['id_guru'],
							'bulan'		=>	date_format(date_create($_POST['periode']),"m" ),
							'tahun'		=>	date_format(date_create($_POST['periode']),"Y" ),
							'idtahunajaran_fk'	=>	$_POST['id_tahun_ajaran'],
							'idsubkompetensipkg_fk'	=>	$value_sub['id_subkompetensi_pkg']
						])->row_array();
				$all_sub[] = [
					'subkompetensi_pkg' => $value_sub,
					'nilai'				=>	(isset($get_pkg['nilai'])) ? $get_pkg['nilai'] :'-'
				];
				(isset($get_pkg['nilai'])) ? $total+=$get_pkg['nilai'] :$total ;
			}

			$hasil =  number_format((($total/(count($subkompetensi_pkg) * 4))*100),0,'.','.');
			$predikat_pkg = $this->my_where('predikat_pkg', ['min <= '=>$hasil, 'max>='=>$hasil])->row_array();	
			$data['all'][] = [
				'guru' 	=> $value,
				'nilai' => $all_sub,
				'total' => $total,
				'hasil'	=> number_format((($total/(count($subkompetensi_pkg) * 4))*100),2,'.','.'),
				'predikat' => $predikat_pkg
			];
		}
		$this->my_view(['role/kepsek/page/penilaian_kinerja_guru/report_pkg/report_pkg'],$data);
	}
}