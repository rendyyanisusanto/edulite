<script>
    function get_laporan_bulanan() {
        const bulan = $('#bulan').val();
        const kelas = $('#kelas').val();

        send_ajax('Presensi_RFID/proses_laporan_bulanan', {
            bulan: bulan,
            kelas: kelas
        }).then(function (html) {
            $('.content-laporan-bulanan').html(html);
        });
    }
</script>
