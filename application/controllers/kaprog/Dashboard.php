<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends MY_Controller {
	public function get_data()
	{
		$data				=	$this->get_guru();
		$data['cek_kd']		=	$this->cek_kd();
		$data['tahun_ajaran']	=	$this->tahun_ajaran_aktif();
		$data['total_siswa']	=	$this->my_where('siswa', [])->num_rows();

		$all_day 		= cal_days_in_month(CAL_GREGORIAN, date("m"), date("Y"));
		$data['all_day'] = [];
		for ($i=1; $i <= $all_day ; $i++) { $data['all_day'][] = $i;}
		$data['kaprog']		=	$this->my_where('kaprog', ['idguru_fk'=>$data['account']['anggota_id']])->result_array();
		$data['detail_kaprog']	=	[];
		foreach ($data['kaprog'] as $key => $value) {
			$absen = [];
			$absen_count = [];
			for ($i=1; $i <= $all_day ; $i++) { 
				 $abs = $this->my_where('v_presensi_harian_set', [
								'idtahunajaran_fk'		=>	$data['tahun_ajaran']['id_tahun_ajaran'],
								'id_jurusan'			=>	$value['idjurusan_fk'],
								'MONTH(tanggal)'		=>	date("m"),
								'YEAR(tanggal)'			=>	date( "Y"),
								'DAY(tanggal)'			=>	$i,
								'presensi'				=>	'M'
							])->num_rows();
				 $absen[] = (int) $abs;
				$absen_count[$i] = [$i];
			}

			$data['detail_kaprog'][]	=	[
				'program_keahlian'		=>	$this->my_where('jurusan', ['id_jurusan'=>$value['idjurusan_fk']])->row_array(),
				'jumlah_siswa_tingkat'	=>	$this->db->query('SELECT count(*) as jumlah, nama_tingkat, idtingkat_fk FROM edulite.v_siswa_jurusan where id_jurusan='.$value['idjurusan_fk'].' group by idtingkat_fk;')->result_array(),
				'jumlah_siswa'			=>	$this->my_where('siswa', ['idjurusan_fk'=>$value['idjurusan_fk']])->num_rows(),
				'jumlah_kelas'			=>	$this->my_where('kelas', ['idjurusan_fk'=>$value['idjurusan_fk'], 'idtahunajaran_fk'=>$data['tahun_ajaran']['id_tahun_ajaran']])->num_rows(),
				'absen_chart'			=>	$absen,
				'absen_count'			=>	$absen_count
			];
		}

		
		$this->my_view(['role/kaprog/page/dashboard/index_page/index','role/kaprog/page/dashboard/index_page/js'],$data);
	}
}
