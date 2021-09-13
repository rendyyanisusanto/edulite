<script type="text/javascript">
	set_data();
	function set_data()
	{
		send_ajax("catatan_siswa/get_catatan", {}).then(function(data){
			$('.content-panel').html(data);
		})
	}
</script>