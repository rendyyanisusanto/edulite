<script type="text/javascript">
	$('.btn-proses').on('click', function(e){
		e.stopImmediatePropagation();
		get_siswa();
		
	})

	function get_siswa(){

		blockui($('.panel-proses'));
		blockui($('.panel-head'));
		send_ajax( 'Oas/get_proses',{
			idkelas : $('.kelas_oas').val()
		}).then( function(data){

			unblockui($('.panel-proses'));
			unblockui($('.panel-head'));
	        $('.panel-proses').html(data);
	    });
	}
	$(document).on('click', '.btn-upload', function(e){
		e.stopImmediatePropagation();
		$('.idsiswa').val($(this).data('idsiswa'));
		$('#modal_animation').modal('toggle');
	})

	$( "#app-submit" ).on('submit',function( e ) {
				blockui($('#modal_animation'));
			    e.stopImmediatePropagation();
			    e.preventDefault();
		        var form_data = new FormData(this);
		        send_ajax_file( $(this).attr('action'),form_data).then( function(data){
			        toastr.success('Data berhasil ditambahkan, Refresh untuk melihat perubahan');

					unblockui($('#modal_animation'));
					$('#modal_animation').modal('toggle');
					get_siswa();
			    });
	    return false;
	});
</script>