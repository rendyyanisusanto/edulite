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
		send_ajax("Siswa/get_siswa_mutasi", {idkelas:$('.select_class').val()}).then(function(data){
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
		if ($('.select_class_tujuan').val() !== "") {
			if ($('.select_class').val() !== $('.select_class_tujuan').val()) {
				if (confirm("Apakah anda yakin menaikan kelas atas nama siswa "+ $(this).data("nama") +" dari kelas "+$(this).data("kelas") + " ke Kelas "+$( ".select_class_tujuan option:selected" ).text()) == true) {
			  		
			  		send_ajax("Siswa/proses_naik_kelas",{
			  			idkelas_asal : $('.select_class').val(),
			  			idkelas_tujuan : $('.select_class_tujuan').val(),
			  			idsiswa_fk	: $(this).data("id")
			  		}).then(function(data){

            			toastr.success('Data berhasil ditambahkan, Refresh untuk melihat perubahan');
			  			get_kelas();
			  			get_kelas_tujuan();
			  		});
				} 
			}
			else{
				toastr.error('Tidak bisa memindahkan ke kelas yang sama');
			}
		}else{
			toastr.error('Pilih kelas tujuan');
		}
		
	})
</script>