<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Status_pulang extends CI_Controller {
    public function change_status_pulang($status = 0) {
        // Set response type
        header('Content-Type: application/json');

        // Validasi status (hanya boleh 0 atau 1)
        if (!in_array($status, ['0', '1'], true)) {
            echo json_encode([
                'status' => false,
                'message' => 'Status tidak valid. Gunakan 0 atau 1.'
            ]);
            return;
        }

        // Update data
        $this->db->where('table', 'status_pulang');
        $updated = $this->db->update('setting_table', [
            'value' => $status
        ]);

        // Response
        if ($updated) {
            echo json_encode([
                'status' => true,
                'message' => 'Status pulang berhasil diperbarui.',
                'data' => ['value' => $status]
            ]);
        } else {
            echo json_encode([
                'status' => false,
                'message' => 'Gagal memperbarui status pulang.'
            ]);
        }
    }
}