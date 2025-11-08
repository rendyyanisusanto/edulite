<script>
    function get_tidak_masuk_berturut() {
        const tanggal_mulai = $('#tanggal_mulai').val();
        const tanggal_selesai = $('#tanggal_selesai').val();
        const kelas = $('#kelas').val();
        const min_berturut = $('#min_berturut').val();

        send_ajax('Presensi_RFID/proses_tidak_masuk_berturut', {
            tanggal_mulai: tanggal_mulai,
            tanggal_selesai: tanggal_selesai,
            kelas: kelas,
            min_berturut: min_berturut
        }).then(function (html) {
            $('.content-berturut').html(html);
        });
    }
</script>
