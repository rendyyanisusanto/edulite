<script type="text/javascript">
	$('.select').select2();

	$('.btn-proses').on('click', function(e){
		if ($('.jadwal').val() !== "" ) {
		var kelas 			= $('.kelas').val();
		var guru 			= $('.guru').val();
		var mata_pelajaran 	= $('.mata_pelajaran').val();
		var jam 			= $('.jam').val();
		var tanggal			= $('.tanggal').val();
		send_ajax( 'uts/get_siswa',{kelas:kelas, guru:guru, mata_pelajaran:mata_pelajaran} ).then( function(data){
           $('.panel-siswa').html(data);
        });
	}else{
		toastr.error('Pilih jadwal terlebih dahulu');
	}
	});

	$('.jadwal').on('change', function(e){
		e.stopImmediatePropagation();

		// console.log($(this).val());

		send_ajax( 'uts/get_kelas_jadwal',{id:$(this).val()} ).then( function(data){
           var response = JSON.parse(data);
           // console.log(response);
           $('.idkelas_fk').val(response.id_kelas);
           $('.idmatapelajaran_fk').val(response.id_mata_pelajaran);
        });
	});

	$( "#app-submit" ).on('submit',function( e ) {
	    e.stopImmediatePropagation();
	    e.preventDefault();
	        send_ajax( 'uts/konversi_data',$(this).serialize() ).then( function(data){
	            console.log(data);
	            var response = JSON.parse(data);
	            $.each(response.siswa, function(i, item) {
				    $('.b'+i).text(item.benar);
				    $('.s'+i).text(item.salah);
				    if (item.nilai > 70) {
				    	$('.n'+i).addClass('text-success');
				    }else{
				    	$('.n'+i).addClass('text-danger');
				    }
				    $('.n'+i).text(item.nilai);
				    console.log(item)
				})
	            toastr.success('Data berhasil ditambahkan, Refresh untuk melihat perubahan');
	        });

	    return false;
	});

</script>