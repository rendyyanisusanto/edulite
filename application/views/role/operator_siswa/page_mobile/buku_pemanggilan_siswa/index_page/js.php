<script>
	
	get_data();

	function get_data(){
		send_ajax("buku_pemanggilan_siswa/get_data_pemanggilan",{}).then(function(data){
			$('.content-pelanggaran').html(data);
		})
	}

	function hapus_data(id){
		send_ajax("buku_pemanggilan_siswa/hapus_data/"+id,{}).then(function(data){
			get_data();
		})
	}
</script>