<?php
/**
 * Helper Functions untuk Format Tanggal Indonesia
 * Simpan file ini sebagai application/helpers/date_helper.php (jika belum ada)
 * atau tambahkan ke helper yang sudah ada
 */

if (!function_exists('format_hari')) {
    /**
     * Mengkonversi angka hari (1-7) ke nama hari dalam bahasa Indonesia
     * 
     * @param int $day_number Nomor hari (1=Senin, 2=Selasa, ..., 7=Minggu)
     * @return string Nama hari dalam bahasa Indonesia
     */
    function format_hari($day_number) {
        $hari = array(
            1 => 'Senin',
            2 => 'Selasa', 
            3 => 'Rabu',
            4 => 'Kamis',
            5 => 'Jumat',
            6 => 'Sabtu',
            7 => 'Minggu'
        );
        
        return isset($hari[$day_number]) ? $hari[$day_number] : '';
    }
}

if (!function_exists('format_bulan')) {
    /**
     * Mengkonversi angka bulan (1-12) ke nama bulan dalam bahasa Indonesia
     * 
     * @param int $month_number Nomor bulan (1=Januari, 2=Februari, ..., 12=Desember)
     * @return string Nama bulan dalam bahasa Indonesia
     */
    function format_bulan($month_number) {
        $bulan = array(
            1  => 'Januari',
            2  => 'Februari',
            3  => 'Maret',
            4  => 'April',
            5  => 'Mei',
            6  => 'Juni',
            7  => 'Juli',
            8  => 'Agustus',
            9  => 'September',
            10 => 'Oktober',
            11 => 'November',
            12 => 'Desember'
        );
        
        return isset($bulan[$month_number]) ? $bulan[$month_number] : '';
    }
}

if (!function_exists('format_tanggal_indonesia')) {
    /**
     * Mengkonversi tanggal ke format Indonesia lengkap
     * 
     * @param string $date Tanggal dalam format Y-m-d atau timestamp
     * @return string Tanggal dalam format Indonesia (contoh: Senin, 15 Januari 2024)
     */
    function format_tanggal_indonesia($date) {
        if (is_string($date)) {
            $timestamp = strtotime($date);
        } else {
            $timestamp = $date;
        }
        
        $day_number = date('N', $timestamp); // 1-7 (Senin-Minggu)
        $day = date('j', $timestamp); // Tanggal tanpa leading zero
        $month_number = date('n', $timestamp); // Bulan tanpa leading zero
        $year = date('Y', $timestamp);
        
        return format_hari($day_number) . ', ' . $day . ' ' . format_bulan($month_number) . ' ' . $year;
    }
}

if (!function_exists('format_tanggal_pendek')) {
    /**
     * Mengkonversi tanggal ke format Indonesia pendek
     * 
     * @param string $date Tanggal dalam format Y-m-d atau timestamp
     * @return string Tanggal dalam format pendek (contoh: 15 Januari 2024)
     */
    function format_tanggal_pendek($date) {
        if (is_string($date)) {
            $timestamp = strtotime($date);
        } else {
            $timestamp = $date;
        }
        
        $day = date('j', $timestamp);
        $month_number = date('n', $timestamp);
        $year = date('Y', $timestamp);
        
        return $day . ' ' . format_bulan($month_number) . ' ' . $year;
    }
}
if (!function_exists('format_durasi_kegiatan')) {
    /**
     * Format durasi kegiatan
     * 
     * @param string $tanggal_mulai
     * @param string $tanggal_selesai
     * @return string Durasi dalam format yang sesuai
     */
    function format_durasi_kegiatan($tanggal_mulai, $tanggal_selesai) {
        $timestamp_mulai = strtotime($tanggal_mulai);
        $timestamp_selesai = strtotime($tanggal_selesai);
        
        $selisih_hari = round(($timestamp_selesai - $timestamp_mulai) / (60 * 60 * 24));
        
        if ($selisih_hari == 0) {
            return '1 hari';
        } elseif ($selisih_hari == 1) {
            return '2 hari';
        } else {
            return ($selisih_hari + 1) . ' hari';
        }
    }
}
?>