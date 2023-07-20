<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class jadwal_lab extends MY_Controller {

	public $arr = [
			'title'				=>	'Halaman Peminjaman Laboratorium',
			'table'				=>	'jadwal_lab',
			'column'			=>	[ 'idkelas_fk','idjampelajaranmulai_fk','idjampelajaranselesai_fk','idmapel_fk', 'keterangan','status','idguru_fk'],
			'column_order'		=>	[ 'idkelas_fk','idjampelajaranmulai_fk','idjampelajaranselesai_fk','idmapel_fk', 'keterangan','status','idguru_fk'],
			'column_search'		=>	[ 'idkelas_fk','idjampelajaranmulai_fk','idjampelajaranselesai_fk','idmapel_fk', 'keterangan','status','idguru_fk'],
			'order'				=>	['id_jadwal_lab'	=>	'DESC'],
			'id'				=>	'id_jadwal_lab'
	];

	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/admin/page/jadwal_lab/index_page/index','role/admin/page/jadwal_lab/index_page/js'],$data);
	}
	public function penjadwalan()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/admin/page/jadwal_lab/index_page/penjadwalan','role/admin/page/jadwal_lab/index_page/js_penjadwalan'],$data);
	}
	function jadwal(){

		$jam_pelajaran	=	$this->my_where('jam_pelajaran', [])->result_array();
		$tg = $this->getStartAndEndDate(date("W", strtotime($_POST['tanggal'])),date("Y", strtotime($_POST['tanggal'])));
		$begin = new DateTime($tg['start_date']);
		$end = new DateTime($tg['end_date']);
		$interval = DateInterval::createFromDateString('1 day');
		$period = new DatePeriod($begin, $interval, $end);
		$data['tg']	=	$period;
		$data['jadwal']	=	[];
		foreach ($jam_pelajaran as $value) {
			$jadwal = [];
			foreach ($period as $dt) {
				$tgl = $dt->format("d");

				$query = $this->db->query("Select * from jadwal_lab where status = 1 and (idjampelajaranmulai_fk>=".$value['id_jam_pelajaran']." or idjampelajaranselesai_fk<=".$value['id_jam_pelajaran'].") and 
					MONTH(tanggal) = ".(date("m", strtotime($_POST['tanggal'])))." and
					YEAR(tanggal) = ".(date("Y", strtotime($_POST['tanggal'])))." and
					DAY(tanggal) = ".$tgl."");

				$jadwal[] = $query->row_array() ;
			}
			$data['jadwal'][]	=	[
				'jam_pelajaran' => $value,
				'jadwal' => $jadwal
			];
		}
		$this->my_view(['role/admin/page/jadwal_lab/index_page/jadwal'],$data);
	}
	public function add_page()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['guru']		=	$this->my_where('guru', ['id_guru'=>$data['account']['anggota_id']])->row_array();
		$data['dt_guru']	=	$this->get_guru();
		$data['kelas']		=	$this->my_where('kelas', [])->result_array();
		$data['jam_pelajaran']		=	$this->my_where('jam_pelajaran', [])->result_array();
		$data['mata_pelajaran']		=	$this->my_where('mata_pelajaran', [])->result_array();
		$this->my_view(['role/admin/page/jadwal_lab/add_page/index','role/admin/page/jadwal_lab/add_page/js'],$data);
	}
	public function simpan_data()
	{	
		$data = [
			'tanggal' 					=> $_POST['tanggal'],
			'idkelas_fk' 					=> $_POST['idkelas_fk'],
			'idjampelajaranmulai_fk' 		=> $_POST['idjampelajaranmulai_fk'],
			'idjampelajaranselesai_fk' 		=> $_POST['idjampelajaranselesai_fk'],
			'idmapel_fk' 					=> $_POST['idmapel_fk'],
			'keterangan' 					=> $_POST['keterangan'],
			'status' 						=> 0,
			// 'idguru_fk' 					=> $this->get_user_account()['anggota_id'],
		];

		if ($this->save_data('jadwal_lab', $data)) {
			echo "Success";
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
            $guru 					=	$this->my_where('guru', ['id_guru'=>$field['idguru_fk']])->row_array();
            $kelas 					=	$this->my_where('kelas', ['id_kelas'=>$field['idkelas_fk']])->row_array();
            $jam_mulai 				=	$this->my_where('jam_pelajaran', ['id_jam_pelajaran'=>$field['idjampelajaranmulai_fk']])->row_array();
            $jam_selesai 			=	$this->my_where('jam_pelajaran', ['id_jam_pelajaran'=>$field['idjampelajaranselesai_fk']])->row_array();
            $mata_pelajaran 		=	$this->my_where('mata_pelajaran', ['id_mata_pelajaran'=>$field['idmapel_fk']])->row_array();
            $row[]      =   '<input type="checkbox" name="get-check" value="'.$field['id_jadwal_lab'].'"></input>';
            $row[]		=	!empty($field['tanggal']) ? date_format(date_create($field['tanggal']), 'd-m-Y') : '-';
            $row[]		=	$guru['nama'];
            $row[]		=	$kelas['kelas'];
            $row[]		=	$mata_pelajaran['mata_pelajaran'];
            $row[]		=	$jam_mulai['nama'].' ('.$jam_mulai['jam_mulai'].'/'.$jam_mulai['jam_selesai'].')';
            $row[]		=	$jam_selesai['nama'].' ('.$jam_selesai['jam_mulai'].'/'.$jam_selesai['jam_selesai'].')';
            $row[]		=	$field['keterangan'];
            if ($field['status'] == 0) {
            	$row[]	=	'<span class="label label-default">Belum Dikonfirmasi</span>';
            }else if($field['status'] == 1){
            	$row[]	=	'<span class="label label-success">Diterima</span>';
            }else{
            	$row[]	=	'<span class="label label-danger">Ditolak</span>';
            }
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

}
