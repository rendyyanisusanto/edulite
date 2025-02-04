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
			    MAX(CASE WHEN status = 'PULANG' THEN waktu ELSE NULL END) AS pulang
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

	function get_kelas(){
		$data=[];
		$data['kelas'] 	=	$this->db->query("SELECT 
		    k.id_kelas,
		    k.kelas,
		    COUNT(p.idsiswa_fk) AS jumlah_absen,
		    (COUNT(s.id_siswa) - COUNT(p.idsiswa_fk)) AS jumlah_tidak_absen
		FROM kelas k
		JOIN siswa s ON k.id_kelas = s.idkelas_fk
		LEFT JOIN presensi_rfid p ON s.id_siswa = p.idsiswa_fk AND p.tanggal = CURDATE() AND p.`status` = 'MASUK'
		GROUP BY k.id_kelas, k.kelas;")->result_array();

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
	            if ($jenis_kelamin == 'L' && $now_timestamp >= strtotime('11:30:00')) {
	            	echo json_encode(['msg'=>$siswa_data['nama']." | Berhasil Absen PULANG"]);
	                $this->insertAbsensi($id_siswa, 'PULANG', $now);
	            } elseif ($jenis_kelamin == 'P' && $now_timestamp >= strtotime('15:30:00')) {
	            	echo json_encode(['msg'=>$siswa_data['nama']." | Berhasil Absen PULANG"]);
	                $this->insertAbsensi($id_siswa, 'PULANG', $now);
	            } else {
	                echo json_encode(['msg' => $siswa_data['nama'].' | Tidak dapat absen pulang sebelum waktu yang ditentukan']);
	                return;
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
