<script>
	
	get_data();

	function get_data(){
		send_ajax("Pengajuan_karakter_siswa/get_data_request",{}).then(function(data){
			$('.content-request').html(data);
		})
	}

	function hapus_data(id){
		send_ajax("Pengajuan_karakter_siswa/hapus_data/"+id,{}).then(function(data){
			get_data();
		})
	}
</script>