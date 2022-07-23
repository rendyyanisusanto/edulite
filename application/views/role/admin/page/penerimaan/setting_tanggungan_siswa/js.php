<script type="text/javascript">
	get_data();
	function get_data()
	{
		send_ajax('Penerimaan/get_setting',{}).then(function(data){
			$('.data').html(data)
		})
	}
	$(document).on('click', '.btn-detail', function(e){
		e.stopImmediatePropagation();

		$('.modal').modal('toggle');
	});
</script>