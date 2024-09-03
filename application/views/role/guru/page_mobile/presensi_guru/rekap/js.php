<script>
	
	get_data();

	function get_data(){
		send_ajax("Presensi_guru/get_data_rekap",{}).then(function(data){
			$('.content-rekap').html(data);
		})
	}

	function hapus_data(id){
		send_ajax("Presensi_guru/hapus_data/"+id,{}).then(function(data){
			get_data();
		})
	}
</script>