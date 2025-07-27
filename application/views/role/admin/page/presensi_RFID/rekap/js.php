<script>
    function get_presensi() {
        send_ajax('Presensi_RFID/proses_presensi', {
            'tanggal_mulai': $('#tanggal_mulai').val(),
            'tanggal_selesai': $('#tanggal_selesai').val(),
            'kelas': $('#kelas').val()
        }).then(function(data) {
            $('.content-presensi').html(data);
        });
    }
</script>