<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class surat_izin_siswa extends MY_Controller {
    

    public $arr = [
            'title'             =>  'Halaman surat_izin_siswa',
            'table'             =>  'surat_izin_siswa',
            'column'            =>  [],
            'column_order'      =>  [ 'id_surat_izin_siswa'],
            'column_search'     =>  [ 'id_surat_izin_siswa'],
            'order'             =>  ['id_surat_izin_siswa'  =>  'DESC'],
            'id'                =>  'id_surat_izin_siswa',
            'parents_link'      =>  'role/guru/page/surat_izin_siswa'
    ];

    /*
        CHANGE PAGE
    */
    public function get_data()
    {
        $data['account']    =   $this->get_user_account();
        $data['param']      =   $this->arr;

        $this->my_view(['role/guru/page_mobile/surat_izin_siswa/index_page/index','role/guru/page_mobile/surat_izin_siswa/index_page/js'],$data);
        
        
    }

    function get_data_request(){
        $data['account']    =   $this->get_user_account();
        $data['param']      =   $this->arr;
        $data['guru']       =   $this->get_guru();
        
        // Query untuk mendapatkan data surat izin
        $data['surat_izin_siswa'] = $this->db->query('select * from surat_izin_siswa where idguru_fk='.$data['guru']['guru']['id_guru'].' order by id_surat_izin_siswa desc limit 10')->result_array();
        
        // Ambil nama siswa untuk setiap surat
        foreach ($data['surat_izin_siswa'] as $key => $surat) {
            $siswa_query = "
                SELECT s.nama 
                FROM detail_surat_izin_siswa d
                JOIN siswa s ON s.id_siswa = d.idsiswa_fk
                WHERE d.idsuratizinsiswa_fk = " . $surat['id_surat_izin_siswa'] . "
                ORDER BY s.nama ASC
                LIMIT 5
            ";
            $siswa_names = $this->db->query($siswa_query)->result_array();
            $data['surat_izin_siswa'][$key]['nama_siswa'] = $siswa_names;
        }
        
        $this->my_view(['role/guru/page_mobile/surat_izin_siswa/index_page/get_data'],$data);
    }

    public function add_page()
    {
        
        $data['account']    =   $this->get_user_account();
        $data['param']      =   $this->arr;
        $data['guru']       =   $this->get_guru();

        
        $this->my_view(['role/guru/page_mobile/surat_izin_siswa/add_page/index','role/guru/page_mobile/surat_izin_siswa/add_page/js'],$data);
    }

    // Method untuk halaman tambah data
    public function tambah_data()
    {
        $data['account'] = $this->get_user_account();
        $data['param'] = $this->arr;
        
        
        $data['guru']       =   $this->get_guru();
        $this->my_view([
            'role/admin/page/surat_izin_siswa/add_page/add',
            'role/admin/page/surat_izin_siswa/add_page/js'
        ], $data);
    }

    // Method untuk proses simpan data
    public function tambah()
    {
        // Set response header untuk JSON
        header('Content-Type: application/json');
        
        $this->db->trans_begin();
        
        try {
            // Validasi input
            if (empty($this->input->post('kegiatan'))) {
                throw new Exception('Kegiatan harus diisi');
            }
            
            if (empty($this->input->post('tempat'))) {
                throw new Exception('Tempat harus diisi');
            }
            
            if (empty($this->input->post('tanggal_mulai'))) {
                throw new Exception('Tanggal mulai harus diisi');
            }
            
            if (empty($this->input->post('tanggal_selesai'))) {
                throw new Exception('Tanggal selesai harus diisi');
            }
            
            if (empty($this->input->post('waktu_mulai'))) {
                throw new Exception('Waktu mulai harus diisi');
            }
            
            if (empty($this->input->post('waktu_selesai'))) {
                throw new Exception('Waktu selesai harus diisi');
            }
            
            // Validasi siswa terpilih
            $siswa_terpilih = $this->input->post('siswa_terpilih');
            if (empty($siswa_terpilih) || !is_array($siswa_terpilih)) {
                throw new Exception('Minimal pilih 1 siswa');
            }
            
            // Validasi tanggal
            $tanggal_mulai = $this->input->post('tanggal_mulai');
            $tanggal_selesai = $this->input->post('tanggal_selesai');
            
            if (strtotime($tanggal_mulai) > strtotime($tanggal_selesai)) {
                throw new Exception('Tanggal mulai tidak boleh lebih besar dari tanggal selesai');
            }
            
            // Validasi waktu jika tanggal sama
            if ($tanggal_mulai === $tanggal_selesai) {
                $waktu_mulai = $this->input->post('waktu_mulai');
                $waktu_selesai = $this->input->post('waktu_selesai');
                
                if (strtotime($waktu_mulai) >= strtotime($waktu_selesai)) {
                    throw new Exception('Waktu selesai harus lebih besar dari waktu mulai');
                }
            }
            
            // Get data guru untuk validasi dan pendamping
            $guru_data = $this->get_guru();
            if (!$guru_data || !isset($guru_data['guru']['id_guru'])) {
                throw new Exception('Data guru tidak ditemukan');
            }
            
            $id_guru = $guru_data['guru']['id_guru'];
            $nama_pendamping = $guru_data['guru']['nama'];
            
            // Insert data surat (tanpa kode)
            $data_surat = [
                'kode' => '', // Kosong sesuai permintaan
                'tanggal_mulai' => $this->input->post('tanggal_mulai'),
                'tanggal_selesai' => $this->input->post('tanggal_selesai'),
                'kegiatan' => trim($this->input->post('kegiatan')),
                'waktu_mulai' => $this->input->post('waktu_mulai'),
                'waktu_selesai' => $this->input->post('waktu_selesai'),
                'tempat' => trim($this->input->post('tempat')),
                'pendamping' => $nama_pendamping, // Auto dari nama guru
                'status' => 'DRAFT', // Default status
                'idguru_fk' => $id_guru
            ];

            $this->db->insert('surat_izin_siswa', $data_surat);
            $id_surat = $this->db->insert_id();

            if (!$id_surat) {
                throw new Exception('Gagal menyimpan data surat');
            }

            // Insert detail siswa
            $berhasil_insert = 0;
            foreach ($siswa_terpilih as $id_siswa) {
                // Validasi siswa exists dan aktif
                $siswa_exists = $this->db->select('id_siswa, nama')
                                        ->where('id_siswa', $id_siswa)
                                        ->where('is_alumni', 0)
                                        ->get('siswa')
                                        ->row_array();
                
                if (!$siswa_exists) {
                    throw new Exception('Data siswa dengan ID ' . $id_siswa . ' tidak valid atau sudah alumni');
                }
                
                $detail_data = [
                    'idsuratizinsiswa_fk' => $id_surat,
                    'idsiswa_fk' => $id_siswa
                ];
                
                $this->db->insert('detail_surat_izin_siswa', $detail_data);
                
                if ($this->db->affected_rows() > 0) {
                    $berhasil_insert++;
                }
            }

            if ($berhasil_insert === 0) {
                throw new Exception('Gagal menyimpan detail siswa');
            }

            // Commit transaction
            $this->db->trans_commit();
            
            echo json_encode([
                'status' => 'success', 
                'message' => 'Data surat izin berhasil ditambahkan',
                'id_surat' => $id_surat,
                'jumlah_siswa' => $berhasil_insert,
                'kegiatan' => $data_surat['kegiatan'],
                'tanggal_mulai' => $data_surat['tanggal_mulai'],
                'tanggal_selesai' => $data_surat['tanggal_selesai']
            ]);
            
        } catch (Exception $e) {
            $this->db->trans_rollback();
            
            echo json_encode([
                'status' => 'error',
                'message' => $e->getMessage()
            ]);
        }
    }

    // Method untuk mendapatkan data siswa dengan pagination dan search
    public function get_siswa()
    {
        // Set response header untuk JSON
        header('Content-Type: application/json');
        
        try {
            $search = $this->input->post('search') ?? '';
            $page = $this->input->post('page') ?? 1;
            $limit = 15; // Increase limit untuk mobile
            $offset = ($page - 1) * $limit;

            // Base query
            $this->db->select('s.id_siswa, s.nama, s.nis, COALESCE(k.kelas, "Belum ada kelas") as kelas')
                    ->from('siswa s')
                    ->join('kelas k', 'k.id_kelas = s.idkelas_fk', 'left')
                    ->where('s.is_alumni', 0);

            // Apply search filter
            if (!empty($search)) {
                $this->db->group_start()
                        ->like('s.nama', $search)
                        ->or_like('s.nis', $search)
                        ->or_like('k.kelas', $search)
                        ->group_end();
            }

            // Count total untuk pagination
            $total_query = clone $this->db;
            $total_rows = $total_query->count_all_results('', FALSE);
            
            // Get data dengan limit dan offset
            $siswa = $this->db->order_by('k.kelas', 'ASC')
                            ->order_by('s.nama', 'ASC')
                            ->limit($limit, $offset)
                            ->get()
                            ->result_array();

            // Format data untuk response
            $formatted_siswa = [];
            foreach ($siswa as $s) {
                $formatted_siswa[] = [
                    'id_siswa' => $s['id_siswa'],
                    'nama' => $s['nama'],
                    'nis' => $s['nis'] ?: 'Tidak ada',
                    'kelas' => $s['kelas']
                ];
            }

            $result = [
                'status' => 'success',
                'data' => $formatted_siswa,
                'total' => $total_rows,
                'current_page' => (int)$page,
                'per_page' => $limit,
                'has_more' => ($offset + $limit) < $total_rows,
                'search' => $search
            ];

            echo json_encode($result);
            
        } catch (Exception $e) {
            echo json_encode([
                'status' => 'error',
                'message' => 'Gagal memuat data siswa: ' . $e->getMessage(),
                'data' => [],
                'total' => 0,
                'current_page' => 1,
                'per_page' => $limit,
                'has_more' => false
            ]);
        }
    }

    // Method untuk mendapatkan detail surat izin
    public function detail($id)
    {
        $data['account'] = $this->get_user_account();
        $data['param'] = $this->arr;
        $data['guru'] = $this->get_guru();
        
        // Get data surat izin
        $data['surat'] = $this->db->select('*')
                                ->where('id_surat_izin_siswa', $id)
                                ->where('idguru_fk', $data['guru']['guru']['id_guru'])
                                ->get('surat_izin_siswa')
                                ->row_array();
        
        if (!$data['surat']) {
            show_404();
            return;
        }
        
        // Get data siswa yang terkait
        $data['siswa_list'] = $this->db->select('s.nama, s.nis, k.kelas')
                                     ->from('detail_surat_izin_siswa d')
                                     ->join('siswa s', 's.id_siswa = d.idsiswa_fk')
                                     ->join('kelas k', 'k.id_kelas = s.idkelas_fk', 'left')
                                     ->where('d.idsuratizinsiswa_fk', $id)
                                     ->order_by('s.nama', 'ASC')
                                     ->get()
                                     ->result_array();
        
        $this->my_view([
            'role/guru/page_mobile/surat_izin_siswa/detail_page/index',
            'role/guru/page_mobile/surat_izin_siswa/detail_page/js'
        ], $data);
    }

    // Method untuk edit status surat
    public function update_status()
    {
        header('Content-Type: application/json');
        
        try {
            $id_surat = $this->input->post('id_surat');
            $status = $this->input->post('status');
            $guru_data = $this->get_guru();
            
            if (!$id_surat || !$status) {
                throw new Exception('Parameter tidak lengkap');
            }
            
            // Validasi surat milik guru ini
            $surat_exists = $this->db->where('id_surat_izin_siswa', $id_surat)
                                   ->where('idguru_fk', $guru_data['guru']['id_guru'])
                                   ->get('surat_izin_siswa')
                                   ->row_array();
            
            if (!$surat_exists) {
                throw new Exception('Surat tidak ditemukan atau bukan milik Anda');
            }
            
            // Valid status values
            $valid_status = ['DRAFT', 'DIAJUKAN', 'DISETUJUI', 'DITOLAK'];
            if (!in_array($status, $valid_status)) {
                throw new Exception('Status tidak valid');
            }
            
            // Update status
            $update_data = [
                'status' => $status
            ];
            
            if ($status === 'DIAJUKAN') {
                $update_data['tanggal_pengajuan'] = date('Y-m-d H:i:s');
            }
            
            $this->db->where('id_surat_izin_siswa', $id_surat)
                    ->update('surat_izin_siswa', $update_data);
            
            if ($this->db->affected_rows() > 0) {
                echo json_encode([
                    'status' => 'success',
                    'message' => 'Status surat berhasil diupdate menjadi ' . $status
                ]);
            } else {
                throw new Exception('Gagal mengupdate status');
            }
            
        } catch (Exception $e) {
            echo json_encode([
                'status' => 'error',
                'message' => $e->getMessage()
            ]);
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

}