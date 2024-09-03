<script>
	
	get_data();

	function get_data(){
		send_ajax("request_absen/get_data_request",{}).then(function(data){
			$('.content-request').html(data);
		})
	}

	function hapus_data(id){
		send_ajax("request_absen/hapus_data/"+id,{}).then(function(data){
			get_data();
		})
	}
</script>