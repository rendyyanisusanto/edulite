<?php
defined('BASEPATH') or exit('No direct script access allowed');

function generate_minio_key($jenis, $nama_file, $santri_id = null, $subfolder = '')
{
    $slug = time() . '_' . preg_replace('/[^a-zA-Z0-9_\-\.]/', '_', $nama_file);

    $base = $jenis;

    if ($santri_id) {
        $base .= "/$santri_id";
    }

    if (!empty($subfolder)) {
        $base .= "/$subfolder";
    }

    return "$base/$slug";
}

/**
 * Upload file ke MinIO dari $_FILES langsung
 *
 * @param string $field Nama input file (ex: 'foto')
 * @param string $jenis Jenis (foto, dokumen, dll)
 * @param int|null $santri_id Opsional, ID santri untuk struktur path
 * @param string $subfolder Opsional, subfolder tambahan
 * @return string|false URL file di MinIO jika sukses, false jika gagal
 */
function upload_to_minio($field, $jenis, $id = null, $subfolder = '', $compress = true)
{
    $CI =& get_instance();
    $CI->load->library('minio_client');

    if (!isset($_FILES[$field]) || $_FILES[$field]['error'] != 0) {
        return false;
    }

    $fname     = $_FILES[$field]['name'];
    $tmp_file  = $_FILES[$field]['tmp_name'];
    $key       = generate_minio_key($jenis, $fname, $id, $subfolder);

    $ext = strtolower(pathinfo($fname, PATHINFO_EXTENSION));
    $compressed_tmp = $tmp_file;

    if ($compress && in_array($ext, ['jpg', 'jpeg', 'png'])) {
        // Kompres file ke direktori sementara
        $CI->load->library('image_lib');
        $compressed_tmp = sys_get_temp_dir() . '/' . time() . '_' . $fname;

        $config_img = [
            'image_library'  => 'gd2',
            'source_image'   => $tmp_file,
            'new_image'      => $compressed_tmp,
            'quality'        => '60%',
            'maintain_ratio' => TRUE,
            'width'          => 800,
            'height'         => 800
        ];

        $CI->image_lib->initialize($config_img);
        if (!$CI->image_lib->resize()) {
            log_message('error', 'Image resize failed: ' . $CI->image_lib->display_errors());
            return false;
        }
    }

    // Upload ke MinIO
    $url = $CI->minio_client->upload($compressed_tmp, $key);

    if ($compressed_tmp !== $tmp_file) {
        @unlink($compressed_tmp); // hapus file hasil kompresi dari /tmp
    }

    return $url;
}