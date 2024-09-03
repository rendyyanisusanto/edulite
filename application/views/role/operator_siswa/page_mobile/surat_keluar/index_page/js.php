<script>
	
	get_data();

	function get_data(){
		send_ajax("surat_keluar/get_data_surat_keluar",{}).then(function(data){
			$('.content-surat-keluar').html(data);
		})
	}

	function hapus_data(id){
		send_ajax("surat_keluar/hapus_data/"+id,{}).then(function(data){
			get_data();
		})
	}
</script>