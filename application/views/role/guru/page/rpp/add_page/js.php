<script type="text/javascript">
	$('.kelas_mapel').on('change', function(e){
		var idmapel = $(this).find('option:selected').attr('idmapel');
		var idkelas = $(this).find('option:selected').attr('idkelas');

		send_ajax( 'Rpp/set_materi',{idmapel:idmapel, idkelas:idkelas } ).then( function(data){
	        $('.set_materi').html(data);
	    });
	});

	$( "#app-submit" ).on('submit',function( e ) {
	    e.preventDefault();
	    $('.se-pre-con').css('display','block');
	       var form_data = new FormData(this);
	        send_ajax_file( $(this).attr('action'),form_data).then( function(data){
	            $(".se-pre-con").fadeOut("slow");
	            toastr.success('Data berhasil ditambahkan, Refresh untuk melihat perubahan');
	            set_content('<?php echo $data_get['param']['table'] ?>/get_data');
	        });
	    return false;
	});
</script>