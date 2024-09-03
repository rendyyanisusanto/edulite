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
			$query_jdw = [];
			foreach ($period as $dt) {
				$tgl = $dt->format("d");

				$query = $this->db->query("Select * from v_jadwal_lab where id_jam_pelajaran=".$value['id_jam_pelajaran']." and 
					MONTH(tanggal) = ".$dt->format("m")." and
					YEAR(tanggal) = ".$dt->format("Y")." and
					DAY(tanggal) = ".(int)$tgl."");

				$jadwal[] = $query->result_array() ;
			}
			$data['jadwal'][]	=	[
				'jam_pelajaran' => $value,
				'jadwal' => $jadwal,
			];
		}
		$this->my_view(['role/admin/page/jadwal_lab/index_page/jadwal'],$data);
	}
	function get_content_jadwal(){

		$jam_pelajaran	=	$this->my_where('jam_pelajaran', [])->result_array();
		$tg = $this->getStartAndEndDate(date("W", strtotime($_POST['tanggal'])),date("Y", strtotime($_POST['tanggal'])));
		$begin = new DateTime($tg['start_date']);
		$end = new DateTime($tg['end_date']);
		$interval = DateInterval::createFromDateString('1 day');
		$period = new DatePeriod($begin, $interval, $end);
		$data['tg']	=	$period;
		$data['jadwal']	=	[];
		$data['week']	=	date("W", strtotime($_POST['tanggal']));
		foreach ($jam_pelajaran as $value) {
			$jadwal = [];
			foreach ($period as $dt) {
				$tgl = $dt->format("d");

				$query = $this->db->query("Select * from v_jadwal_lab where status=1 and id_jam_pelajaran=".$value['id_jam_pelajaran']." and 
					MONTH(tanggal) = ".$dt->format("m")." and
					YEAR(tanggal) = ".$dt->format("Y")." and
					DAY(tanggal) = ".$tgl."");

				$query2 = $this->db->query("Select * from v_jadwal_lab where status<>1 and id_jam_pelajaran=".$value['id_jam_pelajaran']." and 
					MONTH(tanggal) = ".$dt->format("m")." and
					YEAR(tanggal) = ".$dt->format("Y")." and
					DAY(tanggal) = ".$tgl."");

				$jadwal[] = [
					'accept' => $query->num_rows(),
					'all'=>$query2->num_rows()
				];
				
			}
			$data['jadwal'][]	=	[
				'jam_pelajaran' => $value,
				'jadwal' => $jadwal
			];
		}
		$this->my_view(['role/guru/page/jadwal_lab/add_page/jadwal'],$data);
	}

	function jadwal_rilis(){

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

				$query = $this->db->query("Select * from v_jadwal_lab where status=1 and id_jam_pelajaran=".$value['id_jam_pelajaran']." and 
					MONTH(tanggal) = ".$dt->format("m")." and
					YEAR(tanggal) = ".$dt->format("Y")." and
					DAY(tanggal) = ".$tgl."");

				$jadwal[] = $query->row_array() ;
			}
			$data['jadwal'][]	=	[
				'jam_pelajaran' => $value,
				'jadwal' => $jadwal
			];
		}
		$this->my_view(['role/admin/page/jadwal_lab/index_page/jadwal_rilis'],$data);
	}
	function get_detail(){
		$id = $_POST['id'];

		$data['jadwal_lab']	=	$this->my_where('jadwal_lab', ['id_jadwal_lab'=>$id])->row_array();
		$data['kelas']		=	$this->my_where('kelas', ['id_kelas'=>$data['jadwal_lab']['idkelas_fk']])->row_array();
		$data['mata_pelajaran']		=	$this->my_where('mata_pelajaran', ['id_mata_pelajaran'=>$data['jadwal_lab']['idmapel_fk']])->row_array();
		$data['jadwal_lab']	=	$this->my_where('jadwal_lab', ['id_jadwal_lab'=>$id])->row_array();
		$data['detail']		=	$this->my_where('v_jadwal_lab', ['id_jadwal_lab' => $id])->result_array();
		$data['guru']		=	$this->my_where('guru', ['id_guru' => $data['jadwal_lab']['idguru_fk']])->row_array();

		$this->my_view(['role/admin/page/jadwal_lab/index_page/detail_content'],$data);
	}
	public function add_page()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['guru']		=	$this->my_where('guru', [])->result_array();
		$data['kelas']		=	$this->my_where('kelas', [])->result_array();
		$data['jam_pelajaran']		=	$this->my_where('jam_pelajaran', [])->result_array();
		$data['mata_pelajaran']		=	$this->my_where('mata_pelajaran', [])->result_array();
		$this->my_view(['role/admin/page/jadwal_lab/add_page/index','role/admin/page/jadwal_lab/add_page/js'],$data);
	}
	public function simpan_data()
	{	
		$transcode = rand(0, 999999);
		$data = [
			'kode' 							=> $transcode,	 	
			'tanggal' 						=> $_POST['tanggal'],
			'idkelas_fk' 					=> $_POST['idkelas_fk'],
			'idmapel_fk' 					=> $_POST['idmapel_fk'],
			'keterangan' 					=> $_POST['keterangan'],
			'status' 						=> 0,
			'idguru_fk' 					=> $_POST['idguru_fk'],
		];

		if ($this->save_data('jadwal_lab', $data)) {
			
			$dataget = $this->my_where('jadwal_lab', [
				'kode' 							=> $transcode,
				'tanggal' 						=> $_POST['tanggal'],
				'idkelas_fk' 					=> $_POST['idkelas_fk'],
				'idmapel_fk' 					=> $_POST['idmapel_fk'],
				'idguru_fk' 					=> $_POST['idguru_fk'],
			])->row_array();

			foreach ($_POST['jam_pelajaran'] as $value) {
				$this->save_data('detail_jadwal_lab', [
					'idjadwallab_fk' => $dataget['id_jadwal_lab'],
					'idjampelajaran_fk' => ((isset($value)) ? $value : '')
				]);
			}
			echo "Success";
		}
	}

	function update_jadwal(){
		$this->my_update('jadwal_lab', ['status' => $_POST['status']], ['id_jadwal_lab'	=>	$_POST['id_jadwal_lab']]);
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
            $mata_pelajaran 		=	$this->my_where('mata_pelajaran', ['id_mata_pelajaran'=>$field['idmapel_fk']])->row_array();
            $row[]      =   '<input type="checkbox" name="get-check" value="'.$field['id_jadwal_lab'].'"></input>';
            $row[]		=	!empty($field['tanggal']) ? date_format(date_create($field['tanggal']), 'd-m-Y') : '-';
            $row[]		=	$guru['nama'];
            $row[]		=	$kelas['kelas'];
            $row[]		=	$mata_pelajaran['mata_pelajaran'];
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
