<script type="text/javascript">
	$(".tipe").select2({});

	$(document.body).on('change', '.tipe', function(e){
		send_ajax('Pelanggaran_siswa/set_laporan', {tipe:$(this).val()}).then(function(data){
			$('.p-next').html(data);
		})
	});

	$(document).on('submit', '#app-submit', function(e){
		blockui($('.panel-presensi'));
		send_ajax($(this).attr('action'), $(this).serialize()).then(function(data){
			$('.panel-presensi').html(data);
			unblockui($('.panel-presensi'));
		});

		return false;
	});
</script>