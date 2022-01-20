<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class siswa extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman Siswa',
			'table'				=>	'siswa',
			'column'			=>	[
							'nis',
							'nama',
							'idkelas_fk',
							'idjurusan_fk',
							'agama',
							'nisn',
							'no_ijazah_sekolah_asal',
							'no_skhun_sekolah_asal',
							'no_un_sekolah_asal',
							'no_kk',
							'npsn_sekolah_asal',
							'nama_sekolah_asal',
							'tempat_lahir',
							'tanggal_lahir',
							'berkebutuhan_khusus',
							'alamat',
							'dusun',
							'rt',
							'rw',
							'kelurahan',
							'foto',
							'idprovince_fk',
							'idcities_fk',
							'nama_ayah',
							'tempat_lahir_ayah',
							'tanggal_lahir_ayah',
							'pendidikan_ayah',
							'pekerjaan_ayah',
							'penghasilan_ayah',
							'nama_ibu',
							'tempat_lahir_ibu',
							'tanggal_lahir_ibu',
							'pendidikan_ibu',
							'pekerjaan_ibu',
							'penghasilan_ibu',
							'tinggi_badan',
							'berat_badan',
							'jarak_ke_sekolah',
							'waktu_ke_sekolah',
							'jumlah_saudara'
			],
			'column_order'		=>	[ 'nis','nama'],
			'column_search'		=>	[ 'nis','nama'],
			'order'				=>	['id_siswa'	=>	'DESC'],
			'id'				=>	'id_siswa'
	];


	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		// $this->display_view();

		/*if you need custom page*/

		$data['detail_guru'] = $this->get_guru();
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['dt_guru']	=	$this->get_guru();
		$this->my_view(['role/guru/page/siswa/perkelas/index','role/guru/page/siswa/perkelas/js'],$data);

	}

	public function add_page()
	{

		$data['detail_guru'] = $this->get_guru();
		$data['kelas']		=	$this->my_where('kelas', [])->result_array();
		$data['jurusan']	=	$this->my_where('jurusan', [])->result_array();
		$data['province']	=	$this->my_where('provinces', [])->result_array();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/guru/page/siswa/add_page/index','role/guru/page/siswa/add_page/js'],$data);
	}

	public function upload_page()
	{
		$data['account']	=	$this->get_user_account();
		$this->my_view(['role/guru/page/siswa/upload_page','role/guru/page/siswa/js_upload_page'],$data);
	}
	/*
		ADD DATA
	*/

		
	function update_data()
	{
		$foto = $this->save_media([
			'path'	=>	"./include/media/foto_siswa/",
			'filename' => 'foto',
		]);

		$data=[];
		$data=[
				'nis'					=>	$_POST['nis'],
				'nama' 					=>	$_POST['nama'],
				'agama' 				=>	$_POST['agama'],
				'jenis_kelamin'			=>	$_POST['jenis_kelamin'],
				'nisn' 					=>	$_POST['nisn'],
				'no_ijazah_sekolah_asal'=>	$_POST['no_ijazah_sekolah_asal'],
				'no_skhun_sekolah_asal'	=>	$_POST['no_skhun_sekolah_asal'],
				'no_un_sekolah_asal'	=>	$_POST['no_un_sekolah_asal'],
				'no_kk'					=>	$_POST['no_kk'],
				'npsn_sekolah_asal'		=>	$_POST['npsn_sekolah_asal'],
				'nama_sekolah_asal'		=>	$_POST['nama_sekolah_asal'],	
				'tempat_lahir'			=>	$_POST['tempat_lahir'],
				'tanggal_lahir'			=>	$_POST['tanggal_lahir'],
				'idprovince_fk'			=>	$_POST['idprovince_fk'],
				'idcities_fk'			=>	$_POST['idcities_fk'],
				'berkebutuhan_khusus'	=>	$_POST['berkebutuhan_khusus'],
				'alamat'				=>	$_POST['alamat'],
				'dusun'					=>	$_POST['dusun'],
				'rt'					=>	$_POST['rt'],
				'rw'					=>	$_POST['rw'],
				'kelurahan'				=>	$_POST['kelurahan'],
				'nama_ayah'				=>	$_POST['nama_ayah'],
				'tempat_lahir_ayah'		=>	$_POST['tempat_lahir_ayah'],
				'tanggal_lahir_ayah'	=>	$_POST['tanggal_lahir_ayah'],
				'pendidikan_ayah'		=>	$_POST['pendidikan_ayah'],
				'pekerjaan_ayah'		=>	$_POST['pekerjaan_ayah'],
				'penghasilan_ayah'		=>	$_POST['penghasilan_ayah'],
				'nama_ibu'				=>	$_POST['nama_ibu'],
				'tempat_lahir_ibu'		=>	$_POST['tempat_lahir_ibu'],
				'tanggal_lahir_ibu'		=>	$_POST['tanggal_lahir_ibu'],
				'pendidikan_ibu'		=>	$_POST['pendidikan_ibu'],
				'pekerjaan_ibu'			=>	$_POST['pekerjaan_ibu'],
				'penghasilan_ibu'		=>	$_POST['penghasilan_ibu'],
				'tinggi_badan'			=>	$_POST['tinggi_badan'],
				'berat_badan'			=>	$_POST['berat_badan'],
				'jarak_ke_sekolah'		=>	$_POST['jarak_ke_sekolah'],
				'jumlah_saudara'		=>	$_POST['jumlah_saudara'],
				];
		if(isset($foto)){
				$data['foto'] = $foto['file_name'];
			} 
		if ($this->my_update('siswa',$data,['id_siswa'=>$_POST['id_siswa']])) {

		}	else 	{
			echo "error";
		}

	}

	/*
		EDIT DATA
	*/

	public function edit_page($id)
	{
		if (isset($id)) {

				$data['param'] 		= 	$this->arr;
				$data['siswa'] 		= 	$this->my_where('siswa',['id_siswa'=>$id])->row_array();
				$data['kelas']		=	$this->my_where('kelas', [])->result_array();
				$data['jurusan']	=	$this->my_where('jurusan', [])->result_array();
				$data['province']	=	$this->my_where('provinces', [])->result_array();
				$this->my_view(['role/guru/page/siswa/edit_page/index','role/guru/page/siswa/edit_page/js'],$data);
		} else {
			$this->get_data();
		}
	}

	function cetak_page($id)
		{
			if (isset($id)) {
			
				$data['param'] 		= 	$this->arr;
				$data['siswa'] 	= $this->my_where('siswa',['id_siswa'=>$id])->row_array();

				$data['kelas']		=	$this->my_where('kelas', [])->result_array();
				$data['jurusan']	=	$this->my_where('jurusan', [])->result_array();
				$data['province']	=	$this->my_where('provinces', ['id' => $data['siswa']['idprovince_fk']])->row_array();
				$data['city']		=	$this->my_where('cities', ['id' => $data['siswa']['idcities_fk']])->row_array();
				$this->load->view('role/guru/page/siswa/print/print',$data);
			} else {
				$this->get_data();
			}
		}
	/*
		DELETE DATA
	*/

	function hapus()
	{
		foreach ($_POST['data_get'] as $key => $value) {
			$this->db->delete('siswa',['id_siswa'=>$value]);
		}
	}

	/*
		PRINT DATA
	*/
		

	/*
		MANIPULATE DATA
	*/

	public function detail_all($id)
	{
		if (isset($id)) {
			
				$data['param'] 		= 	$this->arr;
				$data['siswa'] 	= $this->my_where('siswa',['id_siswa'=>$id])->row_array();

				$data['kelas']		=	$this->my_where('kelas', [])->result_array();
				$data['jurusan']	=	$this->my_where('jurusan', [])->result_array();
				$data['province']	=	$this->my_where('provinces', ['id' => $data['siswa']['idprovince_fk']])->row_array();
				$data['city']		=	$this->my_where('cities', ['id' => $data['siswa']['idcities_fk']])->row_array();
				$this->my_view(['role/guru/page/siswa/detail_page/index','role/guru/page/siswa/detail_page/js'],$data);
		} else {
			$this->get_data();
		}
		
	}

	public function datatable()
	{

		$data['detail_guru'] = $this->get_guru();
		$_POST['frm']   =   $this->arr;
		$this->db->where('idkelas_fk', $data['detail_guru']['walas']['id_kelas']);
        $list           =   $this->mod_datatable->get_datatables();
        $data           =   array();
        $no             =   $_POST['start'];
        foreach ($list as $field) {
            $no++;
            $row        =   array();
            $row[]      =   '<input type="checkbox" name="get-check" value="'.$field['id_siswa'].'"></input>';
            $row[]		=	'<a href="siswa/detail_all/'.$field['id_siswa'].'" class="app-item">'.strtoupper($field['nama']).'</a>';
            $row[]		=	!empty($field['nisn']) ? $field['nisn'] : '-';
            $row[]		=	!empty($field['nis']) ? $field['nis'] : '-';
            $row[]		=	!empty($field['tempat_lahir']) ? $field['tempat_lahir'] : '-';
            $row[]		=	!empty($field['alamat']) ? $field['alamat'] : '-';
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
	

	function get_cities()
	{
		$dt = $_POST['dt_send'];

		$data = '';
		$get = $this->my_where('cities', ['province_id' => $dt])->result_array();
		foreach ($get as $key => $value) {
			$data .= '<option value="'.$value['id'].'">'.$value['name'].'</option>';
		}

		echo $data;
	}

	function get_cities_update()
	{
		$dt = $_POST['idcities_fk'];

		$data = '';
		$get = $this->my_where('cities', ['id' => $dt])->row_array();
		if($get){
			$data .= '<option selected value="'.$get['id'].'">'.$get['name'].'</option>';
		
		}

		echo $data;
	}

	function get_kelas()
	{
		$id 	= $_POST['id'];
		$get 	= $this->my_where('kelas', ['idjurusan_fk'=>$id])->result_array();
		$send = '<select data-placeholder="Pilih Jurusan terlebih dahulu" name="idkelas_fk" class="select kelas">';
		foreach ($get as $key => $value) {
			$send.='<option value="'.$value['id_kelas'].'">'.$value['kelas'].'</option>';
		}
		$send .='</select>';
		$send .= "<script>$('.select').select2();</script>";

		echo $send;
	}
	public function proses_siswa($value='')
	{
		
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['siswa'] = $this->my_where('v_siswa_jurusan', ['idkelas_fk'=>$_POST['id_kelas']])->result_array(); 
		$data['kelas']	=	$this->my_where('kelas', ['id_kelas'=>$_POST['id_kelas']])->row_array();
		$this->my_view(['role/guru/page/siswa/perkelas/proses_siswa','role/guru/page/siswa/perkelas/js_proses'],$data);
	}

	public function download_file_siswa($id_kelas='')
	{
		$reader = new \PhpOffice\PhpSpreadsheet\Reader\Xlsx();
		$spreadsheet = $reader->load("include/template/excel/format_edit_sisw.xlsx");
		// $spreadsheet = \PhpOffice\PhpSpreadsheet\IOFactory::load();
		$kelas 		=	$this->my_where('kelas', ['id_kelas'=>$id_kelas])->row_array();
		$siswa		=	$this->my_where('siswa', ['idkelas_fk'=>$id_kelas])->result_array();
		//change it
		$sheet = $spreadsheet->getActiveSheet();
		$sheet->setCellValue('A10', $kelas['kelas']);
		$sheet->setCellValue('E10', $kelas['kelas']);
		foreach ($siswa as $key => $value) {
			$sheet->setCellValue('B'.($key+14), $value['nama']);
			$spreadsheet->getActiveSheet()->getStyle('D'.($key+14))->getFont()->getColor()->setARGB(\PhpOffice\PhpSpreadsheet\Style\Color::COLOR_RED);
			$sheet->getStyle('D'.($key+14))->getProtection()->setLocked(\PhpOffice\PhpSpreadsheet\Style\Protection::PROTECTION_PROTECTED);
			$sheet->setCellValue('D'.($key+14), $value['id_siswa']);
		}
		

		//write it again to Filesystem with the same name (=replace)
		$writer = new Xlsx($spreadsheet);
		$fileName = "edit_siswa_".$kelas['kelas'].".xlsx";
		header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment; filename="'. urlencode($fileName).'"');
        $writer->save('php://output');
	}
}