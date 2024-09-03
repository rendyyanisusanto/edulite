<script>
	
	get_data();

	function get_data(){
		send_ajax("penggajian/get_data_hr",{}).then(function(data){
			$('.content-hr').html(data);
		})
	}

	function hapus_data(id){
		send_ajax("penggajian/hapus_data/"+id,{}).then(function(data){
			get_data();
		})
	}
</script>