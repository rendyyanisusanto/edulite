<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class Presensi_RFID extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman siswa_kelas',
			'table'				=>	'presensi_RFID',
			'column'			=>	[ 'siswa_kelas'],
			'column_order'		=>	[ 'id_siswa_kelas','siswa_kelas'],
			'column_search'		=>	[ 'id_siswa_kelas','siswa_kelas'],
			'order'				=>	['id_siswa_kelas'	=>	'DESC'],
			'id'				=>	'id_siswa_kelas'
	];

	/*
		CHANGE PAGE
	*/
    public function get_data(){
        $this->my_view(['role/admin/page/presensi_RFID/index_page/index','role/admin/page/presensi_RFID/index_page/js'],$data);
    }
	public function rekap()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
		$data['tahun_ajaran']		=	$this->my_where('tahun_ajaran', [])->result_array();
		$data['mata_pelajaran']		=	$this->my_where('mata_pelajaran', [])->result_array();
		$data['kelas']		=	$this->my_where('kelas', [])->result_array();
		$this->my_view(['role/admin/page/presensi_RFID/rekap/index','role/admin/page/presensi_RFID/rekap/js'],$data);
	}

    public function laporan_harian()
    {
        $data['account']    =   $this->get_user_account();
        $data['param']      =   $this->arr;
        // Kelas untuk filter
        $data['kelas']      =   $this->my_where('kelas', [])->result_array();
        
        $this->my_view(['role/admin/page/presensi_RFID/laporan_harian/index','role/admin/page/presensi_RFID/laporan_harian/js'],$data);
    }

    public function laporan_mingguan()
    {
        $data['account']    =   $this->get_user_account();
        $data['param']      =   $this->arr;
        $data['kelas']      =   $this->my_where('kelas', [])->result_array();

        $this->my_view(['role/admin/page/presensi_RFID/laporan_mingguan/index','role/admin/page/presensi_RFID/laporan_mingguan/js'],$data);
    }
    
    public function laporan_bulanan()
    {
        $data['account']    =   $this->get_user_account();
        $data['param']      =   $this->arr;
        $data['kelas']      =   $this->my_where('kelas', [])->result_array();

        $this->my_view(['role/admin/page/presensi_RFID/laporan_bulanan/index','role/admin/page/presensi_RFID/laporan_bulanan/js'],$data);
    }
    
    public function tidak_masuk_harian()
    {
        $data['account']    =   $this->get_user_account();
        $data['param']      =   $this->arr;
        $data['kelas']      =   $this->my_where('kelas', [])->result_array();

        $this->my_view(['role/admin/page/presensi_RFID/tidak_masuk_harian/index','role/admin/page/presensi_RFID/tidak_masuk_harian/js'],$data);
    }

    public function tidak_masuk_berturut()
    {
        $data['account']    =   $this->get_user_account();
        $data['param']      =   $this->arr;
        $data['kelas']      =   $this->my_where('kelas', [])->result_array();

        $this->my_view(['role/admin/page/presensi_RFID/tidak_masuk_berturut/index','role/admin/page/presensi_RFID/tidak_masuk_berturut/js'],$data);
    }
    
    public function izin_keluar_harian()
    {
        $data['account']    =   $this->get_user_account();
        $data['param']      =   $this->arr;
        $data['kelas']      =   $this->my_where('kelas', [])->result_array();

        $this->my_view(['role/admin/page/presensi_RFID/izin_keluar_harian/index','role/admin/page/presensi_RFID/izin_keluar_harian/js'],$data);
    }

    public function izin_keluar_bulanan()
    {
        $data['account']    =   $this->get_user_account();
        $data['param']      =   $this->arr;
        $data['kelas']      =   $this->my_where('kelas', [])->result_array();

        $this->my_view(['role/admin/page/presensi_RFID/izin_keluar_bulanan/index','role/admin/page/presensi_RFID/izin_keluar_bulanan/js'],$data);
    }
    
    // API (SPA) untuk mengambil data laporan harian per kelas dan tanggal
    public function proses_laporan_harian()
    {
        $tanggal = $this->input->post('tanggal');
        $id_kelas = $this->input->post('kelas');

        if (!$tanggal || !$id_kelas) {
            // Kembalikan tbody kosong dengan pesan
            $data['rows'] = [];
            $data['message'] = 'Silakan pilih tanggal dan kelas.';
            $this->my_view(['role/admin/page/presensi_RFID/laporan_harian/result'], $data);
        }

        // Query agregasi per siswa untuk 1 hari
        $sql = "
            SELECT 
                s.id_siswa,
                s.nama,
                s.nis,
                ? AS tanggal,
                MIN(CASE WHEN pr.status = 'MASUK' THEN pr.waktu END) AS jam_masuk,
                (
                    SELECT COUNT(*) FROM presensi_rfid pr2
                    WHERE pr2.idsiswa_fk = s.id_siswa AND pr2.tanggal = ? AND pr2.status = 'IJIN KELUAR'
                ) AS jumlah_ijin,
                MAX(CASE WHEN pr.status = 'PULANG' THEN pr.waktu END) AS jam_pulang,
                (
                    SELECT status FROM presensi_rfid 
                    WHERE idsiswa_fk = s.id_siswa AND tanggal = ? 
                    ORDER BY waktu DESC LIMIT 1
                ) AS status_akhir
            FROM siswa s
            LEFT JOIN presensi_rfid pr ON pr.idsiswa_fk = s.id_siswa AND pr.tanggal = ?
            WHERE s.idkelas_fk = ?
            GROUP BY s.id_siswa, s.nama, s.nis
            ORDER BY s.nama ASC
        ";

        $rows = $this->db->query($sql, [
            $tanggal, // select column tanggal
            $tanggal, // subquery jumlah ijin
            $tanggal, // subquery status akhir
            $tanggal, // left join filter tanggal
            $id_kelas
        ])->result_array();

        // Normalisasi nilai null menjadi '-'
        foreach ($rows as &$r) {
            $r['jam_masuk'] = $r['jam_masuk'] ? substr($r['jam_masuk'], 0, 5) : '-';
            $r['jumlah_ijin'] = isset($r['jumlah_ijin']) ? (int)$r['jumlah_ijin'] : 0;
            $r['jam_pulang'] = $r['jam_pulang'] ? substr($r['jam_pulang'], 0, 5) : '-';
            $r['status_akhir'] = $r['status_akhir'] ? ucwords(strtolower($r['status_akhir'])) : 'Tidak Masuk';
        }
        unset($r);

        $data['rows'] = $rows;
        $data['message'] = empty($rows) ? 'Tidak ada data untuk filter ini.' : '';
        $this->my_view(['role/admin/page/presensi_RFID/laporan_harian/result'], $data);
    }

    // API (SPA) laporan mingguan per kelas
    public function proses_laporan_mingguan()
    {
        $tanggal_mulai = $this->input->post('tanggal_mulai');
        $id_kelas = $this->input->post('kelas');

        if (!$tanggal_mulai || !$id_kelas) {
            $data['rows'] = [];
            $data['hari_cols'] = ['Senin','Selasa','Rabu','Kamis','Jumat','Sabtu'];
            $data['summary'] = ['total_hadir' => 0, 'total_tidak_hadir' => 0];
            return $this->my_view(['role/admin/page/presensi_RFID/laporan_mingguan/result'], $data);
        }

        // Siapkan range 6 hari (Senin-Sabtu) dari tanggal_mulai
        $start = new DateTime($tanggal_mulai);
        $dates = [];
        for ($i = 0; $i < 6; $i++) {
            $d = clone $start; $d->modify("+{$i} day");
            $dates[] = $d->format('Y-m-d');
        }

        // Ambil siswa kelas
        $siswa = $this->db->select('id_siswa, nama, nis')
                          ->from('siswa')
                          ->where('idkelas_fk', $id_kelas)
                          ->order_by('nama','ASC')
                          ->get()->result_array();

        $rows = [];
        $total_hadir_kelas = 0;
        $total_tidak_hadir_kelas = 0;

        if (!empty($siswa)) {
            $ids = array_column($siswa, 'id_siswa');
            // Ambil presensi 1 pekan untuk siswa di kelas ini
            $presensi = [];
            if (!empty($ids)) {
                $this->db->select('idsiswa_fk, tanggal, status');
                $this->db->from('presensi_rfid');
                $this->db->where_in('idsiswa_fk', $ids);
                $this->db->where('tanggal >=', $dates[0]);
                $this->db->where('tanggal <=', end($dates));
                $result = $this->db->get()->result_array();
                foreach ($result as $p) {
                    $key = $p['idsiswa_fk'].'|'.$p['tanggal'];
                    if (!isset($presensi[$key])) $presensi[$key] = ['hadir' => false, 'izin' => 0];
                    // Hadir = ada presensi apapun
                    $presensi[$key]['hadir'] = true;
                    if ($p['status'] === 'IJIN KELUAR') {
                        $presensi[$key]['izin'] += 1;
                    }
                }
            }

            // Bentuk baris per siswa
            foreach ($siswa as $s) {
                $row = [
                    'id_siswa' => $s['id_siswa'],
                    'nama' => $s['nama'],
                    'nis' => $s['nis'],
                    'hari' => [],
                    'total_hadir' => 0,
                    'total_izin' => 0,
                    'total_tidak_hadir' => 0,
                ];

                foreach ($dates as $d) {
                    $key = $s['id_siswa'].'|'.$d;
                    $hadir = isset($presensi[$key]) ? ($presensi[$key]['hadir'] === true) : false;
                    $izin = isset($presensi[$key]) ? (int)$presensi[$key]['izin'] : 0;
                    $row['hari'][$d] = [
                        'hadir' => $hadir,
                        'izin' => $izin,
                    ];
                    if ($hadir) {
                        $row['total_hadir']++;
                        $total_hadir_kelas++;
                    } else {
                        $row['total_tidak_hadir']++;
                        $total_tidak_hadir_kelas++;
                    }
                    $row['total_izin'] += $izin;
                }

                $rows[] = $row;
            }
        }

        $data['rows'] = $rows;
        $data['dates'] = $dates; // untuk mapping kolom
        // Label hari tetap Senin-Sabtu (asumsi tanggal_mulai = Senin)
        $data['hari_cols'] = ['Senin','Selasa','Rabu','Kamis','Jumat','Sabtu'];
        $data['summary'] = [
            'total_hadir' => $total_hadir_kelas,
            'total_tidak_hadir' => $total_tidak_hadir_kelas,
        ];

        return $this->my_view(['role/admin/page/presensi_RFID/laporan_mingguan/result'], $data);
    }

    // API (SPA) laporan bulanan per kelas
    public function proses_laporan_bulanan()
    {
        $bulan = $this->input->post('bulan'); // format: YYYY-MM
        $id_kelas = $this->input->post('kelas');

        if (!$bulan || !$id_kelas) {
            $data['rows'] = [];
            $data['summary'] = ['total_hadir' => 0, 'total_tidak_hadir' => 0];
            return $this->my_view(['role/admin/page/presensi_RFID/laporan_bulanan/result'], $data);
        }

        // Tentukan tanggal awal-akhir bulan
        $start = DateTime::createFromFormat('Y-m', $bulan);
        if (!$start) {
            // fallback jika input mengandung hari
            $tmp = DateTime::createFromFormat('Y-m-d', $bulan.'-01');
            $start = $tmp ?: new DateTime(date('Y-m-01'));
        }
        $start->modify('first day of this month');
        $end = clone $start;
        $end->modify('last day of this month');

        // Daftar hari sekolah (Senin-Sabtu) di bulan ini
        $schoolDays = [];
        $it = clone $start;
        while ($it <= $end) {
            $dow = (int)$it->format('N'); // 1=Mon .. 7=Sun
            if ($dow >= 1 && $dow <= 6) { // Mon-Sat
                $schoolDays[] = $it->format('Y-m-d');
            }
            $it->modify('+1 day');
        }

        // Ambil siswa di kelas
        $siswa = $this->db->select('id_siswa, nama, nis')
                          ->from('siswa')
                          ->where('idkelas_fk', $id_kelas)
                          ->order_by('nama','ASC')
                          ->get()->result_array();

        $rows = [];
        $total_hadir_kelas = 0;
        $total_tidak_hadir_kelas = 0;

        if (!empty($siswa)) {
            $ids = array_column($siswa, 'id_siswa');
            // Ambil presensi untuk rentang bulan ini
            $presensi = [];
            if (!empty($ids)) {
                $this->db->select('idsiswa_fk, tanggal, status');
                $this->db->from('presensi_rfid');
                $this->db->where_in('idsiswa_fk', $ids);
                $this->db->where('tanggal >=', $start->format('Y-m-d'));
                $this->db->where('tanggal <=', $end->format('Y-m-d'));
                $result = $this->db->get()->result_array();
                foreach ($result as $p) {
                    $key = $p['idsiswa_fk'].'|'.$p['tanggal'];
                    if (!isset($presensi[$key])) $presensi[$key] = ['hadir' => false, 'izin' => 0];
                    // Hadir jika ada presensi apapun
                    $presensi[$key]['hadir'] = true;
                    if ($p['status'] === 'IJIN KELUAR') {
                        $presensi[$key]['izin'] += 1;
                    }
                }
            }

            // Hitung per siswa
            foreach ($siswa as $s) {
                $hadir = 0; $izin = 0; $tidak = 0;
                foreach ($schoolDays as $d) {
                    $key = $s['id_siswa'].'|'.$d;
                    if (isset($presensi[$key]) && $presensi[$key]['hadir']) {
                        $hadir++;
                        $izin += (int)$presensi[$key]['izin'];
                    } else {
                        $tidak++;
                    }
                }
                $rows[] = [
                    'nama' => $s['nama'],
                    'nis' => $s['nis'],
                    'total_hadir' => $hadir,
                    'total_izin' => $izin,
                    'total_tidak_hadir' => $tidak,
                ];
                $total_hadir_kelas += $hadir;
                $total_tidak_hadir_kelas += $tidak;
            }
        }

        $data['rows'] = $rows;
        $data['summary'] = [
            'total_hadir' => $total_hadir_kelas,
            'total_tidak_hadir' => $total_tidak_hadir_kelas,
        ];

        return $this->my_view(['role/admin/page/presensi_RFID/laporan_bulanan/result'], $data);
    }

    // API (SPA) santri yang tidak masuk (belum tap sama sekali) pada tanggal tsb
    public function proses_tidak_masuk_harian()
    {
        $tanggal = $this->input->post('tanggal');
        $id_kelas = $this->input->post('kelas');

        if (!$tanggal || !$id_kelas) {
            $data['rows'] = [];
            $data['message'] = 'Silakan pilih tanggal dan kelas.';
            return $this->my_view(['role/admin/page/presensi_RFID/tidak_masuk_harian/result'], $data);
        }

        // Ambil santri yang TIDAK punya catatan presensi apapun pada tanggal tsb
        $sql = "
            SELECT s.id_siswa, s.nama, s.nis, k.kelas
            FROM siswa s
            JOIN kelas k ON k.id_kelas = s.idkelas_fk
            WHERE s.idkelas_fk = ?
              AND NOT EXISTS (
                  SELECT 1 FROM presensi_rfid pr
                  WHERE pr.idsiswa_fk = s.id_siswa AND pr.tanggal = ?
              )
            ORDER BY s.nama ASC
        ";
        $rows = $this->db->query($sql, [$id_kelas, $tanggal])->result_array();

        $data['rows'] = $rows;
        $data['tanggal'] = $tanggal;
        $data['message'] = empty($rows) ? 'Semua santri telah tercatat hadir/ada aktivitas presensi.' : '';
        return $this->my_view(['role/admin/page/presensi_RFID/tidak_masuk_harian/result'], $data);
    }

    // API (SPA) deteksi santri tidak masuk N hari berturut-turut dalam rentang tanggal
    public function proses_tidak_masuk_berturut()
    {
        $tanggal_mulai = $this->input->post('tanggal_mulai');
        $tanggal_selesai = $this->input->post('tanggal_selesai');
        $id_kelas = $this->input->post('kelas');
        $min_berturut = (int)$this->input->post('min_berturut');
        if ($min_berturut <= 0) $min_berturut = 3; // default 3 hari

        if (!$tanggal_mulai || !$tanggal_selesai || !$id_kelas) {
            $data['rows'] = [];
            $data['message'] = 'Silakan pilih tanggal mulai, tanggal selesai, dan kelas.';
            return $this->my_view(['role/admin/page/presensi_RFID/tidak_masuk_berturut/result'], $data);
        }

        // Bangun daftar hari sekolah (Senin-Sabtu) pada rentang
        $start = new DateTime($tanggal_mulai);
        $end = new DateTime($tanggal_selesai);
        if ($end < $start) { $tmp = $start; $start = $end; $end = $tmp; }

        $dates = [];
        $it = clone $start;
        while ($it <= $end) {
            $dow = (int)$it->format('N');
            if ($dow >= 1 && $dow <= 6) {
                $dates[] = $it->format('Y-m-d');
            }
            $it->modify('+1 day');
        }

        if (empty($dates)) {
            $data['rows'] = [];
            $data['message'] = 'Rentang tanggal tidak memiliki hari sekolah (Senin–Sabtu).';
            return $this->my_view(['role/admin/page/presensi_RFID/tidak_masuk_berturut/result'], $data);
        }

        // Ambil siswa kelas
        $siswa = $this->db->select('s.id_siswa, s.nama, s.nis, k.kelas')
                          ->from('siswa s')
                          ->join('kelas k', 'k.id_kelas = s.idkelas_fk')
                          ->where('s.idkelas_fk', $id_kelas)
                          ->order_by('s.nama','ASC')
                          ->get()->result_array();

        $rows = [];
        if (!empty($siswa)) {
            $ids = array_column($siswa, 'id_siswa');
            // Ambil presensi selama rentang
            $presensi = [];
            if (!empty($ids)) {
                $this->db->select('idsiswa_fk, tanggal');
                $this->db->from('presensi_rfid');
                $this->db->where_in('idsiswa_fk', $ids);
                $this->db->where('tanggal >=', $dates[0]);
                $this->db->where('tanggal <=', end($dates));
                $result = $this->db->get()->result_array();
                foreach ($result as $p) {
                    $presensi[$p['idsiswa_fk'].'|'.$p['tanggal']] = true; // ada aktivitas apapun
                }
            }

            // Cek streak tidak hadir per siswa
            foreach ($siswa as $s) {
                $max_streak = 0;
                $cur_streak = 0;
                $cur_start = null; $best_start = null; $best_end = null;
                foreach ($dates as $d) {
                    $hadir = isset($presensi[$s['id_siswa'].'|'.$d]);
                    if (!$hadir) {
                        if ($cur_streak === 0) $cur_start = $d;
                        $cur_streak++;
                        if ($cur_streak > $max_streak) {
                            $max_streak = $cur_streak;
                            $best_start = $cur_start;
                            $best_end = $d;
                        }
                    } else {
                        $cur_streak = 0;
                        $cur_start = null;
                    }
                }

                if ($max_streak >= $min_berturut) {
                    $rows[] = [
                        'nama' => $s['nama'],
                        'nis' => $s['nis'],
                        'kelas' => $s['kelas'],
                        'streak' => $max_streak,
                        'periode' => $best_start . ' s/d ' . $best_end,
                    ];
                }
            }
        }

        $data['rows'] = $rows;
        $data['filter'] = [
            'tanggal_mulai' => $tanggal_mulai,
            'tanggal_selesai' => $tanggal_selesai,
            'min_berturut' => $min_berturut,
        ];
        $data['message'] = empty($rows) ? 'Tidak ditemukan santri yang tidak masuk '.$min_berturut.' hari berturut-turut pada rentang ini.' : '';
        return $this->my_view(['role/admin/page/presensi_RFID/tidak_masuk_berturut/result'], $data);
    }

    // API (SPA) izin keluar harian per kelas
    public function proses_izin_keluar_harian()
    {
        $tanggal = $this->input->post('tanggal');
        $id_kelas = $this->input->post('kelas');

        if (!$tanggal || !$id_kelas) {
            $data['rows'] = [];
            $data['message'] = 'Silakan pilih tanggal dan kelas.';
            return $this->my_view(['role/admin/page/presensi_RFID/izin_keluar_harian/result'], $data);
        }

        // Ambil semua IJIN KELUAR dan pasangkan dengan IJIN KEMBALI setelahnya (hari yang sama, siswa yang sama)
        $sql = "
            SELECT 
                s.nama,
                k.kelas,
                pr_keluar.waktu AS keluar,
                (
                    SELECT MIN(pr_kembali.waktu)
                    FROM presensi_rfid pr_kembali
                    WHERE pr_kembali.idsiswa_fk = pr_keluar.idsiswa_fk
                      AND pr_kembali.tanggal = pr_keluar.tanggal
                      AND pr_kembali.status = 'IJIN KEMBALI'
                      AND pr_kembali.waktu > pr_keluar.waktu
                ) AS kembali
            FROM presensi_rfid pr_keluar
            JOIN siswa s ON s.id_siswa = pr_keluar.idsiswa_fk
            JOIN kelas k ON k.id_kelas = s.idkelas_fk
            WHERE pr_keluar.tanggal = ?
              AND s.idkelas_fk = ?
              AND pr_keluar.status = 'IJIN KELUAR'
            ORDER BY s.nama ASC, pr_keluar.waktu ASC
        ";

        $rows = $this->db->query($sql, [$tanggal, $id_kelas])->result_array();

        // Formatkan data dan hitung lama izin
        $out = [];
        foreach ($rows as $r) {
            $keluar = $r['keluar'] ? substr($r['keluar'], 0, 8) : '-';
            $kembali = $r['kembali'] ? substr($r['kembali'], 0, 8) : null;
            if ($kembali) {
                $dt1 = DateTime::createFromFormat('Y-m-d H:i:s', $tanggal.' '.$r['keluar']);
                $dt2 = DateTime::createFromFormat('Y-m-d H:i:s', $tanggal.' '.$r['kembali']);
                $diffMin = 0;
                if ($dt1 && $dt2 && $dt2 >= $dt1) {
                    $diff = $dt1->diff($dt2);
                    $diffMin = ($diff->h * 60) + $diff->i; // menit saja
                }
                $lama = $diffMin.' menit';
            } else {
                $lama = 'Belum kembali';
            }

            $out[] = [
                'nama' => $r['nama'],
                'kelas' => $r['kelas'],
                'keluar' => $keluar,
                'kembali' => $kembali ? $kembali : '—',
                'lama' => $lama,
            ];
        }

        $data['rows'] = $out;
        $data['tanggal'] = $tanggal;
        $data['message'] = empty($out) ? 'Tidak ada data izin keluar pada tanggal ini.' : '';
        return $this->my_view(['role/admin/page/presensi_RFID/izin_keluar_harian/result'], $data);
    }

    // API (SPA) izin keluar bulanan per kelas
    public function proses_izin_keluar_bulanan()
    {
        $bulan = $this->input->post('bulan'); // format: YYYY-MM
        $id_kelas = $this->input->post('kelas');

        if (!$bulan || !$id_kelas) {
            $data['rows'] = [];
            $data['message'] = 'Silakan pilih bulan dan kelas.';
            return $this->my_view(['role/admin/page/presensi_RFID/izin_keluar_bulanan/result'], $data);
        }

        // Tentukan tanggal awal-akhir bulan
        $start = DateTime::createFromFormat('Y-m', $bulan);
        if (!$start) {
            $tmp = DateTime::createFromFormat('Y-m-d', $bulan.'-01');
            $start = $tmp ?: new DateTime(date('Y-m-01'));
        }
        $start->modify('first day of this month');
        $end = clone $start;
        $end->modify('last day of this month');

        // Ambil semua IJIN KELUAR dalam bulan tsb dan pasangkan dengan IJIN KEMBALI pada hari yang sama
        $sql = "
            SELECT 
                s.id_siswa,
                s.nama,
                k.kelas,
                pr_keluar.tanggal,
                pr_keluar.waktu AS keluar,
                (
                    SELECT MIN(pr_kembali.waktu)
                    FROM presensi_rfid pr_kembali
                    WHERE pr_kembali.idsiswa_fk = pr_keluar.idsiswa_fk
                      AND pr_kembali.tanggal = pr_keluar.tanggal
                      AND pr_kembali.status = 'IJIN KEMBALI'
                      AND pr_kembali.waktu > pr_keluar.waktu
                ) AS kembali
            FROM presensi_rfid pr_keluar
            JOIN siswa s ON s.id_siswa = pr_keluar.idsiswa_fk
            JOIN kelas k ON k.id_kelas = s.idkelas_fk
            WHERE pr_keluar.status = 'IJIN KELUAR'
              AND s.idkelas_fk = ?
              AND pr_keluar.tanggal >= ?
              AND pr_keluar.tanggal <= ?
            ORDER BY s.nama ASC, pr_keluar.tanggal ASC, pr_keluar.waktu ASC
        ";

        $rows = $this->db->query($sql, [
            $id_kelas,
            $start->format('Y-m-d'),
            $end->format('Y-m-d')
        ])->result_array();

        // Agregasi per siswa
        $agg = [];
        foreach ($rows as $r) {
            $sid = $r['id_siswa'];
            if (!isset($agg[$sid])) {
                $agg[$sid] = [
                    'nama' => $r['nama'],
                    'kelas' => $r['kelas'],
                    'jumlah_izin' => 0,
                    'sudah_kembali' => 0,
                    'total_menit' => 0,
                ];
            }
            $agg[$sid]['jumlah_izin']++;
            if (!empty($r['kembali'])) {
                $agg[$sid]['sudah_kembali']++;
                // hitung durasi menit
                $dt1 = DateTime::createFromFormat('Y-m-d H:i:s', $r['tanggal'].' '.$r['keluar']);
                $dt2 = DateTime::createFromFormat('Y-m-d H:i:s', $r['tanggal'].' '.$r['kembali']);
                if ($dt1 && $dt2 && $dt2 >= $dt1) {
                    $diff = $dt1->diff($dt2);
                    $menit = ($diff->h * 60) + $diff->i;
                    $agg[$sid]['total_menit'] += $menit;
                }
            }
        }

        // Format output
        $out = [];
        foreach ($agg as $sid => $a) {
            $belum = $a['jumlah_izin'] - $a['sudah_kembali'];
            $totalDurasiStr = $a['sudah_kembali'] > 0 && $a['total_menit'] > 0
                ? $this->format_menit($a['total_menit'])
                : ($a['sudah_kembali'] > 0 ? '0 mnt' : '—');
            $rataStr = $a['sudah_kembali'] > 0
                ? $this->format_menit(intval(floor($a['total_menit'] / max(1, $a['sudah_kembali']))))
                : '—';

            $out[] = [
                'nama' => $a['nama'],
                'kelas' => $a['kelas'],
                'jumlah_izin' => (int)$a['jumlah_izin'],
                'sudah_kembali' => (int)$a['sudah_kembali'],
                'belum_kembali' => (int)$belum,
                'total_durasi' => $totalDurasiStr,
                'rata_durasi' => $rataStr,
            ];
        }

        // Urutkan by nama untuk konsistensi
        usort($out, function($x, $y){ return strcasecmp($x['nama'], $y['nama']); });

        $data['rows'] = $out;
        $data['bulan'] = $bulan;
        $data['message'] = empty($out) ? 'Tidak ada data izin keluar pada bulan ini.' : '';
        return $this->my_view(['role/admin/page/presensi_RFID/izin_keluar_bulanan/result'], $data);
    }

    private function format_menit($minutes)
    {
        $m = max(0, (int)$minutes);
        $h = intdiv($m, 60);
        $mm = $m % 60;
        if ($h > 0 && $mm > 0) return $h.' jam '.$mm.' mnt';
        if ($h > 0) return $h.' jam';
        return $mm.' mnt';
    }
    public function proses_presensi()
    {
        $tanggal_mulai = $this->input->post('tanggal_mulai');
        $tanggal_selesai = $this->input->post('tanggal_selesai');
        $kelas_id = $this->input->post('kelas');

        // Ambil data siswa per kelas
        $this->db->select('s.id_siswa, s.nama');
        $this->db->from('siswa s');
        $this->db->where('s.idkelas_fk', $kelas_id);
        $siswa_list = $this->db->get()->result_array();

        // Ambil data presensi per tanggal dan siswa
        $this->db->select('*');
        $this->db->from('presensi_rfid');
        $this->db->where('tanggal >=', $tanggal_mulai);
        $this->db->where('tanggal <=', $tanggal_selesai);
        if ($kelas_id) {
            $this->db->where_in('idsiswa_fk', array_column($siswa_list, 'id_siswa'));
        }
        $presensi = $this->db->get()->result_array();

        // Strukturkan data
        $rekap = [];
        foreach ($siswa_list as $siswa) {
            $id = $siswa['id_siswa'];
            $nama = $siswa['nama'];

            $tanggal_loop = new DateTime($tanggal_mulai);
            $tanggal_akhir = new DateTime($tanggal_selesai);

            while ($tanggal_loop <= $tanggal_akhir) {
                $tgl = $tanggal_loop->format('Y-m-d');

                // Filter presensi siswa pada tanggal ini
                $filter = array_filter($presensi, function ($p) use ($id, $tgl) {
                    return $p['idsiswa_fk'] == $id && $p['tanggal'] == $tgl;
                });

                $status_hari_ini = array_column($filter, 'status');

                $rekap[$id]['nama'] = $nama;
                $rekap[$id]['presensi'][$tgl] = [
                    'MASUK' => in_array('MASUK', $status_hari_ini),
                    'PULANG' => in_array('PULANG', $status_hari_ini),
                    'IJIN KELUAR' => in_array('IJIN KELUAR', $status_hari_ini),
                    'IJIN KEMBALI' => in_array('IJIN KEMBALI', $status_hari_ini),
                    'KEHADIRAN' => !empty($status_hari_ini) // kalau ada data, berarti hadir
                ];

                $tanggal_loop->modify('+1 day');
            }
        }

        $data['rekap'] = $rekap;
        $data['tanggal_mulai'] = $tanggal_mulai;
        $data['tanggal_selesai'] = $tanggal_selesai;

		$this->my_view(['role/admin/page/presensi_RFID/rekap/hasil_presensi'],$data);
    }

}

