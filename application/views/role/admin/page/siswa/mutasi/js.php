<script type="text/javascript">
	$('.select_class').select2();
	$('.select_class_tujuan').select2();

	$('.select_class').on('change', function(e){
		e.stopImmediatePropagation()

		get_kelas();
	})

	$('.select_class_tujuan').on('change', function(e){
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
	$(document).on('click', '.btn-proc', function(e){
		e.stopImmediatePropagation()
		if ($('.select_class_tujuan').val() !== "") {
			if ($('.select_class').val() !== $('.select_class_tujuan').val()) {
				if (confirm("Apakah anda yakin memindahkan siswa "+ $(this).data("nama") +" dari kelas "+$(this).data("kelas") + " ke Kelas "+$( ".select_class_tujuan option:selected" ).text()) == true) {
			  		
			  		send_ajax("Siswa/proses_pindah",{
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