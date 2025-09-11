<script>
	
	get_data();

	function get_data(){
		// Show loading spinner
		$('.content-request').html(`
			<div class="loading-spinner">
				<div><i class="icon-spinner"></i></div>
				<div>Memuat data surat izin...</div>
			</div>
		`);
		
		send_ajax("surat_izin_siswa/get_data_request",{}).then(function(data){
			$('.content-request').html(data);
		}).catch(function(error){
			$('.content-request').html(`
				<div class="text-center" style="padding: 40px 20px; color: #6c757d;">
					<div><i class="icon-warning" style="font-size: 48px; margin-bottom: 15px; opacity: 0.5;"></i></div>
					<h5 style="margin-bottom: 10px; color: #495057;">Gagal Memuat Data</h5>
					<p style="font-size: 14px; margin-bottom: 20px;">Terjadi kesalahan saat mengambil data. Silakan coba lagi.</p>
					<button onclick="get_data()" class="btn btn-primary btn-sm">
						<i class="icon-refresh"></i> Coba Lagi
					</button>
				</div>
			`);
		});
	}

	function hapus_data(id){
		if(confirm('Apakah Anda yakin ingin menghapus surat ini?')){
			send_ajax("surat_izin_siswa/hapus_data/"+id,{}).then(function(data){
				get_data();
			});
		}
	}

	// Auto refresh every 5 minutes
	setInterval(function(){
		get_data();
	}, 300000); // 5 minutes
</script>