<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Presence_system extends CI_Controller {
	
	public function index()
	{
		
		$data=[];
		$this->load->view('presence_system/index', $data);
	}

	function frontpage(){
		$data=[];
		$this->load->view('presence_system/frontpage', $data);
	}

	function perijinan(){
		$data=[];
		$this->load->view('presence_system/perijinan', $data);
	}

	function get_presence(){

		$data=[];
		$data['presence'] 	=	$this->db->query("
						SELECT 
				id_presensi_rfid,
			    idsiswa_fk,
			    (select nama from siswa where idsiswa_fk = siswa.id_siswa) as nama_siswa,
			    MIN(CASE WHEN status = 'MASUK' THEN waktu ELSE NULL END) AS masuk,
			    MAX(CASE WHEN status = 'IJIN KELUAR' THEN waktu ELSE NULL END) AS ijin_keluar,
			    MAX(CASE WHEN status = 'IJIN KEMBALI' AND 
			                 waktu > (SELECT MAX(waktu) FROM presensi_rfid 
			                          WHERE status = 'IJIN KELUAR' 
			                          AND idsiswa_fk = presensi_rfid.idsiswa_fk 
			                          AND tanggal = curdate()) 
			             THEN waktu ELSE NULL END) AS ijin_kembali,
			    MAX(CASE WHEN status = 'PULANG' THEN waktu ELSE NULL END) AS pulang,
				(SELECT COUNT(*) FROM presensi_rfid pr2 
             WHERE pr2.idsiswa_fk = presensi_rfid.idsiswa_fk 
               AND pr2.status = 'IJIN KELUAR' 
               AND pr2.tanggal = CURDATE()) AS jumlah_ijin
			FROM 
			    presensi_rfid
			WHERE 
			     tanggal = CURDATE() -- Ganti dengan tanggal yang sesuai
			GROUP BY 
			    idsiswa_fk
			ORDER BY 
			    id_presensi_rfid DESC
			limit 15;
			    ")->result_array();

		$this->load->view('presence_system/table', $data);
	}

	function get_last_presence(){
		$data=[];
		$data['presence'] 	=	$this->db->query(" SELECT 
        pr.idsiswa_fk,
        s.nama AS nama,
		s.foto as foto,
        pr.status,
        pr.waktu
    FROM 
        (
            SELECT 
                idsiswa_fk, 
                MAX(waktu) AS max_waktu
            FROM 
                presensi_rfid
            WHERE 
                tanggal = CURDATE()
            GROUP BY 
                idsiswa_fk
        ) AS last_per_siswa
    INNER JOIN 
        presensi_rfid pr 
        ON pr.idsiswa_fk = last_per_siswa.idsiswa_fk AND pr.waktu = last_per_siswa.max_waktu
    INNER JOIN 
        siswa s ON pr.idsiswa_fk = s.id_siswa
    ORDER BY 
        pr.waktu DESC
    LIMIT 3")->result_array();
		$this->load->view('presence_system/kelas', $data);
	}

	function simpan_absen(){
	    $rfid = $_POST['rfid'];

	    // Ambil data siswa berdasarkan RFID
	    $siswa = $this->db->query('SELECT nama, id_siswa, jenis_kelamin FROM siswa WHERE rfid = "'.$rfid.'"');
	    
	    if ($siswa->num_rows() > 0) {
	        $siswa_data = $siswa->row_array();
	        $id_siswa = $siswa_data['id_siswa'];
	        $jenis_kelamin = $siswa_data['jenis_kelamin'];  
	        $now = date('H:i:s');  
	        $now_timestamp = strtotime($now);

	        // Cek status terakhir pengguna berdasarkan RFID
	        $status_data = $this->db->query("
	            SELECT status, waktu 
	            FROM presensi_rfid 
	            WHERE idsiswa_fk = '".$id_siswa."' 
				AND DATE(tanggal) = CURDATE() 
	            ORDER BY waktu DESC 
	            LIMIT 1
	        ");

			$setting_status_pulang = $this->db->query("SELECT value FROM setting_table WHERE `table` = 'status_pulang'")->row_array();
			$status_pulang_enabled = 0;
			if ($setting_status_pulang) {
				$status_pulang_enabled = $setting_status_pulang['value']; // 1 = aktif, 0 = nonaktif
			}

	        if ($status_data->num_rows() > 0) {
	            $last_absen = $status_data->row_array();
	            $last_status = $last_absen['status'];
	            $last_time = strtotime($last_absen['waktu']);

	            // Cek apakah scan terjadi dalam 10 detik terakhir
	            if (($now_timestamp - $last_time) < 10) {
	                echo json_encode(['msg' => 'Terlalu cepat, silakan tunggu beberapa detik sebelum scan lagi']);
	                return;
	            }
	        } else {
	            $last_status = null;
	        }

	        // Logika Absensi
			if($status_pulang_enabled == 1){
				echo json_encode(['msg'=>$siswa_data['nama']." | Berhasil Absen PULANG"]);
	            	$this->insertAbsensi($id_siswa, 'PULANG', $now);
			}else{
				if ($last_status == 'MASUK') {
					$this->insertAbsensi($id_siswa, 'IJIN KELUAR', $now);
					echo json_encode(['msg'=>$siswa_data['nama']." | Berhasil Absen IJIN KELUAR"]);
				} elseif ($last_status == 'IJIN KELUAR') {
					$this->insertAbsensi($id_siswa, 'IJIN KEMBALI', $now);
					echo json_encode(['msg'=>$siswa_data['nama']." | Berhasil Absen IJIN KEMBALI"]);
				} elseif ($last_status == 'IJIN KEMBALI') {
						if ($status_pulang_enabled == 1) {
							echo json_encode(['msg' => $siswa_data['nama'] . " | Berhasil Absen PULANG"]);
							$this->insertAbsensi($id_siswa, 'PULANG', $now);
						} else {
							echo json_encode(['msg'=>$siswa_data['nama']." | Berhasil Absen IJIN KELUAR"]);
							$this->insertAbsensi($id_siswa, 'IJIN KELUAR', $now);
						}
				}  elseif ($last_status == 'PULANG') {
						echo json_encode(['msg' => $siswa_data['nama'].' | ANDA SUDAH ABSEN']);
						return;
				} else {
					echo json_encode(['msg'=>$siswa_data['nama']." | Berhasil Absen Masuk"]);
					$this->insertAbsensi($id_siswa, 'MASUK', $now);
				}
			}
	    }
	}

	function get_status_pulang(){
		$data = $this->db->query('select `value` from setting_table where `table` = "status_pulang"')->row_array();

		echo ($data['value'] == 0) ? "<h4 style='font-weight:bold;' class='text-center text-danger'>Status Pulang : Belum Waktunya</h4>" : "<h4 style='font-weight:bold;' class='text-center text-success'>Status Pulang : Sudah Waktunya Pulang</h4>";
	}

	private function getAbsensiStatus($idsiswa_fk)
	{
	    // Ambil status terakhir berdasarkan RFID
	    return $this->db->select('status')
	                    ->from('presensi_rfid')
	                    ->where('idsiswa_fk', $idsiswa_fk)
	                    ->where('tanggal', date('Y-m-d') )
	                    ->order_by('waktu', 'DESC' )
	                    ->limit(1)
	                    ->get()
	                    ->row()
	                    ->status;
	}
	private function insertAbsensi($idsiswa_fk, $status, $time)
	{
	    // Masukkan data absensi baru
	    $this->db->insert('presensi_rfid', [
	        'idsiswa_fk' => $idsiswa_fk,
	        'status' => $status,
	        'tanggal' => date('Y-m-d'),
	        'waktu' => $time
	    ]);
	}

	// Method untuk perijinan toilet
	function simpan_perijinan(){
	    $rfid = $_POST['rfid'];

	    // Ambil data siswa berdasarkan RFID
	    $siswa = $this->db->query('SELECT nama, id_siswa, jenis_kelamin FROM siswa WHERE rfid = "'.$rfid.'"');
	    
	    if ($siswa->num_rows() > 0) {
	        $siswa_data = $siswa->row_array();
	        $id_siswa = $siswa_data['id_siswa'];
	        $now = date('H:i:s');  
	        $now_timestamp = strtotime($now);

	        // Cek status terakhir siswa hari ini
	        $status_data = $this->db->query("
	            SELECT status, waktu 
	            FROM presensi_rfid 
	            WHERE idsiswa_fk = '".$id_siswa."' 
	            AND DATE(tanggal) = CURDATE() 
	            ORDER BY waktu DESC 
	            LIMIT 1
	        ");

	        if ($status_data->num_rows() > 0) {
	            $last_absen = $status_data->row_array();
	            $last_status = $last_absen['status'];
	            $last_time = strtotime($last_absen['waktu']);

	            // Cek apakah scan terjadi dalam 10 detik terakhir
	            if (($now_timestamp - $last_time) < 10) {
	                echo json_encode([
	                    'status' => 'error',
	                    'msg' => 'Terlalu cepat, silakan tunggu beberapa detik sebelum scan lagi'
	                ]);
	                return;
	            }

	            // Logika Perijinan Toilet menggunakan status IJIN KELUAR dan IJIN KEMBALI
	            if ($last_status == 'MASUK') {
	                // Siswa sudah masuk, bisa ijin keluar (ke toilet)
	                $this->insertAbsensi($id_siswa, 'IJIN KELUAR', $now);
	                echo json_encode([
	                    'status' => 'success',
	                    'msg' => $siswa_data['nama'] . " | Berhasil Ijin KELUAR (Toilet)"
	                ]);
	            } elseif ($last_status == 'IJIN KELUAR') {
	                // Siswa kembali dari toilet
	                $this->insertAbsensi($id_siswa, 'IJIN KEMBALI', $now);
	                echo json_encode([
	                    'status' => 'success',
	                    'msg' => $siswa_data['nama'] . " | Berhasil KEMBALI dari Toilet"
	                ]);
	            } elseif ($last_status == 'IJIN KEMBALI') {
	                // Siswa ijin keluar lagi
	                $this->insertAbsensi($id_siswa, 'IJIN KELUAR', $now);
	                echo json_encode([
	                    'status' => 'success',
	                    'msg' => $siswa_data['nama'] . " | Berhasil Ijin KELUAR (Toilet)"
	                ]);
	            } elseif ($last_status == 'PULANG') {
	                echo json_encode([
	                    'status' => 'error',
	                    'msg' => $siswa_data['nama'] . " | Sudah pulang, tidak bisa ijin"
	                ]);
	            }
	        } else {
	            // Belum ada absensi hari ini, harus masuk dulu
	            echo json_encode([
	                'status' => 'error',
	                'msg' => $siswa_data['nama'] . " | Belum absen masuk, silakan absen masuk terlebih dahulu"
	            ]);
	        }
	    } else {
	        echo json_encode([
	            'status' => 'error',
	            'msg' => 'Kartu RFID tidak terdaftar'
	        ]);
	    }
	}

	// Get siswa yang sedang keluar toilet
	function get_siswa_keluar_toilet(){
	    $data = [];
	    $data['siswa_keluar'] = $this->db->query("
	        SELECT 
	            pr.idsiswa_fk,
	            s.nama,
	            s.foto,
	            pr.waktu as waktu_keluar,
	            TIMESTAMPDIFF(MINUTE, pr.waktu, NOW()) as durasi_menit
	        FROM presensi_rfid pr
	        INNER JOIN siswa s ON pr.idsiswa_fk = s.id_siswa
	        WHERE pr.tanggal = CURDATE()
	        AND pr.status = 'IJIN KELUAR'
	        AND pr.idsiswa_fk NOT IN (
	            SELECT pr2.idsiswa_fk 
	            FROM presensi_rfid pr2 
	            WHERE pr2.tanggal = CURDATE() 
	            AND pr2.status = 'IJIN KEMBALI'
	            AND pr2.waktu > pr.waktu
	        )
	        ORDER BY pr.waktu DESC
	    ")->result_array();

	    $this->load->view('presence_system/siswa_keluar_toilet', $data);
	}

	// Get riwayat toilet hari ini
	function get_riwayat_toilet_hari_ini(){
	    $data = [];
	    $data['riwayat'] = $this->db->query("
	        SELECT 
	            s.nama,
	            s.foto,
	            keluar.waktu as waktu_keluar,
	            kembali.waktu as waktu_kembali,
	            CASE 
	                WHEN kembali.waktu IS NOT NULL THEN 
	                    TIMESTAMPDIFF(MINUTE, keluar.waktu, kembali.waktu)
	                ELSE NULL 
	            END as durasi_menit
	        FROM (
	            SELECT idsiswa_fk, waktu,
	                   ROW_NUMBER() OVER (PARTITION BY idsiswa_fk ORDER BY waktu) as rn
	            FROM presensi_rfid 
	            WHERE tanggal = CURDATE() 
	            AND status = 'IJIN KELUAR'
	        ) keluar
	        LEFT JOIN (
	            SELECT idsiswa_fk, waktu,
	                   ROW_NUMBER() OVER (PARTITION BY idsiswa_fk ORDER BY waktu) as rn
	            FROM presensi_rfid 
	            WHERE tanggal = CURDATE() 
	            AND status = 'IJIN KEMBALI'
	        ) kembali ON keluar.idsiswa_fk = kembali.idsiswa_fk AND keluar.rn = kembali.rn
	        INNER JOIN siswa s ON keluar.idsiswa_fk = s.id_siswa
	        ORDER BY keluar.waktu DESC
	        LIMIT 20
	    ")->result_array();

	    $this->load->view('presence_system/riwayat_toilet', $data);
	}

	// Get statistik toilet
	function get_statistik_toilet(){
	    $sedang_keluar = $this->db->query("
	        SELECT COUNT(*) as total
	        FROM presensi_rfid pr
	        WHERE pr.tanggal = CURDATE()
	        AND pr.status = 'IJIN KELUAR'
	        AND pr.idsiswa_fk NOT IN (
	            SELECT pr2.idsiswa_fk 
	            FROM presensi_rfid pr2 
	            WHERE pr2.tanggal = CURDATE() 
	            AND pr2.status = 'IJIN KEMBALI'
	            AND pr2.waktu > pr.waktu
	        )
	    ")->row_array();

	    $sudah_kembali = $this->db->query("
	        SELECT COUNT(DISTINCT idsiswa_fk) as total
	        FROM presensi_rfid 
	        WHERE tanggal = CURDATE() 
	        AND status = 'IJIN KEMBALI'
	    ")->row_array();

	    echo json_encode([
	        'sedang_keluar' => $sedang_keluar['total'],
	        'sudah_kembali' => $sudah_kembali['total']
	    ]);
	}
}
