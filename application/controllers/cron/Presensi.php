<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Presensi extends CI_Controller {
    
     public function get_guru_belum_absen_hari_ini()
    {
        $today = date('Y-m-d');
        $hariIni = date('w'); // 0 = Minggu, 6 = Sabtu

        // 1. Cek apakah hari ini adalah hari libur
        $libur = $this->my_where('hari_libur', ['tanggal' => $today])->row_array();

        if ($libur) {
            // Jika hari libur, hanya ambil guru yang masuk pengecualian
            $this->db->select('phl.idguru_fk');
            $this->db->from('pengecualian_hari_libur phl');
            $this->db->join('hari_libur hl', 'hl.id_hari_libur = phl.idharilibur_fk');
            $this->db->where('hl.tanggal', $today);

            $subquery = $this->db->get_compiled_select();

            // Ambil guru pengecualian yang belum absen
            $query = $this->db->query("
                SELECT idguru_fk
                FROM ($subquery) AS pengecualian_hari_ini
                WHERE idguru_fk NOT IN (
                    SELECT idguru_fk FROM presensi_guru WHERE tanggal = '$today'
                )
            ");
        } else {
            // Hari aktif (bukan libur), ambil guru berdasarkan jadwal hari ini
            $this->db->select('idguru_fk');
            $this->db->from('jadwal_guru');
            $this->db->where('idhari_fk', $hariIni);

            $subquery = $this->db->get_compiled_select();

            $query = $this->db->query("
                SELECT idguru_fk
                FROM ($subquery) AS jadwal_hari_ini
                WHERE idguru_fk NOT IN (
                    SELECT idguru_fk FROM presensi_guru WHERE tanggal = '$today'
                )
            ");
        }

        foreach ($query->result_array() as $key => $value) {
            $guru = $this->db->query("SELECT nama, no_hp FROM guru WHERE id_guru = " . (int)$value['idguru_fk'])->row_array();

            $msg = "Halo " . $guru['nama'] . ", Bapak/Ibu guru belum absen hari ini di Edulite. Mohon segera melakukan absen ya 😄\n\n"
                . "No Reply: BOT WA SMKKITA";

            bot_wa($this , $guru['no_hp'], $msg, 'request_absen', null, 'admin');
        }
    }


    public function get_guru_belum_absen_pulang_hari_ini()
    {
        $today = date('Y-m-d');
        $hariIni = date('w');

        $result = [];
        $debug = [
            'tanggal' => $today,
            'hari_index' => $hariIni,
            'is_libur' => false,
            'compiled_subquery' => '',
            'presensi_query_ok' => false,
            'guru_ditemukan' => [],
            'guru_tidak_ditemukan' => [],
        ];


        // Cek hari libur
        $libur = $this->db->get_where('hari_libur', ['tanggal' => $today])->row_array();
        $query = null;

        if ($libur) {
            $debug['is_libur'] = true;

            $this->db->select('phl.idguru_fk');
            $this->db->from('pengecualian_hari_libur phl');
            $this->db->join('hari_libur hl', 'hl.id_hari_libur = phl.idharilibur_fk');
            $this->db->where('hl.tanggal', $today);
            $subquery = $this->db->get_compiled_select();
            $debug['compiled_subquery'] = $subquery;

            $query = $this->db->query("
                SELECT idguru_fk
                FROM ($subquery) AS pengecualian
                WHERE idguru_fk IN (
                    SELECT idguru_fk
                    FROM presensi_guru
                    WHERE tanggal = '$today' AND (jam_keluar IS NULL OR jam_keluar = '00:00:00')
                )
            ");
        } else {
            $this->db->select('idguru_fk');
            $this->db->from('jadwal_guru');
            $this->db->where('idhari_fk', $hariIni);
            $subquery = $this->db->get_compiled_select();
            $debug['compiled_subquery'] = $subquery;

            $query = $this->db->query("
                SELECT idguru_fk
                FROM ($subquery) AS jadwal
                WHERE idguru_fk IN (
                    SELECT idguru_fk
                    FROM presensi_guru
                    WHERE tanggal = '$today' AND (jam_keluar IS NULL OR jam_keluar = '00:00:00')
                )
            ");
        }

        if ($query) {
            $debug['presensi_query_ok'] = true;
        }

        foreach ($query->result_array() as $value) {
            $idguru = (int)$value['idguru_fk'];
            $guru = $this->db->query('SELECT nama, no_hp FROM guru WHERE id_guru = ' . $idguru)->row_array();

            if (!$guru) {
                $debug['guru_tidak_ditemukan'][] = $idguru;
                continue;
            }

            $debug['guru_ditemukan'][] = $guru['nama'];

            $msg = "Halo " . $guru['nama'] . ", Bapak/Ibu guru belum absen pulang hari ini di Edulite. "
                . "Silakan gunakan fitur *Request Absen* jika Anda tidak dalam jangkauan.\n\n"
                . "No Reply: BOT WA SMKKITA";

            bot_wa($this, $guru['no_hp'], $msg, 'request_absen', null, 'admin');

            $result[] = [
                'idguru' => $idguru,
                'nama' => $guru['nama'],
                'no_hp' => $guru['no_hp'],
                'status' => 'Belum absen pulang',
                'pesan' => $msg,
            ];
        }

        echo json_encode([
                'success' => true,
                'total' => count($result),
                'data' => $result,
                'debug' => $debug
            ]);
    }


}
?>
