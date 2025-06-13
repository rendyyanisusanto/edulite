<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Presensi extends CI_Controller {
    
     public function get_guru_belum_absen_hari_ini() {
        $today = date('Y-m-d');
        $hariIni = date('N'); // Mendapatkan hari dalam format angka (1=Senin, 7=Minggu)

        // Query untuk mendapatkan jadwal guru yang harus absen pada hari ini
        $this->db->select('jadwal_guru.idguru_fk');
        $this->db->from('jadwal_guru');
        $this->db->where('jadwal_guru.idhari_fk', $hariIni);
        $subquery = $this->db->get_compiled_select();

        // Query untuk mengecek siapa saja yang belum absen pada hari ini
        $query = $this->db->query("
            SELECT idguru_fk
            FROM ($subquery) AS jadwal_hari_ini
            WHERE idguru_fk NOT IN (
                SELECT idguru_fk
                FROM presensi_guru
                WHERE tanggal = '$today'
            )
        ");

        foreach ($query->result_array() as $key => $value) {
            $guru = $this->db->query('select nama, no_hp from guru where id_guru = '.$value['idguru_fk'])->row_array();
            // echo $guru['nama']."\n";

             $msg = $requestAbsen ="Halo ".$guru['nama'].", Bapak/ibu guru masih belum absen untuk hari ini. jangan lupa absen di edulite hari ini ya :D \n\n"
               . "No Reply : BOT WA SMKKITA\n\n";

                $this->bot_wa($guru['no_hp'], $msg, 'request_absen', $id, 'admin');
        }


               
    }

    public function get_guru_belum_absen_pulang_hari_ini() {
        $today = date('Y-m-d');
        $hariIni = date('N'); // Mendapatkan hari dalam format angka (1=Senin, 7=Minggu)

        // Query untuk mendapatkan jadwal guru yang harus absen pada hari ini
        $this->db->select('jadwal_guru.idguru_fk');
        $this->db->from('jadwal_guru');
        $this->db->where('jadwal_guru.idhari_fk', $hariIni);
        $subquery = $this->db->get_compiled_select();

        // Query untuk mengecek siapa saja yang belum absen pada hari ini dan jam keluar masih 00:00:00
        $query = $this->db->query("
            SELECT idguru_fk
            FROM ($subquery) AS jadwal_hari_ini
            WHERE idguru_fk NOT IN (
                SELECT idguru_fk
                FROM presensi_guru
                WHERE tanggal = '$today' AND jam_keluar != '00:00:00'
            )
        ");

        foreach ($query->result_array() as $key => $value) {
            $guru = $this->db->query('SELECT nama, no_hp FROM guru WHERE id_guru = ' . $value['idguru_fk'])->row_array();
            // echo $guru['nama']."\n";

            $msg = $requestAbsen = "Halo " . $guru['nama'] . ", Bapak/ibu guru masih belum absen pulang untuk hari ini. Silahkan gunakan fitur Request Absen jika anda tidak dalam jangkauan. Jangan lupa absen di Edulite hari ini ya :D \n\n"
                . "No Reply : BOT WA SMKKITA\n\n";

            $this->bot_wa($guru['no_hp'], $msg, 'request_absen', $id, 'admin');
        }

               
    }


    function bot_wa($no_hp, $message, $table, $table_id, $from){ 

        // check spam

        $data_spam = $this->db->get_where('log_wa', ['tanggal'=>date('Y-m-d'),'no_hp'=>$this->formatNomorHP($no_hp), 'table'=> $table])->num_rows();

        if ($data_spam < 50) {
            // proses

            $curl = curl_init();

            curl_setopt_array($curl, array(
              CURLOPT_URL => 'localhost:5001/send-message',
              CURLOPT_RETURNTRANSFER => true,
              CURLOPT_ENCODING => '',
              CURLOPT_MAXREDIRS => 10,
              CURLOPT_TIMEOUT => 0,
              CURLOPT_FOLLOWLOCATION => true,
              CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
              CURLOPT_CUSTOMREQUEST => 'POST',
              CURLOPT_POSTFIELDS => 'message='.urlencode($message).'&number='.$this->formatNomorHP($no_hp),
              CURLOPT_HTTPHEADER => array(
                'Content-Type: application/x-www-form-urlencoded'
              ),
            ));

            $response = curl_exec($curl);

            curl_close($curl);


            // save logs to db
            $response_data = json_decode($response, true);

            // Cek apakah decoding berhasil dan response status adalah true
            if ($response_data && $response_data['status'] === true) {
                // Ambil status utama dari response
                $main_status = $response_data['status'];

                // Ambil status pesan (pending, delivered, dll.)
                $message_status = $response_data['response']['status'];

                // Tampilkan hasilnya atau lakukan tindakan lainnya
                echo "Status utama: " . ($main_status ? 'true' : 'false') . "<br>";
                echo "Status pesan: " . $message_status . "<br>";

                $data = [
                    'no_hp'         =>  $this->formatNomorHP($no_hp),
                    'msg'           =>  urlencode($message),
                    'table'         =>  $table,
                    'table_id'      =>  $table_id,
                    'status'        =>  ($main_status ? 'true' : 'false'),
                    'msg_status'    =>  $message_status,
                    'tanggal'       => date('Y-m-d'),
                    'from'          =>  $from,
                    'logs'          =>  '',
                ];

                $this->db->insert('log_wa', $data);
            } else {
                // Tampilkan pesan error jika response tidak valid atau gagal
                // echo "Gagal mendapatkan status dari response";
            }
        }else{
            $data = [
                    'no_hp'         =>  $this->formatNomorHP($no_hp),
                    'msg'           =>  urlencode($message),
                    'table'         =>  $table,
                    'table_id'      =>  $table_id,
                    'status'        =>  'SKIPPED',
                    'tanggal'       => date('Y-m-d'),
                    'msg_status'    =>  '',
                    'from'          =>  $from,
                    'logs'          =>  '',
                ];

                $this->db->insert('log_wa', $data);
        }
        
    }
    function formatNomorHP($nomor) {
        // Hapus spasi atau tanda minus (-) yang mungkin dimasukkan oleh pengguna
        $nomor = str_replace([' ', '-', '(', ')'], '', $nomor);

        // Jika nomor diawali dengan "08", ubah menjadi "628"
        if (substr($nomor, 0, 2) === '08') {
            $nomor = '628' . substr($nomor, 2);
        }
        // Jika nomor diawali dengan "+62", ubah menjadi "62"
        elseif (substr($nomor, 0, 3) === '+62') {
            $nomor = '62' . substr($nomor, 3);
        }

        return $nomor;
    }

    function test_cron()
    {
         $this->bot_wa("085894632505", "test", 'request_absen', 1, 'admin');
    }
}
?>
