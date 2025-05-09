<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Presence_system extends CI_Controller {
	
	public function index()
	{
		
		$data=[];
		$this->load->view('presence_system/index', $data);
	}

	function get_presence(){

		$data=[];
		$data['presence'] 	=	$this->db->query("
						SELECT 
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
			    idsiswa_fk;

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
	        if ($last_status == 'MASUK') {
	            $this->insertAbsensi($id_siswa, 'IJIN KELUAR', $now);
	            echo json_encode(['msg'=>$siswa_data['nama']." | Berhasil Absen IJIN KELUAR"]);
	        } elseif ($last_status == 'IJIN KELUAR') {
	            $this->insertAbsensi($id_siswa, 'IJIN KEMBALI', $now);
	            echo json_encode(['msg'=>$siswa_data['nama']." | Berhasil Absen IJIN KEMBALI"]);
	        } elseif ($last_status == 'IJIN KEMBALI') {
	            // Cek apakah mau PULANG atau mau IJIN lagi
					if (($jenis_kelamin == 'L' && $now_timestamp >= strtotime('11:30:00')) || 
						($jenis_kelamin == 'P' && $now_timestamp >= strtotime('15:30:00'))) {
						echo json_encode(['msg'=>$siswa_data['nama']." | Berhasil Absen PULANG"]);
						$this->insertAbsensi($id_siswa, 'PULANG', $now);
					} else {
						// Kalau belum waktunya pulang, ijinkan untuk Ijin Keluar lagi
						echo json_encode(['msg'=>$siswa_data['nama']." | Berhasil Absen IJIN KELUAR"]);
						$this->insertAbsensi($id_siswa, 'IJIN KELUAR', $now);
					}
	        } elseif (($last_status == 'MASUK' && $now_timestamp >= strtotime('11:30:00') && $jenis_kelamin == 'L') || 
	                  ($last_status == 'MASUK' && $now_timestamp >= strtotime('15:30:00') && $jenis_kelamin == 'P')) {
	        		echo json_encode(['msg'=>$siswa_data['nama']." | Berhasil Absen PULANG"]);
	            $this->insertAbsensi($id_siswa, 'PULANG', $now);
	        } elseif ($last_status == 'PULANG') {
	                echo json_encode(['msg' => $siswa_data['nama'].' | ANDA SUDAH ABSEN']);
	                return;
	        } else {
	        	echo json_encode(['msg'=>$siswa_data['nama']." | Berhasil Absen Masuk"]);
	            $this->insertAbsensi($id_siswa, 'MASUK', $now);
	        }
	    }
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
}
