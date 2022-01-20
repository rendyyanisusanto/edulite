<script type="text/javascript">
	$('.btn-proses').on('click', function(e){
		e.stopImmediatePropagation();
		get_siswa();
		
	})

	function get_siswa(){

		blockui($('.panel-proses'));
		blockui($('.panel-head'));
		send_ajax( 'erapor/get_proses',{
			idkelas : $('.kelas_erapor').val()
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
	$(document).on('click', '.btn-ubh-status', function(e){
		e.stopImmediatePropagation();
		$('.iderapor').val($(this).data('iderapor'));
		$('.status_lulus').val($(this).data('status'));
		$('.is_active').val($(this).data('active'));
		$('#modal_ubah_status').modal('toggle');
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

	$( "#app-submit-ubah" ).on('submit',function( e ) {
				blockui($('#modal_ubah_status'));
			    e.stopImmediatePropagation();
			    e.preventDefault();
		        var form_data = new FormData(this);
		        send_ajax_file( $(this).attr('action'),form_data).then( function(data){
			        toastr.success('Data berhasil diubah, Refresh untuk melihat perubahan');

					unblockui($('#modal_ubah_status'));
					$('#modal_ubah_status').modal('toggle');
					get_siswa();
			    });
	    return false;
	});
</script>