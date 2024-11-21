<?php
defined('BASEPATH') OR exit('No direct script access allowed');

if (!function_exists('generate_uuid')) {
    function generate_uuid() {
        // Membuat UUID versi 4
        $data = random_bytes(16);
        $data[6] = chr(ord($data[6]) & 0x0f | 0x40); // versi 4
        $data[8] = chr(ord($data[8]) & 0x3f | 0x80); // varian RFC 4122

        return vsprintf('%s%s-%s-%s-%s-%s%s%s', str_split(bin2hex($data), 4));
    }
}