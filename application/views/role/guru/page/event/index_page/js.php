<script type="text/javascript">
	$('.btn-sbm').on('click', function(e){
		send_ajax('Event/konfirmasi', {id:$(this).data('id')}).then(function(data){
			toastr.success("Berhasil konfirmasi kehadiran");
			set_content('Dashboard/get_data');
		});
	});
</script>