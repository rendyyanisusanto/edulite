<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class presensi_harian extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman siswa_kelas',
			'table'				=>	'presensi_harian',
			'column'			=>	[ 'siswa_kelas'],
			'column_order'		=>	[ 'id_siswa_kelas','siswa_kelas'],
			'column_search'		=>	[ 'id_siswa_kelas','siswa_kelas'],
			'order'				=>	['id_siswa_kelas'	=>	'DESC'],
			'id'				=>	'id_siswa_kelas'
	];

	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', [])->result_array();
		$data['mata_pelajaran']		=	$this->my_where('mata_pelajaran', [])->result_array();
		$data['kelas']		=	$this->my_where('kelas', [])->result_array();
		$this->my_view(['role/BK/page/presensi_harian/index_page/index','role/BK/page/presensi_harian/index_page/js'],$data);
	}
	public function rekap()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', [])->result_array();
		$data['mata_pelajaran']		=	$this->my_where('mata_pelajaran', [])->result_array();
		$data['kelas']		=	$this->my_where('kelas', [])->result_array();
		$this->my_view(['role/BK/page/presensi_harian/rekap/index','role/BK/page/presensi_harian/rekap/js'],$data);
	}
	function get_jadwal(){

		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$tanggal 	=	$_POST['tanggal'];
		$data['tanggal'] 	=	$_POST['tanggal'];
		$kelas		=	$this->my_where('kelas', [])->result_array();
		foreach ($kelas as $key => $value) {
			$data['kelas'][] = [
				'kelas'	=>$value,
				'p_masuk'	=>	$this->my_where('presensi_harian_siswa', [
					'tanggal'	=> $tanggal,
					'idkelas_fk'	=>	$value['id_kelas'],
					'presensi_masuk !='	=> 'null'
				])->num_rows(),
				'p_pulang'	=>	$this->my_where('presensi_harian_siswa', [
					'tanggal'	=> $tanggal,
					'idkelas_fk'	=>	$value['id_kelas'],
					'presensi_pulang !='	=> 'null'
				])->num_rows(),
			];
		}

		$this->my_view(['role/BK/page/presensi_harian/presensi_siswa_masuk_pulang/content_jadwal'],$data);
	}
	public function presensi_siswa()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', [])->result_array();
		$data['kelas']		=	$this->my_where('kelas', [])->result_array();
		$this->my_view(['role/BK/page/presensi_harian/presensi_siswa/index','role/BK/page/presensi_harian/presensi_siswa/js'],$data);
	}
	function presensi_siswa_masuk_pulang(){

		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', [])->result_array();
		
		$this->my_view(['role/BK/page/presensi_harian/presensi_siswa_masuk_pulang/index','role/BK/page/presensi_harian/presensi_siswa_masuk_pulang/js'],$data);
	}
	function proses_presensi_masuk_pulang($idkelas_fk = "",$status="M",$tanggal=""){
		if ($idkelas_fk !== "") {
			$data['account']	=	$this->get_user_account();
			$data['param'] 		= 	$this->arr;
			$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', ['is_active'	=> 1])->row_array();
			$data['kelas']		=	$this->my_where('kelas', ['id_kelas' => $idkelas_fk])->row_array();
			$data['tanggal']	=	$tanggal;
			$data['stat']	=	$status;
			$data['siswa']		=	[];
			$siswa 				=	$this->my_where('siswa', ['idkelas_fk' => $idkelas_fk])->result_array();
			foreach ($siswa as $value) {
				$presensi = $this->my_where('presensi_harian_siswa', [
						'idsiswa_fk'			=>	$value['id_siswa'],
						'tanggal'				=>	$_POST['tanggal']
					])->row_array();

			 	$data['siswa'][] = [
					'siswa' => $value,
					'presensi' => !empty($presensi) ? $presensi : []
				];
			} 
			$this->my_view(['role/BK/page/presensi_harian/presensi_siswa_masuk_pulang/absen','role/BK/page/presensi_harian/presensi_siswa_masuk_pulang/js_absen'],$data);
		}
	}
	public function absen($idmapel, $tanggal)
	{
		$data['account']	=	$this->get_user_account();
		$mapel_get			=	$this->my_where('v_jadwal_pelajaran', ['id_jadwal_pelajaran'=>$idmapel])->row_array();
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', ['id_tahun_ajaran'=>$mapel_get['idtahunajaran_fk']])->row_array();
		$siswa		=	$this->my_where('siswa', ['idkelas_fk'=>$mapel_get['idkelas_fk']])->result_array();
		$data['kelas']		=	$this->my_where('kelas', ['id_kelas'=>$mapel_get['idkelas_fk']])->row_array();
		$data['mata_pelajaran']		=	$this->my_where('mata_pelajaran', ['id_mata_pelajaran'=>$mapel_get['idmapel_fk']])->row_array();
		$data['dt_guru']	=	$this->get_guru();
		$data['siswa'] = [];

		foreach ($siswa as $key => $value) {
			$presensi = $this->my_where('presensi_harian', [
				'idsiswa_fk' 			=> 	$value['id_siswa'],
				'idtahunajaran_fk'		=>	$mapel_get['idtahunajaran_fk'],
				'idkelas_fk'			=>	$mapel_get['idkelas_fk'],
				'idmatapelajaran_fk'	=>	$mapel_get['idmapel_fk'],
				'tanggal' 				=>	$tanggal
			])->row_array();

			$data['siswa'][] = [
				'siswa' => $value,
				'presensi' => !empty($presensi) ? $presensi : []
			];
 		}
		$this->my_view(['role/BK/page/presensi_harian/presensi_siswa/absen'],$data);
	}
	function save_presensi_harian_siswa()
	{
		if (count($_POST['data']) > 0) {
			$stat = $_POST['stat'];
			foreach ($_POST['data'] as $key => $value) {
				$data = [
					'idsiswa_fk'			=>	$value['idsiswa_fk'],
					(($stat == "M") ? 'presensi_masuk' : 'presensi_pulang')		=>	$value['presensi'],
					'tanggal'				=>	$_POST['tanggal'],
					'idtahunajaran_fk'				=>	$_POST['idtahunajaran_fk'],
					'idkelas_fk'				=>	$_POST['idkelas_fk'],
					'keterangan' 			=> 	$value['keterangan']
				];

				$presensi = $this->my_where('presensi_harian_siswa', [
					'tanggal'				=>	$_POST['tanggal'],
					'idsiswa_fk'			=>	$value['idsiswa_fk'],
					'idtahunajaran_fk'				=>	$_POST['idtahunajaran_fk'],
					'idkelas_fk'				=>	$_POST['idkelas_fk']
				]);

				if ($presensi->num_rows() > 0) {
					 $this->my_update('presensi_harian_siswa', $data, ['id_presensi_harian_siswa'=>$presensi->row_array()['id_presensi_harian_siswa']]);
				}else{
					$this->save_data('presensi_harian_siswa', $data);
				}

			}
		}
		echo json_encode($_POST);
	}
	public function proses_presensi_harian($value='')
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', ['id_tahun_ajaran'=>$_POST['idtahunajaran_fk']])->row_array();
		$siswa		=	$this->my_where('siswa', ['idkelas_fk'=>$_POST['idkelas_fk']])->result_array();
		$data['kelas']		=	$this->my_where('kelas', ['id_kelas'=>$_POST['idkelas_fk']])->row_array();
		$data['siswa'] = [];
		$data['mata_pelajaran'] = $this->my_where('mata_pelajaran', ['id_mata_pelajaran'=>$_POST['idmatapelajaran_fk']])->row_array();
		$data['tanggal'] = $_POST['tanggal'];
		$data['idkelas_fk'] = $_POST['idkelas_fk'];
		foreach ($siswa as $key => $value) {
			$presensi = $this->my_where('presensi_harian', [
				'idsiswa_fk' 			=> 	$value['id_siswa'],
				'idtahunajaran_fk'		=>	$_POST['idtahunajaran_fk'],
				'idkelas_fk'			=>	$_POST['idkelas_fk'],
				'tanggal'				=>	$_POST['tanggal'],
				'idmatapelajaran_fk' 	=> 	$_POST['idmatapelajaran_fk'],
			])->row_array();

			$data['siswa'][] = [
				'siswa' => $value,
				'presensi' => !empty($presensi) ? $presensi : []
			];
 		}
		$this->my_view(['role/BK/page/presensi_harian/index_page/list_siswa'],$data);
	}

	public function proses_presensi_harian_index()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;

		$mapel_hari_ini 	=	$this->my_where('v_jadwal_pelajaran', ['code' => date_format(date_create($_POST['tanggal']),'N')])->result_array();
		if (!empty($mapel_hari_ini)) {
		foreach ($mapel_hari_ini as $key => $value) {
				$data['mapel_hari_ini'][] =[
					'mapel'		=>		$value,
					'nama_guru'				=>	$value['nama_guru'],
					'absen'		=>		$this->my_where('presensi_harian', [
						'idmatapelajaran_fk'	=> $value['idmapel_fk'],
						'tanggal'				=>	$_POST['tanggal'],	
						'idkelas_fk'			=>	$value['idkelas_fk'],
						'idtahunajaran_fk'		=>	$value['idtahunajaran_fk'],
					])->num_rows(),
				]; 
			}
			$this->my_view(['role/BK/page/presensi_harian/presensi_siswa/jadwal'],$data);
		}else{
			echo "<center><h3>Tidak ada jadwal untuk hari ini</h3></center>";
		}
	}
	public function proses_rekap()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', ['id_tahun_ajaran'=>$_POST['idtahunajaran_fk']])->row_array();
		$siswa		=	$this->my_where('siswa', ['idkelas_fk'=>$_POST['idkelas_fk']])->result_array();
		$data['kelas']		=	$this->my_where('kelas', ['id_kelas'=>$_POST['idkelas_fk']])->row_array();
		$data['siswa'] = [];
		// $data['mata_pelajaran'] = $this->my_where('mata_pelajaran', ['id_mata_pelajaran'=>$_POST['idmatapelajaran_fk']])->row_array();
		$data['bulan'] = $_POST['tanggal'];
		$data['idkelas_fk'] = $_POST['idkelas_fk'];
		$data['all_day'] 	= cal_days_in_month(CAL_GREGORIAN, date_format(date_create($_POST['tanggal']), "m"), date_format(date_create($_POST['tanggal']), "Y"));

		if ($_POST['tipe'] == 0) {
			$mapel_hari_ini 	=	$this->my_where('v_jadwal_pelajaran', 
				[
					'code' 					=> date_format(date_create($_POST['tanggal']),'N'),
					'idtahunajaran_fk'		=>	$_POST['idtahunajaran_fk'],
					'idkelas_fk'			=>	$_POST['idkelas_fk'],
				])->result_array();
			$data['mapel_hari_ini']	=	$mapel_hari_ini;
			foreach ($siswa as $key => $value) {
				
				$presensi = [];
				
				foreach ($mapel_hari_ini as $key_mapel => $value_mapel) {
					$presensi[$key_mapel] = $this->my_where('presensi_harian', [
								'idsiswa_fk' 			=> 	$value['id_siswa'],
								'idtahunajaran_fk'		=>	$_POST['idtahunajaran_fk'],
								'idkelas_fk'			=>	$_POST['idkelas_fk'],
								'MONTH(tanggal)'		=>	date_format(date_create($_POST['tanggal']), "m"),
								'YEAR(tanggal)'			=>	date_format(date_create($_POST['tanggal']), "Y"),
								'DAY(tanggal)'			=>	date_format(date_create($_POST['tanggal']), "d"),
								'idmatapelajaran_fk' 	=> 	$value_mapel['idmapel_fk'],
							])->row_array();
				
				}
				$data['siswa'][] = [
					'siswa' => $value,
					'presensi' => !empty($presensi) ? $presensi : []
				];
	 		}
			$this->my_view(['role/BK/page/presensi_harian/rekap/list_siswa_0'],$data);
		} elseif($_POST['tipe'] == 1){
			$rng = $this->weeks_in_month(date_format(date_create($_POST['tanggal']), "m"), date_format(date_create($_POST['tanggal']), "Y"));
			foreach ($siswa as $key => $value) {
				$ds = [];
				for ($i=1; $i <=$rng ; $i++) { 
					$query = $this->db->query("select *, 
							(WEEK(tanggal, 5) - WEEK(DATE_SUB(tanggal, INTERVAL DAYOFMONTH(tanggal) - 1 DAY), 5) + 1) as week, 
							count(if(presensi='M', presensi, null)) as M,  
							count(if(presensi='S', presensi, null)) as S,  
							count(if(presensi='I', presensi, null)) as I,  
							count(if(presensi='A', presensi, null)) as A,  
							count(if(presensi<>'M', presensi, null)) as TM 
							from presensi_harian where ((WEEK(tanggal, 5) - WEEK(DATE_SUB(tanggal, INTERVAL DAYOFMONTH(tanggal) - 1 DAY), 5) + 1))=".$i." and idsiswa_fk=".$value['id_siswa']." and MONTH(tanggal) = '".date_format(date_create($_POST['tanggal']), "m")."' and YEAR(tanggal)='".date_format(date_create($_POST['tanggal']), "Y")."' group by week(tanggal)")->row_array();
					 
					$ds[$i] = $query;
				}
				$data['siswa'][] = [
					'siswa' => $value,
					'presensi' => !empty($ds) ? $ds : []
				];
	 		}
	 		$data['rng']	=	$rng;
			$this->my_view(['role/BK/page/presensi_harian/rekap/list_siswa1'],$data);
			
		} elseif($_POST['tipe'] == 4){

			foreach ($siswa as $key => $value) {
				$a = $this->my_where('presensi_harian', [
								'idsiswa_fk' 			=> 	$value['id_siswa'],
								'idtahunajaran_fk'		=>	$_POST['idtahunajaran_fk'],
								'idkelas_fk'			=>	$_POST['idkelas_fk'],
								'MONTH(tanggal)'		=>	date_format(date_create($_POST['tanggal']), "m"),
								'YEAR(tanggal)'			=>	date_format(date_create($_POST['tanggal']), "Y"),
								'presensi'				=>	'A'
							])->num_rows();
				$m = $this->my_where('presensi_harian', [
								'idsiswa_fk' 			=> 	$value['id_siswa'],
								'idtahunajaran_fk'		=>	$_POST['idtahunajaran_fk'],
								'idkelas_fk'			=>	$_POST['idkelas_fk'],
								'MONTH(tanggal)'		=>	date_format(date_create($_POST['tanggal']), "m"),
								'YEAR(tanggal)'			=>	date_format(date_create($_POST['tanggal']), "Y"),
								'presensi'				=>	'M'
							])->num_rows();
				$s = $this->my_where('presensi_harian', [
								'idsiswa_fk' 			=> 	$value['id_siswa'],
								'idtahunajaran_fk'		=>	$_POST['idtahunajaran_fk'],
								'idkelas_fk'			=>	$_POST['idkelas_fk'],
								'MONTH(tanggal)'		=>	date_format(date_create($_POST['tanggal']), "m"),
								'YEAR(tanggal)'			=>	date_format(date_create($_POST['tanggal']), "Y"),
								
								'presensi'				=>	'S'
							])->num_rows();
				$i = $this->my_where('presensi_harian', [
								'idsiswa_fk' 			=> 	$value['id_siswa'],
								'idtahunajaran_fk'		=>	$_POST['idtahunajaran_fk'],
								'idkelas_fk'			=>	$_POST['idkelas_fk'],
								'MONTH(tanggal)'		=>	date_format(date_create($_POST['tanggal']), "m"),
								'YEAR(tanggal)'			=>	date_format(date_create($_POST['tanggal']), "Y"),
								
								'presensi'				=>	'I'
							])->num_rows();
				$data['siswa'][] = [
					'siswa' => $value,
					'm' => 	$m,
					's'	=>	$s,
					'i'	=>	$i,
					'a'	=>	$a,
					'tm'	=>	$s+$i+$a
				];
			}
			$this->my_view(['role/BK/page/presensi_harian/rekap/list_total'],$data);
		}elseif($_POST['tipe'] == 5){

			foreach ($siswa as $key => $value) {
				$m = 0; $s=0; $ijin=0; $a=0;
				$all_day 		= cal_days_in_month(CAL_GREGORIAN, date_format(date_create($_POST['tanggal']), "m"), date_format(date_create($_POST['tanggal']), "Y"));
				$presensi = [];
				for ($i=1; $i <= $all_day ; $i++) { 

					$this->db->order_by('id_presensi_harian', 'DESC');
					$presensi[$i] = $this->my_where('presensi_harian', [
								'idsiswa_fk' 			=> 	$value['id_siswa'],
								'idtahunajaran_fk'		=>	$_POST['idtahunajaran_fk'],
								'idkelas_fk'			=>	$_POST['idkelas_fk'],
								'MONTH(tanggal)'		=>	date_format(date_create($_POST['tanggal']), "m"),
								'YEAR(tanggal)'			=>	date_format(date_create($_POST['tanggal']), "Y"),
								'DAY(tanggal)'			=>	$i,
							])->row_array();
					$m += ($presensi[$i]['presensi'] == "M") ? 1:0;
					$s += ($presensi[$i]['presensi'] == "S") ? 1:0;
					$ijin += ($presensi[$i]['presensi'] == "I") ? 1:0;
					$a += ($presensi[$i]['presensi'] == "A") ? 1:0;
				}
				$data['siswa'][] = [
					'siswa' => $value,
					'm' => 	$m,
					's'	=>	$s,
					'i'	=>	$ijin,
					'a'	=>	$a,
					'tm'	=>	$s+$ijin+$a
				];
			}
			$this->my_view(['role/BK/page/presensi_harian/rekap/list_total'],$data);
		}elseif($_POST['tipe'] == 2){
				foreach ($siswa as $key => $value) {
				$all_day 		= cal_days_in_month(CAL_GREGORIAN, date_format(date_create($_POST['tanggal']), "m"), date_format(date_create($_POST['tanggal']), "Y"));
				$presensi = [];
				$m = 0;
				$tm = 0;
				for ($i=1; $i <= $all_day ; $i++) { 

					$query = $this->db->query("Select *,
								count(if(presensi='M', presensi, null)) as M,  
								count(if(presensi='S', presensi, null)) as S,  
								count(if(presensi='I', presensi, null)) as I,  
								count(if(presensi='A', presensi, null)) as A,  
								count(if(presensi<>'M', presensi, null)) as TM 
								 from presensi_harian where 
								idsiswa_fk = ".$value['id_siswa']." and
								idtahunajaran_fk = ".$_POST['idtahunajaran_fk']." and
								MONTH(tanggal) = ".date_format(date_create($_POST['tanggal']), "m")." and
								YEAR(tanggal) = ".date_format(date_create($_POST['tanggal']), "Y")." and
								DAY(tanggal) = ".$i."
								group by tanggal")->row_array();

					if ($query['A'] > 0) {
						$tm ++;
						$presensi[$i]['presensi'] = 'A';
					}else if($query['I'] > 0){
						$tm++;
						$presensi[$i]['presensi'] = 'I';
					}else if($query['S'] > 0){
						$tm++;
						$presensi[$i]['presensi'] = 'S';
					}else if($query['M'] > 0){
						$m++;
						$presensi[$i]['presensi'] = 'M';
					}else{
						$presensi[$i]['presensi'] = '';
					}
					
				}
				$data['siswa'][] = [
					'siswa' => $value,
					'presensi' => !empty($presensi) ? $presensi : [],
					'm'=>$m,
					'tm'=>$tm
				];
	 		}
			$this->my_view(['role/BK/page/presensi_harian/rekap/list_siswa_3'],$data);
		}elseif($_POST['tipe']==3){
			$tg = $this->getStartAndEndDate(date("W", strtotime($_POST['tanggal'])),date("Y", strtotime($_POST['tanggal'])));
			$begin = new DateTime($tg['start_date']);
			$end = new DateTime($tg['end_date']);
			$interval = DateInterval::createFromDateString('1 day');
			$period = new DatePeriod($begin, $interval, $end);
			$data['tg']	=	$period;
			foreach ($siswa as $key => $value) {
				$i = 0;
				$m = 0;
				$tm = 0;
				$presensi = [];
				foreach ($period as $dt) {
				    $tgl = $dt->format("d");

				    $query = $this->db->query("Select *,
									count(if(presensi='M', presensi, null)) as M,  
									count(if(presensi='S', presensi, null)) as S,  
									count(if(presensi='I', presensi, null)) as I,  
									count(if(presensi='A', presensi, null)) as A,  
									count(if(presensi<>'M', presensi, null)) as TM 
									 from presensi_harian where 
									idsiswa_fk = ".$value['id_siswa']." and
									idtahunajaran_fk = ".$_POST['idtahunajaran_fk']." and
									MONTH(tanggal) = ".$dt->format("m")." and
									YEAR(tanggal) = ".$dt->format("Y")." and
									DAY(tanggal) = ".$tgl."
									group by tanggal")->row_array();

						if ($query['A'] > 0) {
							$presensi[$i]['presensi'] = 'A';
							$tm++;
						}else if($query['I'] > 0){
							$presensi[$i]['presensi'] = 'I';
							$tm++;
						}else if($query['S'] > 0){
							$presensi[$i]['presensi'] = 'S';
							$tm++;
						}else if($query['M'] > 0){
							$presensi[$i]['presensi'] = 'M';
							$m++;
						}else{
							$presensi[$i]['presensi'] = '';
						}
						$i++;
				}
				$data['siswa'][] = [
					'siswa' => $value,
					'presensi' => !empty($presensi) ? $presensi : [],
					'm'=>$m,
					'tm'	=>	$tm
				];

			}
			// print_r($data['siswa']);

			$this->my_view(['role/BK/page/presensi_harian/rekap/list_siswa_4'],$data);
		}elseif ($_POST['tipe'] == 8) {
			
			foreach ($siswa as $key => $value) {
				
				$presensi = $this->my_where('presensi_harian_siswa', [
					'tanggal'				=>	$_POST['tanggal'],
					'idsiswa_fk'			=>	$value['id_siswa'],
					'idtahunajaran_fk'				=>	$_POST['idtahunajaran_fk'],
					'idkelas_fk'				=>	$_POST['idkelas_fk']
				])->row_array();
				$data['siswa'][] = [
					'siswa' => $value,
					'presensi' => !empty($presensi) ? $presensi : []
				];
	 		}
			$this->my_view(['role/BK/page/presensi_harian/rekap/list_siswa_8'],$data);
		}elseif ($_POST['tipe'] == 9) {
			$tg = $this->getStartAndEndDate(date("W", strtotime($_POST['tanggal'])),date("Y", strtotime($_POST['tanggal'])));
			$begin = new DateTime($tg['start_date']);
			$end = new DateTime($tg['end_date']);
			$interval = DateInterval::createFromDateString('1 day');
			$period = new DatePeriod($begin, $interval, $end);
			$data['tg']	=	$period;
			foreach ($siswa as $key => $value) {
				$i = 0;
				$m = 0;
				$tm = 0;
				$presensi = [];
				foreach ($period as $dt) {
				    $tgl = $dt->format("d");

				    $query = $this->db->query("Select *,
									count(if(presensi_masuk='M', presensi_masuk, null)) as M,  
									count(if(presensi_masuk='S', presensi_masuk, null)) as S,  
									count(if(presensi_masuk='I', presensi_masuk, null)) as I,  
									count(if(presensi_masuk='A', presensi_masuk, null)) as A,  
									count(if(presensi_masuk<>'M', presensi_masuk, null)) as TM 
									 from presensi_harian_siswa where 
									idsiswa_fk = ".$value['id_siswa']." and
									idtahunajaran_fk = ".$_POST['idtahunajaran_fk']." and
									MONTH(tanggal) = ".$dt->format("m")." and
									YEAR(tanggal) = ".$dt->format("Y")." and
									DAY(tanggal) = ".$tgl."
									group by tanggal")->row_array();

						if ($query['A'] > 0) {
							$presensi[$i]['presensi'] = 'A';
							$tm++;
						}else if($query['I'] > 0){
							$presensi[$i]['presensi'] = 'I';
							$tm++;
						}else if($query['S'] > 0){
							$presensi[$i]['presensi'] = 'S';
							$tm++;
						}else if($query['M'] > 0){
							$presensi[$i]['presensi'] = 'M';
							$m++;
						}else{
							$presensi[$i]['presensi'] = '';
						}


						$query_pulang = $this->db->query("Select *,
									count(if(presensi_pulang='M', presensi_pulang, null)) as M,  
									count(if(presensi_pulang='S', presensi_pulang, null)) as S,  
									count(if(presensi_pulang='I', presensi_pulang, null)) as I,  
									count(if(presensi_pulang='A', presensi_pulang, null)) as A,  
									count(if(presensi_pulang<>'M', presensi_pulang, null)) as TM 
									 from presensi_harian_siswa where 
									idsiswa_fk = ".$value['id_siswa']." and
									idtahunajaran_fk = ".$_POST['idtahunajaran_fk']." and
									MONTH(tanggal) = ".$dt->format("m")." and
									YEAR(tanggal) = ".$dt->format("Y")." and
									DAY(tanggal) = ".$tgl."
									group by tanggal")->row_array();

						if ($query_pulang['A'] > 0) {
							$presensi[$i]['presensi_pulang'] = 'A';
						}else if($query_pulang['I'] > 0){
							$presensi[$i]['presensi_pulang'] = 'I';
						}else if($query_pulang['S'] > 0){
							$presensi[$i]['presensi_pulang'] = 'S';
						}else if($query_pulang['M'] > 0){
							$presensi[$i]['presensi_pulang'] = 'M';
						}else{
							$presensi[$i]['presensi_pulang'] = '';
						}

						$i++;
				}
				$data['siswa'][] = [
					'siswa' => $value,
					'presensi' => !empty($presensi) ? $presensi : [],
					'm'=>$m,
					'tm'	=>	$tm
				];

			}
			
			$this->my_view(['role/BK/page/presensi_harian/rekap/list_siswa_9'],$data);
		}
		
	}
	public function save_presensi_harian()
	{
		if (count($_POST['data']) > 0) {
			foreach ($_POST['data'] as $key => $value) {
				$data = [
					'idmatapelajaran_fk' 	=> 	$_POST['idmatapelajaran_fk'],
					'idsiswa_fk'			=>	$value['idsiswa_fk'],
					'presensi'				=>	$value['presensi'],
					'keterangan'			=>	"",
					'tanggal'				=>	$_POST['tanggal'],
					'idtahunajaran_fk'		=>	$_POST['idtahunajaran_fk'],
					'idkelas_fk'			=>	$_POST['idkelas_fk'],
				];

				$presensi = $this->my_where('presensi_harian', [
					'idsiswa_fk' 			=> 	$value['idsiswa_fk'],
					'idtahunajaran_fk'		=>	$_POST['idtahunajaran_fk'],
					'idkelas_fk'			=>	$_POST['idkelas_fk'],
					'tanggal'				=>	$_POST['tanggal'],
					'idmatapelajaran_fk' 	=> 	$_POST['idmatapelajaran_fk'],
				]);

				if ($presensi->num_rows() > 0) {
					 $this->my_update('presensi_harian', $data, ['id_presensi_harian'=>$presensi->row_array()['id_presensi_harian']]);
				}else{
					$this->save_data('presensi_harian', $data);
				}

				
			}
		}
		echo json_encode($_POST);
	}
	public function download_file($id_kelas='', $id_tahun_ajaran ='', $id_mata_pelajaran ='', $tanggal='')
	{
		$reader = new \PhpOffice\PhpSpreadsheet\Reader\Xlsx();
		$spreadsheet = $reader->load("include/template/excel/format_presensi_harian.xlsx");
		// $spreadsheet = \PhpOffice\PhpSpreadsheet\IOFactory::load();
		$kelas 		=	$this->my_where('kelas', ['id_kelas'=>$id_kelas])->row_array();
		$mata_pelajaran 		=	$this->my_where('mata_pelajaran', ['id_mata_pelajaran'=>$id_mata_pelajaran])->row_array();
		$tahun_ajaran 		=	$this->my_where('tahun_ajaran', ['id_tahun_ajaran'=>$id_tahun_ajaran])->row_array();
		$siswa		=	$this->my_where('siswa', ['idkelas_fk'=>$id_kelas])->result_array();
		//change it
		$sheet = $spreadsheet->getActiveSheet();
		$sheet->setCellValue('A9', $mata_pelajaran['mata_pelajaran']);
		$sheet->setCellValue('D9', $tanggal);
		$sheet->setCellValue('A10', $kelas['kelas']);
		$sheet->setCellValue('D10', base64_encode($mata_pelajaran['id_mata_pelajaran']));
		foreach ($siswa as $key => $value) {
			$cek = $this->my_where('presensi_harian', [
					'idsiswa_fk' => $value['id_siswa'],
					'idkelas_fk' => $id_kelas,
					'tanggal'				=>	$tanggal,
					'idtahunajaran_fk' 		=> $id_tahun_ajaran,
					'idmatapelajaran_fk' 	=> 	$id_mata_pelajaran,
				]);



			
			$sheet->setCellValue('B'.($key+14), $value['nama']);
			$sheet->setCellValue('C'.($key+14), (($cek->num_rows() > 0) ? $cek->row_array()['presensi'] : ''));
			$sheet->getStyle('D'.($key+14))->getProtection()->setLocked(\PhpOffice\PhpSpreadsheet\Style\Protection::PROTECTION_PROTECTED);
			$sheet->setCellValue('D'.($key+14), $value['id_siswa']);
		}
		

		//write it again to Filesystem with the same name (=replace)
		$writer = new Xlsx($spreadsheet);
		$fileName = "presensi_harian_KELAS_".$kelas['kelas']."_TAHUN_AJARAN_".$tahun_ajaran['tahun_ajaran'].$tahun_ajaran['semester'].".xlsx";
		header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment; filename="'. urlencode($fileName).'"');
        $writer->save('php://output');
	}

	public function impor_presensi_rapor()
	{
		$file_mimes = array('application/octet-stream', 'application/vnd.ms-excel', 'application/x-csv', 'text/x-csv', 'text/csv', 'application/csv', 'application/excel', 'application/vnd.msexcel', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
 
		if(isset($_FILES['file_upload']['name']) && in_array($_FILES['file_upload']['type'], $file_mimes)) {
		 	
		 	$kelas 		=	$this->my_where('kelas', ['id_kelas'=>$_POST['idkelas_fk']])->row_array();
			$tahun_ajaran 		=	$this->my_where('tahun_ajaran', ['id_tahun_ajaran'=>$_POST['idtahunajaran_fk']])->row_array();
			$siswa		=	$this->my_where('siswa', ['idkelas_fk'=>$_POST['idkelas_fk']])->result_array();
		    $arr_file = explode('.', $_FILES['file_upload']['name']);
		    $extension = end($arr_file);
		 
		    if($extension == 'csv'){
                    $reader = new \PhpOffice\PhpSpreadsheet\Reader\Csv();
                } elseif($extension == 'xlsx') {
                    $reader = new \PhpOffice\PhpSpreadsheet\Reader\Xlsx();
                } else {
                    $reader = new \PhpOffice\PhpSpreadsheet\Reader\Xls();
            }
		 
		    $spreadsheet = $reader->load($_FILES['file_upload']['tmp_name']);
		    $send = [];
		    $sheetData = $spreadsheet->getActiveSheet();
			
			foreach ($siswa as $key => $value) {
				// cek
				$cek = $this->my_where('presensi_harian', [
					'idsiswa_fk' => $value['id_siswa'],
					'idkelas_fk' => $_POST['idkelas_fk'],
					'tanggal'				=>	$_POST['tanggal'],
					'idtahunajaran_fk' 		=>  $_POST['idtahunajaran_fk'],
					'idmatapelajaran_fk' 	=> 	$_POST['idmatapelajaran_fk'],
				]);
				
				$data_set = [
					'idmatapelajaran_fk' 	=> 	$_POST['idmatapelajaran_fk'],
					'idsiswa_fk'			=>	$sheetData->getCell('d'.($key+14))->getValue(),
					'presensi'				=>	(!empty($sheetData->getCell('C'.($key+14))->getValue())) ? $sheetData->getCell('C'.($key+14))->getValue() : "",
					'keterangan'			=>	"",
					'tanggal'				=>	$_POST['tanggal'],
					'idtahunajaran_fk'		=>	$_POST['idtahunajaran_fk'],
					'idkelas_fk'			=>	$_POST['idkelas_fk'],
				];

				if ($cek->num_rows() > 0) {
					$this->my_update('presensi_harian', $data_set, ['idsiswa_fk'=>$sheetData->getCell('d'.($key+14))->getValue()]);
				}else{
					$send [] = $data_set;
				}
				


				
			}
			if (count($send) > 0) {
				$this->save_data_batch('presensi_harian', $send);
			}
		    echo json_encode($send);
		}
	}
	function weeks_in_month($month, $year) {
 	// Start of month
	 $start = mktime(0, 0, 0, $month, 1, $year);
	 // End of month
	 $end = mktime(0, 0, 0, $month, date('t', $start), $year);
	 // Start week
	 $start_week = date('W', $start);
	 // End week
	 $end_week = date('W', $end);
	 if ($end_week < $start_week) { // Month wraps
	   return ((52 + $end_week) - $start_week) + 1;
	 }
	 return ($end_week - $start_week) + 1;
	}
	function getStartAndEndDate($week, $year) {
	  $dateTime = new DateTime();
	  $dateTime->setISODate($year, $week);
	  $result['start_date'] = $dateTime->format('Y-m-d');
	  $dateTime->modify('+6 days');
	  $result['end_date'] = $dateTime->format('Y-m-d');
	  return $result;
	}
	public function get_laporan_tipe($tipe='')
	{
		$data =[];
		$this->my_view(['role/BK/page/presensi_harian/rekap/p'.$tipe], $data);
	}
	function wa($idmapel)
	{
		$data['account']	=	$this->get_user_account();
		$mapel_get			=	$this->my_where('v_jadwal_pelajaran', ['id_jadwal_pelajaran'=>$idmapel])->row_array();
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', ['id_tahun_ajaran'=>$mapel_get['idtahunajaran_fk']])->row_array();
		$siswa		=	$this->my_where('siswa', ['idkelas_fk'=>$mapel_get['idkelas_fk']])->result_array();
		$data['kelas']		=	$this->my_where('kelas', ['id_kelas'=>$mapel_get['idkelas_fk']])->row_array();
		$data['guru']		=	$this->my_where('guru', ['id_guru'=>$mapel_get['idguru_fk']])->row_array();
		$data['mata_pelajaran']		=	$this->my_where('mata_pelajaran', ['id_mata_pelajaran'=>$mapel_get['idmapel_fk']])->row_array();
		$this->curl->simple_post('http://localhost:8000/send-message', ['number'=>$data['guru']['no_hp'].'@c.us', 
			'message'=>'Hay '.$data['guru']['nama'].', Anda belum melakukan presensi Mapel '.$data['mata_pelajaran']['mata_pelajaran'].' Kelas '.$data['kelas']['kelas']]);
	}
}