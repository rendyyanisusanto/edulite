<script type="text/javascript">
	proses();

	function proses(){
		let tanggal = $('.tanggal').val();

		send_ajax("Prakerin/proses_prakerin", {tanggal : tanggal}).then(function(data){
			$('.content-proses-prakerin').html(data);
		})
	}


	
</script>