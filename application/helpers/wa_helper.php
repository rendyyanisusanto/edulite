<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

if (!function_exists('bot_wa')) {
    function bot_wa($CI, $no_hp, $message, $table, $table_id, $from)
    {
        $CI->load->database();

        $CI->load->helper('url'); // kalau pakai base_url dll

        // check spam
        $data_spam = $CI->db->get_where('log_wa', [
            'tanggal' => date('Y-m-d'),
            'no_hp'   => formatNomorHP($no_hp),
            'table'   => $table
        ])->num_rows();

        if ($data_spam < 50) {
            $curl = curl_init();

            curl_setopt_array($curl, array(
                CURLOPT_URL => 'http://localhost:5001/send-message',
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_POST => true,
                CURLOPT_POSTFIELDS => 'message=' . urlencode($message) . '&number=' . formatNomorHP($no_hp),
                CURLOPT_HTTPHEADER => ['Content-Type: application/x-www-form-urlencoded']
            ));

            $response = curl_exec($curl);
            curl_close($curl);

            $response_data = json_decode($response, true);

            if ($response_data && $response_data['status'] === true) {
                $CI->db->insert('log_wa', [
                    'no_hp'      => formatNomorHP($no_hp),
                    'msg'        => urlencode($message),
                    'table'      => $table,
                    'table_id'   => $table_id,
                    'status'     => 'true',
                    'msg_status' => $response_data['response']['status'],
                    'tanggal'    => date('Y-m-d'),
                    'from'       => $from,
                    'logs'       => ''
                ]);
            }
        } else {
            $CI->db->insert('log_wa', [
                'no_hp'      => formatNomorHP($no_hp),
                'msg'        => urlencode($message),
                'table'      => $table,
                'table_id'   => $table_id,
                'status'     => 'SKIPPED',
                'tanggal'    => date('Y-m-d'),
                'from'       => $from,
                'msg_status' => '',
                'logs'       => ''
            ]);
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

}
