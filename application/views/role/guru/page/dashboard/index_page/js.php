<script type="text/javascript">
	$(document).on('click', '.btn-check', function(e){
		e.stopImmediatePropagation();

		send_ajax('Dashboard/check', {status:$(this).data('status')}).then(function(data){
			toastr.success("Berhasil check in/out");
			set_content('Dashboard/get_data');
		});
	})
</script>