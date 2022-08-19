<script type="text/javascript">
	$('.select').select2();



	$('.select_class_jurusan').on('change', function(e){
    	e.stopImmediatePropagation()
	    change_class();

	});
	$(document).on('change','.select_class', function(e){
		e.stopImmediatePropagation()

		get_kelas();
	})

	$(document).on('change','.select_class_tujuan', function(e){
		e.stopImmediatePropagation()

		get_kelas_tujuan();
	})

	function get_kelas()
	{
		send_ajax("Siswa/get_siswa_kelulusan", {idkelas:$('.select_class').val()}).then(function(data){
			$('.kelas_asal').html(data);
		})
	}
	function get_kelas_tujuan()
	{
		send_ajax("Siswa/get_kelas_tujuan_mutasi", {idkelas:$('.select_class_tujuan').val()}).then(function(data){
			$('.kelas_tujuan').html(data);
		})
	}
	function change_class()
	{
		send_ajax( 'Siswa/get_kelas_kenaikan',{'id_tingkat' : $('.select_class_tingkat').val(), 'id_jurusan': $('.select_class_jurusan').val()} ).then( function(data){
	        $('.select_kelas').html(data);
	    });
	    send_ajax( 'Siswa/get_kelas_kenaikan_next',{'id_tingkat' : $('.select_class_tingkat').val(), 'id_jurusan': $('.select_class_jurusan').val()} ).then( function(data){
	        $('.select_kelas_next').html(data);
	    });
	}
	$(document).on('click', '.btn-proc', function(e){
		e.stopImmediatePropagation()
		let conf = prompt("Apakah anda yakin akan meluluskan atas nama siswa "+ $(this).data("nama") +" dari kelas "+$(this).data("kelas") + ". Kelulusan kelas akan menghapus seluruh data siswa dalam sistem dan menjadikannya data alumni. ketik YAKIN untuk memprosesnya", "")
				if ( conf == "YAKIN" ) {
			  		// alert();
			  		send_ajax("Siswa/proses_alumni",{
			  			idkelas_asal : $('.select_class').val(),
			  			idsiswa_fk	: $(this).data("id")
			  		}).then(function(data){

            			toastr.success('Data berhasil ditambahkan, Refresh untuk melihat perubahan');
			  			get_kelas();
			  		});
				} 
			
	})
</script>