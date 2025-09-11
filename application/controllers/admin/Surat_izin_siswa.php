<?php
defined('BASEPATH') OR exit('No direct script access allowed');
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class surat_izin_siswa extends MY_Controller {

	public $arr = [
		'title'				=>	'Halaman surat izin siswa',
		'table'				=>	'surat_izin_siswa',
		'column'			=>	['kode','tempat','pendamping','waktu_selesai', 'waktu_mulai','tanggal_mulai','tanggal_surat','tanggal_selesai','kegiatan'],
		'column_order'		=>	[ 'id_surat_izin_siswa','kode','tempat','pendamping','waktu_selesai', 'waktu_mulai','tanggal_mulai','tanggal_surat','tanggal_selesai','kegiatan'],
		'column_search'		=>	[ 'id_surat_izin_siswa','kode','tempat','pendamping','waktu_selesai', 'waktu_mulai','tanggal_mulai','tanggal_surat','tanggal_selesai','kegiatan'],
		'order'				=>	['id_surat_izin_siswa'	=>	'DESC'],
		'id'				=>	'id_surat_izin_siswa'
	];

	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$this->my_view(['role/admin/page/surat_izin_siswa/index_page/modal','role/admin/page/surat_izin_siswa/index_page/index','role/admin/page/surat_izin_siswa/index_page/js'],$data);
	}

	/*
		MANIPULATE DATA
	*/
	public function datatable()
	{
		if ($_POST['tanggal_mulai'] != '') {
			$this->db->where('tanggal_mulai >=',$_POST['tanggal_mulai']);
		}
		if ($_POST['tanggal_selesai'] != '') {
			$this->db->where('tanggal_selesai <=',$_POST['tanggal_selesai']);
		}
		$_POST['frm']   =   $this->arr;
		$list           =   $this->mod_datatable->get_datatables();
		$data           =   array();
		$no             =   $_POST['start'];
		foreach ($list as $field) {
			$no++;
			$row        =   array();
			$row[]      =   '<input type="checkbox" name="get-check" value="'.$field['id_surat_izin_siswa'].'"></input>';
			$row[]		=	'<b>'.strtoupper($field['kode']).'</b>';
			$row[]		=	date('d/m/Y', strtotime($field['tanggal_mulai']));
			$row[]		=	date('d/m/Y', strtotime($field['tanggal_selesai']));
			$row[]		=	$field['kegiatan'];
			$row[]		=	$field['tempat'];
			$row[]		=	$field['pendamping'];
			
			// Status dengan badge
			if($field['status'] == "DITERIMA") {
				$row[] = '<span class="label label-success">DITERIMA</span>';
			} else if($field['status'] == "DITOLAK") {
				$row[] = '<span class="label label-danger">DITOLAK</span>';
			} else {
				$row[] = '<span class="label label-default">DRAFT</span>';
			}
			
			// Kolom Aksi - tombol cetak PDF hanya untuk status DITERIMA
			$aksi = '';
			if($field['status'] == "DITERIMA") {
				$aksi = '<div class="btn-group">
							<a href="'.base_url('admin/Surat_izin_siswa/cetak_pdf/'.$field['id_surat_izin_siswa']).'" 
							target="_blank" 
							class="btn btn-xs btn-danger" 
							title="Cetak PDF">
							<i class="icon-file-pdf"></i> PDF
							</a>
						</div>';
			} else {
				$aksi = '<span class="text-muted"><i class="icon-lock"></i> Terkunci</span>';
			}
			$row[] = $aksi;
			
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

	public function tambah()
	{
		$data = [
			'kode' => $this->input->post('kode'),
			'tanggal_mulai' => $this->input->post('tanggal_mulai'),
			'tanggal_selesai' => $this->input->post('tanggal_selesai'),
			'kegiatan' => $this->input->post('kegiatan'),
			'waktu_mulai' => $this->input->post('waktu_mulai'),
			'waktu_selesai' => $this->input->post('waktu_selesai'),
			'tempat' => $this->input->post('tempat'),
			'pendamping' => $this->input->post('pendamping'),
			'status' => $this->input->post('status')
		];

		$this->db->insert('surat_izin_siswa', $data);
		$id_surat = $this->db->insert_id();

		// Insert siswa yang dipilih
		$siswa_terpilih = $this->input->post('siswa_terpilih');
		if ($siswa_terpilih) {
			foreach ($siswa_terpilih as $id_siswa) {
				$detail_data = [
					'idsuratizinsiswa_fk' => $id_surat,
					'idsiswa_fk' => $id_siswa
				];
				$this->db->insert('detail_surat_izin_siswa', $detail_data);
			}
		}

		echo json_encode(['status' => 'success', 'message' => 'Data berhasil ditambahkan']);
	}

	public function edit()
	{
		$id = $this->input->post('id_surat_izin_siswa');
		$data = [
			'kode' => $this->input->post('kode'),
			'tanggal_mulai' => $this->input->post('tanggal_mulai'),
			'tanggal_selesai' => $this->input->post('tanggal_selesai'),
			'kegiatan' => $this->input->post('kegiatan'),
			'waktu_mulai' => $this->input->post('waktu_mulai'),
			'waktu_selesai' => $this->input->post('waktu_selesai'),
			'tempat' => $this->input->post('tempat'),
			'pendamping' => $this->input->post('pendamping'),
			'status' => $this->input->post('status')
		];

		$this->db->where('id_surat_izin_siswa', $id)->update('surat_izin_siswa', $data);

		// Hapus detail lama
		$this->db->where('idsuratizinsiswa_fk', $id)->delete('detail_surat_izin_siswa');

		// Insert detail baru
		$siswa_terpilih = $this->input->post('siswa_terpilih');
		if ($siswa_terpilih) {
			foreach ($siswa_terpilih as $id_siswa) {
				$detail_data = [
					'idsuratizinsiswa_fk' => $id,
					'idsiswa_fk' => $id_siswa
				];
				$this->db->insert('detail_surat_izin_siswa', $detail_data);
			}
		}

		// Kirim notifikasi WhatsApp jika status DITERIMA
		if ($this->input->post('status') == 'DITERIMA') {
			$guru = $this->my_where('guru', ["id_guru"=>$this->get_user_account()['anggota_id']])->row_array();
			
			// Ambil data siswa yang terkait
			$siswa_names = $this->db->select('s.nama')
									->from('siswa s')
									->join('detail_surat_izin_siswa ds', 'ds.idsiswa_fk = s.id_siswa')
									->where('ds.idsuratizinsiswa_fk', $id)
									->get()->result_array();
			
			$daftar_siswa = array_map(function($siswa) {
				return $siswa['nama'];
			}, $siswa_names);
			
			$siswa_string = implode(', ', $daftar_siswa);
			
			$msg = "Surat Izin Siswa oleh ".$guru['nama'].": \n\n"
				. "\tKode Surat \t\t: " . str_pad($this->input->post('kode'), 40) . "\n"
				. "\tKegiatan \t\t\t: " . str_pad($this->input->post('kegiatan'), 40) . "\n"
				. "\tTanggal \t\t\t: " . str_pad(date('d/m/Y', strtotime($this->input->post('tanggal_mulai'))) . ' - ' . date('d/m/Y', strtotime($this->input->post('tanggal_selesai'))), 40) . "\n"
				. "\tTempat \t\t\t: " . str_pad($this->input->post('tempat'), 40) . "\n"
				. "\tPendamping \t\t: " . str_pad($this->input->post('pendamping'), 40) . "\n"
				. "\tSiswa \t\t\t: " . str_pad($siswa_string, 40) . "\n\n"
				. "Status: DITERIMA\n\n"
				. "Hardfile dapat diambil di Admin Kesiswaan atau TU.\n"
				. "Softfile dapat didownload melalui aplikasi.";

			$this->bot_wa($guru['no_hp'], $msg, 'surat_izin_siswa', $id, 'guru');
		}

		echo json_encode(['status' => 'success', 'message' => 'Data berhasil diupdate']);
	}

	public function hapus()
	{
		$ids = $this->input->post('data_get');
		foreach ($ids as $id) {
			// Hapus detail terlebih dahulu
			$this->db->where('idsuratizinsiswa_fk', $id)->delete('detail_surat_izin_siswa');
			// Hapus surat izin
			$this->db->where('id_surat_izin_siswa', $id)->delete('surat_izin_siswa');
		}
		echo json_encode(['status' => 'success', 'message' => 'Data berhasil dihapus']);
	}

	// Method untuk mendapatkan daftar siswa via AJAX dengan pencarian
	public function get_siswa()
	{
		$search = $this->input->post('search') ?? '';
		$page = $this->input->post('page') ?? 1;
		$limit = 10; // Batasi 10 siswa per halaman
		$offset = ($page - 1) * $limit;

		$this->db->select('s.id_siswa, s.nama, k.kelas')
				 ->from('siswa s')
				 ->join('kelas k', 'k.id_kelas = s.idkelas_fk')
				 ->where('s.is_alumni', 0);

		if (!empty($search)) {
			$this->db->group_start()
					 ->like('s.nama', $search)
					 ->or_like('k.kelas', $search)
					 ->group_end();
		}

		// Count total untuk pagination
		$total_rows = $this->db->count_all_results('', FALSE);
		
		$siswa = $this->db->limit($limit, $offset)->get()->result_array();

		$result = [
			'data' => $siswa,
			'total' => $total_rows,
			'has_more' => ($offset + $limit) < $total_rows
		];

		echo json_encode($result);
	}

	// Method untuk mendapatkan data edit via AJAX
	public function get_data_edit()
	{
		$id = $this->input->post('id');
		$surat = $this->db->where('id_surat_izin_siswa', $id)->get('surat_izin_siswa')->row_array();
		$siswa_terpilih = $this->db->select('s.id_siswa, s.nama, k.kelas')
							->from('siswa s')
							->join('detail_surat_izin_siswa ds', 'ds.idsiswa_fk = s.id_siswa')
							->join('kelas k', 'k.id_kelas = s.idkelas_fk')
							->where('ds.idsuratizinsiswa_fk', $id)
							->get()->result_array();
		
		$result = [
			'surat' => $surat,
			'siswa_terpilih' => $siswa_terpilih
		];
		
		echo json_encode($result);
	}

	// Method untuk mendapatkan siswa berdasarkan ID (untuk keperluan edit)
	public function get_siswa_by_ids()
	{
		$ids = $this->input->post('ids');
		if (!empty($ids)) {
			$this->db->select('s.id_siswa, s.nama, k.kelas')
					 ->from('siswa s')
					 ->join('kelas k', 'k.id_kelas = s.idkelas_fk')
					 ->where_in('s.id_siswa', $ids);
			
			$siswa = $this->db->get()->result_array();
			echo json_encode($siswa);
		} else {
			echo json_encode([]);
		}
	}

	public function cetak_pdf($id)
    {
        // Cek apakah data ada dan statusnya DITERIMA
        $surat = $this->db->where('id_surat_izin_siswa', $id)->get('surat_izin_siswa')->row_array();
        
        if (!$surat) {
            show_404();
            return;
        }
        
        if ($surat['status'] != 'DITERIMA') {
            $this->session->set_flashdata('error', 'Hanya surat dengan status DITERIMA yang dapat dicetak!');
            redirect('surat_izin_siswa');
            return;
        }
        
        // Ambil data siswa yang terkait
        $siswa_list = $this->db->select('s.nama, k.kelas')
                               ->from('siswa s')
                               ->join('detail_surat_izin_siswa ds', 'ds.idsiswa_fk = s.id_siswa')
                               ->join('kelas k', 'k.id_kelas = s.idkelas_fk')
                               ->where('ds.idsuratizinsiswa_fk', $id)
                               ->order_by('s.nama', 'ASC')
                               ->get()->result_array();
        
        // Load library PDF (contoh menggunakan TCPDF atau DOMPDF)
        $this->load->library('pdf');
        
        $data = [
            'surat' => $surat,
            'siswa_list' => $siswa_list
        ];
        
        // Generate HTML content
        $html = $this->load->view('role/admin/page/surat_izin_siswa/print/pdf_content', $data, true);
        
        // Konfigurasi PDF
        $this->pdf->loadHtml($html);
        $this->pdf->setPaper('A4', 'portrait');
        $this->pdf->render();
        
        // Output PDF
        $filename = 'Surat_Izin_' . $surat['kode'] . '_' . date('Y-m-d') . '.pdf';
        $this->pdf->stream($filename, array("Attachment" => false)); // false = preview, true = download
    }

	public function generate_kode()
	{
		// Ambil bulan dan tahun saat ini
		$bulan_angka = date('n'); // 1-12
		$tahun = date('Y');
		
		// Array untuk konversi bulan ke romawi
		$bulan_romawi = [
			1 => 'I', 2 => 'II', 3 => 'III', 4 => 'IV', 
			5 => 'V', 6 => 'VI', 7 => 'VII', 8 => 'VIII',
			9 => 'IX', 10 => 'X', 11 => 'XI', 12 => 'XII'
		];
		
		// Ambil nomor urut terakhir di bulan ini
		$this->db->select('kode');
		$this->db->where('MONTH(tanggal_mulai)', date('n'));
		$this->db->where('YEAR(tanggal_mulai)', date('Y'));
		$this->db->where('status', 'DITERIMA'); // Hanya hitung yang sudah DITERIMA
		$this->db->order_by('id_surat_izin_siswa', 'DESC');
		$this->db->limit(1);
		$last_record = $this->db->get('surat_izin_siswa')->row_array();
		
		$nomor_urut = 1; // Default jika belum ada data
		
		if ($last_record && !empty($last_record['kode'])) {
			// Extract nomor urut dari kode terakhir
			$parts = explode('/', $last_record['kode']);
			if (count($parts) >= 1 && is_numeric($parts[0])) {
				$last_number = intval($parts[0]);
				$nomor_urut = $last_number + 1;
			}
		}
		
		// Format nomor urut dengan leading zero (3 digit)
		$nomor_format = str_pad($nomor_urut, 3, '0', STR_PAD_LEFT);
		
		// Generate kode lengkap
		$kode = $nomor_format . '/104.26/SPm/SMK.IT/' . $bulan_romawi[$bulan_angka] . '/' . $tahun;
		
		echo json_encode([
			'status' => 'success',
			'kode' => $kode,
			'message' => 'Kode berhasil di-generate'
		]);
	}
    
}