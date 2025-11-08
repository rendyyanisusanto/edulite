<script>
	function get_laporan_harian() {
		const tanggal = $('#tanggal').val();
		const kelas = $('#kelas').val();

		send_ajax('Presensi_RFID/proses_laporan_harian', {
			tanggal: tanggal,
			kelas: kelas
		}).then(function (html) {
			$('.content-laporan').html(html);
		});
	}
</script>
