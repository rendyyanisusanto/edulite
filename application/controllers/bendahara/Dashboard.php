<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends MY_Controller {
	public function get_data()
	{
		$data['poin_pelanggaran_siswa']	=	$this->my_where('v_poin_pelanggaran_siswa', [])->result_array();
		$this->my_view(['role/bendahara/page/dashboard/index_page/index','role/bendahara/page/dashboard/index_page/js'],$data);
	}
	public function stats()
	{
		$data['pendapatan_hari_ini'] = $this->get_from_account(
			[
				[
					'key_app'		=>'date(create_at)',
					'value_app'		=>date('Y/m/d'),

				],
			]
			, 4
		);
		$data['pendapatan_total'] = $this->get_from_account([], 4);
		$data['rekam_medis_hari_ini'] = $this->get_penerimaan(
			[
				[
					'key_app'		=>'date(create_at)',
					'value_app'		=>date('Y/m/d')
				]
			]
		);
		$data['rekam_medis_total'] = $this->get_penerimaan([]);
		$this->my_view(['role/bendahara/page/dashboard/index_page/stats'],$data);
		// print_r($pendapatan_total);
	}
	
	public function line_penerimaan()
	{
		$mulai = new DateTime((isset($_POST['mulai']))?((!empty($_POST['mulai'])) ? $_POST['mulai'] : '-1 week'):'-1 week');
		$sampai = new DateTime((isset($_POST['sampai']))?((!empty($_POST['sampai'])) ? $_POST['sampai'] : '+1 day'):'+1 day');

		$period = new DatePeriod($mulai, new DateInterval('P1'.$_POST['tipe']), $sampai);
			$key_get 	 		= [];
			$value_get		 	= [];
		foreach ($period as $date) {
			$dates 	= $date->format($_POST['dtvalue']);
			$data 	= $this->db->query('SELECT count(*) as value_get, '.$_POST['data_tipe'].'(tanggal) as key_get FROM `penerimaan` where '.$_POST['data_tipe'].'(tanggal)="'.$dates.'" GROUP BY '.$_POST['data_tipe'].'(tanggal)')->row_array();
			
				$key_get[] 				= 	$dates;
				$value_get[] 			= 	(isset($data['value_get']))?$data['value_get']:0;
		}

		$series = [
			 		'name'=> 'Penerimaan',
                    'type'=> 'line',
                    'data'=> $value_get,
                    'smooth'=> true,
                    'symbolSize'=> 7,
                    'markLine'=> [
                        'data'=> [[
                            'type'=> 'average',
                            'name'=> 'Average'
                        ]]
                    ],
                    'itemStyle'=> [
                        'normal'=> [
                            'borderWidth'=> 2
                        ]
                    ]
		];
		$send = [
			'key_get'		=>	$key_get,
			'value_get'		=>	$series,
			'legend'		=>	['Penerimaan']
		];


		echo json_encode($send);
	}
	public function line_keuangan()
	{
		$mulai = new DateTime((isset($_POST['mulai']))?((!empty($_POST['mulai'])) ? $_POST['mulai'] : '-1 week'):'-1 week');
		$sampai = new DateTime((isset($_POST['sampai']))?((!empty($_POST['sampai'])) ? $_POST['sampai'] : '+1 day'):'+1 day');

		$period = new DatePeriod($mulai, new DateInterval('P1'.$_POST['tipe']), $sampai);
			$key_get 	 		= [];
			$value_get		 	= [];
			$value_get_pengeluaran		 	= [];
		foreach ($period as $date) {
			$dates 	= $date->format($_POST['dtvalue']);
			// $data 	= $this->db->query('SELECT count(*) as value_get, '.$_POST['data_tipe'].'(tanggal) as key_get FROM `rekam_medis` where '.$_POST['data_tipe'].'(tanggal)="'.$dates.'" GROUP BY '.$_POST['data_tipe'].'(tanggal)')->row_array();

			$data = $this->get_from_account(
				[
					[
						'key_app'		=>$_POST['data_tipe'].'(create_at)',
						'value_app'		=>$dates
					]
				], 4
			);
			$data_pengeluaran = $this->get_from_account(
				[
					[
						'key_app'		=>$_POST['data_tipe'].'(create_at)',
						'value_app'		=>$dates
					]
				], 5
			);
			
				$key_get[] 				= 	$dates;
				$value_get[] 			= 	(isset($data))?$data:0;
				$value_get_pengeluaran[]= 	(isset($data_pengeluaran))?$data_pengeluaran:0;
		}

		$series[] = [
			 		'name'=> 'Pendapatan',
                    'type'=> 'line',
                    'data'=> $value_get,
                    'smooth'=> true,
                    'symbolSize'=> 7,
                    'markLine'=> [
                        'data'=> [[
                            'type'=> 'average',
                            'name'=> 'Average'
                        ]]
                    ],
                    'itemStyle'=> [
                        'normal'=> [
                            'borderWidth'=> 2
                        ]
                    ]
		];
		$series[] = [
			 		'name'=> 'Beban',
                    'type'=> 'line',
                    'data'=> $value_get_pengeluaran,
                    'smooth'=> true,
                    'symbolSize'=> 7,
                    'markLine'=> [
                        'data'=> [[
                            'type'=> 'average',
                            'name'=> 'Average'
                        ]]
                    ],
                    'itemStyle'=> [
                        'normal'=> [
                            'borderWidth'=> 2
                        ]
                    ]
		];
		$send = [
			'key_get'		=>	$key_get,
			'value_get'		=>	$series,
			'legend'		=>	['Pendapatan', 'Beban']
		];


		echo json_encode($send);
	}
}
