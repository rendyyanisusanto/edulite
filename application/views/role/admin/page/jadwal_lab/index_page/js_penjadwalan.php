<script type="text/javascript">
	get_jadwal();
	function get_jadwal(){
		var nweek = $('.nweek').val();
		send_ajax('Jadwal_lab/jadwal', {tanggal:nweek}).then(function(data){
			$('.content-jadwal').html(data)
		})
	}
</script>