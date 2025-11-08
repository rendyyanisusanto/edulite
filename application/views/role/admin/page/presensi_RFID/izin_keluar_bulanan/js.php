<script>
  function get_izin_keluar_bulanan() {
    const bulan = $('#bulan').val();
    const kelas = $('#kelas').val();

    send_ajax('Presensi_RFID/proses_izin_keluar_bulanan', {
      bulan: bulan,
      kelas: kelas
    }).then(function (html) {
      $('.content-izin-keluar-bulanan').html(html);
    });
  }
</script>
