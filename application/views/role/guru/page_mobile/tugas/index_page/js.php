<script>
	
	get_data();

	function get_data(){
		send_ajax("Tugas/get_data_request",{}).then(function(data){
			$('.content-request').html(data);
		})
	}

	function hapus_data(id){
		send_ajax("Tugas/hapus_data/"+id,{}).then(function(data){
			get_data();
		})
	}
</script>