<script type="text/javascript">
	$('.btn-config').on('click', function(e){
		$('.modal-title').text('Setting Wali Kelas '+$(this).data('kelas'));
		$('.id_kelas').val($(this).data('id'));
		$('.modal').modal('toggle');
	});

	$(document).on('submit', '.frm-wali', function(e){
		e.stopImmediatePropagation();

		send_ajax($(this).attr('action'),$(this).serialize()).then(function(data){
			$('.modal').modal('toggle');
			set_content('Wali_kelas/get_data');
		});

		return false;
	});
</script>