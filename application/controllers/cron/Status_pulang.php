<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Status_pulang extends CI_Controller {
     public function change_status_pulang($status = 0) {
        $this->db->where('table', 'status_pulang');
        $this->db->update('setting_table', [
            'value' => $status
        ]);    
    }
}