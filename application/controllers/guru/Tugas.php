 <?php
defined('BASEPATH') OR exit('No direct script access allowed');

class tugas extends MY_Controller {

	public $arr = [
			'title'				=>	'Halaman Tugas Siswa',
			'table'				=>	'tugas',
			'column'			=>	[ 'kode','deskripsi','idguru_fk','idkelas_fk', 'idmapel_fk','judul','deadline','idtahunajaran_fk','status'],
			'column_order'		=>	[ 'kode','deskripsi','idguru_fk','idkelas_fk', 'idmapel_fk','judul','deadline','idtahunajaran_fk','status'],
			'column_search'		=>	[ 'kode','deskripsi','idguru_fk','idkelas_fk', 'idmapel_fk','judul','deadline','idtahunajaran_fk','status'],
			'order'				=>	['id_tugas'	=>	'DESC'],
			'id'				=>	'id_tugas'
	];

	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['guru']		=	$this->my_where('guru', ['id_guru'=>$data['account']['anggota_id']])->row_array();
		$data['dt_guru']	=	$this->get_guru();
		if ($this->agent->is_mobile()) {
 			$this->my_view(['role/guru/page_mobile/tugas/index_page/index','role/guru/page_mobile/tugas/index_page/js'],$data);
 		}else{
 			$this->my_view(['role/guru/page/tugas/index_page/index','role/guru/page/tugas/index_page/js'],$data);
 		}
		
	}

	function get_data_request(){
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['guru']		=	$this->get_guru();
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', [])->result_array();
		$data['tugas']	=	$this->db->query('select * from tugas where idguru_fk='.$data['guru']['guru']['id_guru'].' order by id_tugas desc limit 10')->result_array();
		$this->my_view(['role/guru/page_mobile/tugas/index_page/get_data'],$data);
	}


	public function pengumpulan($id_tugas)
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['guru']		=	$this->my_where('guru', ['id_guru'=>$data['account']['anggota_id']])->row_array();
		$data['dt_guru']	=	$this->get_guru();
		$data['tugas']		=	$this->my_where('tugas', ['id_tugas'=>$id_tugas])->row_array();
		$data['kelas']		=	$this->my_where('kelas', ['id_kelas'=>$data['tugas']['idkelas_fk']])->row_array();
		$pengumpulan_tugas = $this->my_where('pengumpulan_tugas', ['idtugas_fk'=>$id_tugas])->result_array();
		$data['pengumpulan_tugas'] = [];
		foreach ($pengumpulan_tugas as $key => $value) {
			$data['pengumpulan_tugas'][] = [
				'tugas'=>$value,
				'siswa'=>$this->my_where('siswa', ['id_siswa'=>$value['idsiswa_fk']])->row_array()
			];
		}
		$this->my_view(['role/guru/page/tugas/index_page/pengumpulan_tugas'],$data);
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
		$this->my_view(['role/guru/page/tugas/add_page/index','role/guru/page/tugas/add_page/js'],$data);
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

				$query = $this->db->query("Select * from v_tugas where status=1 and id_jam_pelajaran=".$value['id_jam_pelajaran']." and 
					MONTH(tanggal) = ".$dt->format("m")." and
					YEAR(tanggal) = ".$dt->format("Y")." and
					DAY(tanggal) = ".$tgl."");

				$query2 = $this->db->query("Select * from v_tugas where status<>1 and id_jam_pelajaran=".$value['id_jam_pelajaran']." and 
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
		$this->my_view(['role/guru/page/tugas/add_page/jadwal'],$data);
	}
	public function simpan_data()
	{	
		$foto = $this->save_media([
			'path'	=>	"./include/media/foto_tugas/",
			'filename' => 'foto',
		]);
		$data = [
			'kode' 							=> $_POST['kode'],	 	
			'tanggal' 						=> $_POST['tanggal'],
			'idkelas_fk' 					=> $_POST['idkelas_fk'],
			'idmapel_fk' 					=> $_POST['idmapel_fk'],
			'judul' 						=> $_POST['judul'],
			'deadline' 						=> $_POST['deadline'],
			'judul' 						=> $_POST['judul'],
			'deskripsi' 					=> $_POST['deskripsi'],
			'status' 						=> 1,
			'foto'							=>	((isset($foto)) ? $foto['file_name'] : ''),
			'idguru_fk' 					=> $this->get_user_account()['anggota_id'],
		];

		if ($this->save_data('tugas', $data)) {
			
		}
	}


	public function datatable()
	{
       $_POST['frm']   =   $this->arr;
       	$this->db->where('idguru_fk ',$this->get_user_account()['anggota_id']);
        $list           =   $this->mod_datatable->get_datatables();
        $data           =   array();
        $no             =   $_POST['start'];
        foreach ($list as $field) {
            $no++;
            $row        =   array();
            $kelas 					=	$this->my_where('kelas', ['id_kelas'=>$field['idkelas_fk']])->row_array();
            $mata_pelajaran 		=	$this->my_where('mata_pelajaran', ['id_mata_pelajaran'=>$field['idmapel_fk']])->row_array();
            $pengumpulan_tugas		=	$this->my_where('pengumpulan_tugas', ['idtugas_fk'=>$field['id_tugas']]);
            $row[]      =   '<input type="checkbox" name="get-check" value="'.$field['id_tugas'].'"></input>';
            $row[]		=	!empty($field['tanggal']) ? date_format(date_create($field['tanggal']), 'd-m-Y') : '-';
            $row[]		=	$field['kode'].' - '.$field['judul'];
            $row[]		=	$kelas['kelas'];
            $row[]		=	$mata_pelajaran['mata_pelajaran'];
            $row[]		=	$field['deadline'];
            $row[]		=	$pengumpulan_tugas->num_rows();
            $row[]		=	'<a href="Tugas/pengumpulan/'.$field['id_tugas'].'" class="app-item btn btn-xs btn-success"><i class="icon-eye"></i></a>';
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
