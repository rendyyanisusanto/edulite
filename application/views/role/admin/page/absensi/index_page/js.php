<script type="text/javascript">
	$('.select').select2();

	$('.btn-proses').on('click', function(e){
		var kelas 			= $('.kelas').val();
		var guru 			= $('.guru').val();
		var mata_pelajaran 	= $('.mata_pelajaran').val();
		var jam 			= $('.jam').val();
		var tanggal			= $('.tanggal').val();
		send_ajax( 'absensi/get_siswa',{kelas:kelas,tanggal:tanggal, guru:guru, mata_pelajaran:mata_pelajaran, jam:jam} ).then( function(data){
           $('.panel-siswa').html(data);
        });
	});

	$( "#app-submit" ).on('submit',function( e ) {
	    e.stopImmediatePropagation();
	    e.preventDefault();
	    // $('.se-pre-con').css('display','block');
	        send_ajax( 'absensi/simpan_data',$(this).serialize() ).then( function(data){
	            // $(".se-pre-con").fadeOut("slow");
	            console.log(data);
	            toastr.success('Data berhasil ditambahkan, Refresh untuk melihat perubahan');
	            // set_content('<?php echo $data_get['param']['table'] ?>/get_data');
	        });

	    return false;
	});

</script>