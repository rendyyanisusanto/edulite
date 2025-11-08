<script>
    function get_laporan_mingguan() {
        const tanggal_mulai = $('#tanggal_mulai').val();
        const kelas = $('#kelas').val();

        send_ajax('Presensi_RFID/proses_laporan_mingguan', {
            tanggal_mulai: tanggal_mulai,
            kelas: kelas
        }).then(function (html) {
            $('.content-laporan-mingguan').html(html);
        });
    }
</script>
