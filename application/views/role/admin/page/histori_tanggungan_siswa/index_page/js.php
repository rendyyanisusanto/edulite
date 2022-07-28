<script type="text/javascript">
	get_data();
	function get_data()
	{
		send_ajax('Histori_tanggungan_siswa/get_setting',{idkelas:$('.idkelas').val()}).then(function(data){
			$('.data').html(data)
		})
	}
	$('.idkelas').on('change', function(e){
		get_data();
	})
</script>