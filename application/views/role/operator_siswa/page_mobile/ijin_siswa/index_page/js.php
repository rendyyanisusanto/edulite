<script>
	
	get_data();

	function get_data(){
		send_ajax("Ijin_siswa/get_data_ijin",{}).then(function(data){
			$('.content-ijin').html(data);
		})
	}

	function hapus_data(id){
		send_ajax("Ijin_siswa/hapus/"+id,{}).then(function(data){
			get_data()
		})
	}
</script>