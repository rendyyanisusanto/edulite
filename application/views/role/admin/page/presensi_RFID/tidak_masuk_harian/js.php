<script>
    function get_tidak_masuk_harian() {
        const tanggal = $('#tanggal').val();
        const kelas = $('#kelas').val();

        send_ajax('Presensi_RFID/proses_tidak_masuk_harian', {
            tanggal: tanggal,
            kelas: kelas
        }).then(function (html) {
            $('.content-tidak-masuk').html(html);
        });
    }
</script>
