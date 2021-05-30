<script type="text/javascript">
	$(document).on('submit', '#app-submit', function(e){
		e.stopImmediatePropagation();
		blockui($('.panel-top'));
		blockui($('.panel-proses'));
		send_ajax($(this).attr('action'), $(this).serialize()).then(function(data){
			$('.panel-nilai').html(data);
			unblockui('.panel-top');
			unblockui('.panel-proses');
		});
		return false;
	})

	function maxLengthCheck(object)
	{
	    if (object.value.length > object.maxLength)
	      object.value = object.value.slice(0, object.maxLength)
	}
</script>