<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class presensi_guru extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman siswa_kelas',
			'table'				=>	'presensi_guru',
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
		$this->load->library('ciqrcode');

		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['guru']		=	$this->get_guru();

		$data['tahun_ajaran']	=	$this->tahun_ajaran_aktif();
		$data['jadwal_guru']	=  $this->cek_jadwal_guru_hari_ini($data['guru']['guru']['id_guru'], $data['tahun_ajaran']['id_tahun_ajaran']);
		$data['presensi']		=	$this->cek_presensi_guru_hari_ini($data['guru']['guru']['id_guru'], $data['tahun_ajaran']['id_tahun_ajaran']);

		
		$params['data'] = date('Y-m-d');
		$params['level'] = 'H';
		$params['size'] = 10;
		$params['savename'] = "./include/media/qr/".date('Y-m-d').".png";
		$this->ciqrcode->generate($params);
		$this->my_view(['role/guru/page/presensi_guru/index_page/index','role/guru/page/presensi_guru/index_page/js'],$data);
	}

	function rekap(){
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		

		if ($this->agent->is_mobile()) {
 			$this->my_view(['role/guru/page_mobile/presensi_guru/rekap/index','role/guru/page_mobile/presensi_guru/rekap/js'],$data);
 		}else{
 			$this->my_view(['role/guru/page/presensi_guru/rekap/index','role/guru/page/presensi_guru/rekap/js'],$data);
 		}
 		
		
	}
	function get_data_rekap(){
		$hari = [];
		$hari = [];
		$bulan_sekarang = date("m");
		$tahun_sekarang = date("Y");
		$id_guru = $this->get_guru()['guru']['id_guru'];

		for ($b = 1; $b >= 0; $b--) { // Loop dimulai dari dua bulan lalu ke bulan ini
		    $bulan = $bulan_sekarang - $b;
		    $tahun = $tahun_sekarang;

		    // Jika bulan kurang dari 1 (misalnya bulan sekarang Januari), maka mundur ke bulan Desember tahun sebelumnya
		    if ($bulan < 1) {
		        $bulan = 12 + $bulan; // Menjadi 12 jika -1, 11 jika -2
		        $tahun--;
		    }

		    $all_day = cal_days_in_month(CAL_GREGORIAN, $bulan, $tahun);

		    for ($i = 1; $i <= $all_day; $i++) {
		        $presensi_guru = $this->my_where('presensi_guru', [
		            'idguru_fk' => $id_guru,
		            'MONTH(tanggal)' => $bulan,
		            'YEAR(tanggal)' => $tahun,
		            'DAY(tanggal)' => $i
		        ])->row_array();

		        $jadwal_guru = $this->my_where('jadwal_guru', [
		            'idguru_fk' => $id_guru,
		            'idhari_fk' => date('N', strtotime($tahun . '-' . $bulan . '-' . $i))
		        ]);

		        $hari[] = [
		            'id_hari' => date('N', strtotime($tahun . '-' . $bulan . '-' . $i)),
		            'hari' => $this->arr_hari[date('N', strtotime($tahun . '-' . $bulan . '-' . $i))],
		            'tanggal' => date('d-M-Y', strtotime($tahun . '-' . $bulan . '-' . $i)),
		            'is_jadwal' => ($jadwal_guru->num_rows() > 0 ? 1 : 0),
		            'presensi_guru' => $presensi_guru
		        ];
		    }
		}
		$data['hari']			=	$hari;
		$data['presensi_guru'] 	= 	$presensi_guru;
		$data['guru']			=	$this->my_where('guru', ['id_guru'=>$id_guru])->row_array();
		$this->my_view(['role/guru/page_mobile/presensi_guru/rekap/get_data'],$data);
	}
	public function proses_rekap()
	{
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran',['is_active'=>1])->row_array();
		$guru				=	$this->my_where('guru',[])->result_array();
		$data['guru']		=	[];
		foreach ($guru as $key => $value) {
			$kumulatif = 0;
			$persentase_guru = $this->my_where('persentase_guru', ['idguru_fk' => $value['id_guru'], 'idtahunajaran_fk'=>$data['tahun_ajaran']['id_tahun_ajaran']]);
			$jadwal_guru = $this->my_where('jadwal_guru', ['idguru_fk'=>$value['id_guru']])->result_array();
			foreach ($jadwal_guru as $key => $value_jadwal) {
				$kumulatif += $this->total_day($_POST['bulan'],date('Y'), $value_jadwal['idhari_fk']);
			}
			$presensi_guru = $this->my_where('presensi_guru', ['idguru_fk'=>$value['id_guru'], 'MONTH(tanggal)'=>$_POST['bulan']])->num_rows();
			$data['persentase_guru'][] = [
				'guru' => $value,
				'kumulatif'=>$kumulatif,
				'presensi_guru'=>$presensi_guru,
				'persentase' => (($persentase_guru->num_rows() > 0) ? $persentase_guru->row_array() : [] ),
				'rekap_persentase' => ($presensi_guru == 0) ? 0 : (number_format((($presensi_guru/$kumulatif) * 100), 0,'','')),
			]; 
		}
		$data['bulan'] = $_POST['bulan'];
		$data['tahun'] = date('Y');
		$this->my_view(['role/guru/page/presensi_guru/rekap/rekap'],$data);
	}
	public function history(){
		$hari 			= [];
		$bulan 			=date("m");
		$tahun 			=date("Y");
		$id_guru 		= $this->get_guru()['guru']['id_guru'];
		
		$all_day 		= cal_days_in_month(CAL_GREGORIAN, $bulan, $tahun);

		for ($i=1; $i <= $all_day ; $i++) { 
			$presensi_guru 	= $this->my_where('presensi_guru', ['idguru_fk'=>$id_guru, 'MONTH(tanggal)'=>$bulan, 'YEAR(tanggal)'=>$tahun, 'DAY(tanggal)'=>$i])->row_array();
			$jadwal_guru 	= $this->my_where('jadwal_guru', ['idguru_fk'=>$id_guru, 'idhari_fk'=>date('N',strtotime($tahun.'-'.$bulan.'-'.$i))]);

			$hari[]		=	[
				'id_hari'		=>	date('N',strtotime($tahun.'-'.$bulan.'-'.$i)),
				'hari'			=>	$this->arr_hari[date('N',strtotime($tahun.'-'.$bulan.'-'.$i))],
				'tanggal'		=>	date('d-M-Y',strtotime($tahun.'-'.$bulan.'-'.$i)),
				'is_jadwal'		=>	(($jadwal_guru->num_rows() > 0) ? 1 : 0),
				'presensi_guru'	=>	$presensi_guru
			];
		}

		$data['hari']			=	$hari;
		$data['presensi_guru'] 	= 	$presensi_guru;
		$data['guru']			=	$this->my_where('guru', ['id_guru'=>$id_guru])->row_array();
		$this->my_view(['role/guru/page/presensi_guru/rekap/history'],$data);

	}
	function total_day($month,$year,$day)
	{
	    $days=0;
	    $total_days=cal_days_in_month(CAL_GREGORIAN, $month, $year);
	    for($i=1;$i<=$total_days;$i++)
	    if(date('N',strtotime($year.'-'.$month.'-'.$i))==$day)
	    $days++;
	    return $days;
	}
	function simpan_data()
	{

		$tahun_ajaran		=	$this->my_where('tahun_ajaran',['is_active'=>1])->row_array();
		$data = [
			'idguru_fk'			=>	$_POST['idguru_fk'],
			'tanggal'			=>	$_POST['tanggal'],
			'jam_masuk'			=>	($_POST['status'] == 0) ? $_POST['pukul']:'',
			'jam_keluar'		=>	($_POST['status'] == 1) ? $_POST['pukul']:'',
			'idtahunajaran_fk'	=>	$tahun_ajaran['id_tahun_ajaran']
		];

		$cek = $this->my_where('presensi_guru', [
			'idguru_fk'			=>	$_POST['idguru_fk'],
			'tanggal'			=>	$_POST['tanggal'],
			'idtahunajaran_fk'	=>	$tahun_ajaran['id_tahun_ajaran']
		]);

		if ($cek->num_rows() == 0) {
			if ($this->save_data('presensi_guru', $data)) {
				$guru = $this->my_where('guru', ['id_guru'=>$_POST['idguru_fk']])->row_array();

				$this->curl->simple_post('http://localhost:8000/send-message', 
					[
						'number'	=>	$guru['no_hp'].'@c.us', 
						'message'	=>	'Hay '.$guru['nama'].', Anda sudah melakukan presensi pada pukul '.$_POST['pukul']
					]
					);
			}
			
		}else{
			if ($_POST['status'] == 1) {
				if ($cek->row_array()['jam_keluar'] == '00:00:00') {
				
					$this->my_update('presensi_guru', ['jam_keluar'=>$_POST['pukul']], [
						'idguru_fk'			=>	$_POST['idguru_fk'],
						'tanggal'			=>	$_POST['tanggal'],
						'idtahunajaran_fk'	=>	$tahun_ajaran['id_tahun_ajaran']
					]);
				}
			}
			if ($_POST['status'] == 0) {
				if ($cek->row_array()['jam_masuk'] == '00:00:00') {
					$this->my_update('presensi_guru', ['jam_masuk'=>$_POST['pukul']], [
						'idguru_fk'			=>	$_POST['idguru_fk'],
						'tanggal'			=>	$_POST['tanggal'],
						'idtahunajaran_fk'	=>	$tahun_ajaran['id_tahun_ajaran']
					]);
				}
			}
			

			
		}

		echo json_encode($_POST);
	}

	function hapus_hari()
	{
		$this->db->delete('presensi_guru', ['id_presensi_guru'=>$_POST['id']]);
	}

	public function get_presensi()
	{

		$tahun_ajaran		=	$this->my_where('tahun_ajaran',['is_active'=>1])->row_array();
		$data['guru']		=	$this->my_where('guru', [])->result_array();
		$data['presensi'] 	= 	[];

		foreach ($data['guru'] as $key => $value) {
			$day = date('w', strtotime("now"));

			$cek_absen = $this->my_where('jadwal_guru', ['idguru_fk'=>$value['id_guru'], 'idhari_fk'=>$day]);

			if ($cek_absen->num_rows() > 0) {
				$cek = $this->my_where('presensi_guru', ['idguru_fk'=>$value['id_guru'],'idtahunajaran_fk'=>$tahun_ajaran['id_tahun_ajaran'],'tanggal'=>date('Y-m-d')])->row_array();

				$data['presensi'][] = [
					'guru' => $value,
					'presensi' => $cek
				];
			}
			
		}

		$this->my_view(['role/guru/page/presensi_guru/index_page/presensi'],$data);

	}

	public function save_presensi_firebase()
	{
		if ($_POST['kode'] == date('Y-m-d')) {
			$tahun_ajaran		=	$this->my_where('tahun_ajaran',['is_active'=>1])->row_array();
			$data = [
				'idguru_fk'			=>	$_POST['id_guru'],
				'tanggal'			=>	date('Y-m-d'),
				'jam_masuk'			=>	($_POST['status'] == 0) ? date('H:i:s'):'',
				'jam_keluar'		=>	($_POST['status'] == 1) ? date('H:i:s'):'',
				'idtahunajaran_fk'	=>	$tahun_ajaran['id_tahun_ajaran']
			];

			$cek = $this->my_where('presensi_guru', [
				'idguru_fk'			=>	$_POST['id_guru'],
				'tanggal'			=>	date('Y-m-d'),
				'idtahunajaran_fk'	=>	$tahun_ajaran['id_tahun_ajaran']
			]);

			if ($cek->num_rows() == 0) {
				if ($this->save_data('presensi_guru', $data)) {
					# code...
				}
			}else{
				if ($_POST['status'] == 1) {
					if ($cek->row_array()['jam_keluar'] == '00:00:00') {
					
						$this->my_update('presensi_guru', ['jam_keluar'=>date('H:i:s')], [
							'idguru_fk'			=>	$_POST['id_guru'],
							'tanggal'			=>	date('Y-m-d'),
							'idtahunajaran_fk'	=>	$tahun_ajaran['id_tahun_ajaran']
						]);
					}
				}
				if ($_POST['status'] == 0) {
					if ($cek->row_array()['jam_masuk'] == '00:00:00') {
						$this->my_update('presensi_guru', ['jam_masuk'=>date('H:i:s')], [
							'idguru_fk'			=>	$_POST['id_guru'],
							'tanggal'			=>	date('Y-m-d'),
							'idtahunajaran_fk'	=>	$tahun_ajaran['id_tahun_ajaran']
						]);
					}
				}
				

				
			}
		}
	}
}