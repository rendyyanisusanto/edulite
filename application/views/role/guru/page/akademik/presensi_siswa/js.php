<script type="text/javascript">
	$(document).on('submit', '#app-proses', function(e){
		blockui($('.proses-absen'));
		blockui($('.panel-head'));
		send_ajax($(this).attr('action'), $(this).serialize()).then(function(data){
			setTimeout(function(){ 
                $('.proses-absen').html(data);
				unblockui($('.proses-absen'));
				unblockui($('.panel-head'));
            }, 1000);
			
		});
		return false;
	});

	$(document).on('submit', '#app-proses-save', function(e){
		blockui($('.proses-absen'));
		send_ajax($(this).attr('action'), $(this).serialize()).then(function(data){
			toastr.success("Presensi berhasil disimpan");
			$('.proses-absen').html(data);	
			unblockui($('.proses-absen'));
		});
		return false;
	});
</script>