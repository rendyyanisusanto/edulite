<script>
  function get_izin_keluar_harian() {
    const tanggal = $('#tgl_izin').val();
    const kelas = $('#kelas_izin').val();

    send_ajax('Presensi_RFID/proses_izin_keluar_harian', {
      tanggal: tanggal,
      kelas: kelas
    }).then(function (html) {
      $('.content-izin-keluar').html(html);
    });
  }
</script>
