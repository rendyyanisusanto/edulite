<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class skl extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman skl',
			'table'				=>	'skl',
			'column'			=>	['skl'],
			'column_order'		=>	[ 'id_skl','skl'],
			'column_search'		=>	[ 'id_skl','skl'],
			'order'				=>	['id_skl'	=>	'DESC'],
			'id'				=>	'id_skl'
	];

	/*
		CHANGE PAGE
	*/

	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/admin/page/skl/index_page/index','role/admin/page/skl/index_page/js'],$data);
	}
    
    function get_alumni(){
        $tahun_lulus = $_POST['tahun_lulus'];
		$data['param'] 		= 	$this->arr;

        $data['alumni'] =   $this->db->query('select * from siswa where is_alumni=1 and tahun_lulus="'.$tahun_lulus.'"')->result_array();

        
		$this->my_view(['role/admin/page/skl/index_page/index_alumni'],$data);
    }

    public function simpan_data() {
        // Validasi input POST
        $id_siswa    = $this->input->post('id_siswa');
        $kode        = $this->input->post('kode_akses');
        $status      = $this->input->post('status');
        $keterangan  = $this->input->post('keterangan');

        // Folder penyimpanan
        $upload_path = FCPATH . 'include/skl/';
        if (!is_dir($upload_path)) {
            mkdir($upload_path, 0777, true);
        }

        // Siapkan default nilai untuk file
        $file_name_db = null;

        // Upload file
        if (!empty($_FILES['file_skl']['name'])) {
            $file_ext = pathinfo($_FILES['file_skl']['name'], PATHINFO_EXTENSION);
            $safe_name = 'skl_' . $id_siswa . '_' . time() . '.' . $file_ext;
            $target_path = $upload_path . $safe_name;

            if (move_uploaded_file($_FILES['file_skl']['tmp_name'], $target_path)) {
                $file_name_db = $safe_name;
            } else {
                echo json_encode(['status' => false, 'message' => 'Upload file gagal']);
                return;
            }
        }

        // Data yang akan disimpan
        $data = [
            'idsiswa_fk'     => $id_siswa,
            'kode'           => $kode,
            'file'           => $file_name_db,
            'download_count' => 0,
            'status'         => $status,
            'keterangan'     => $keterangan,
        ];

        $this->db->insert('skl', $data);

        echo json_encode(['status' => true, 'message' => 'Data berhasil disimpan']);
    }
}