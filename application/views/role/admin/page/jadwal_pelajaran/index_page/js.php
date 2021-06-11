<script type="text/javascript">
	$('.select').select2();
	get_jadwal();
	$(document).on('click', '.btn-edit-proses', function(e){
		e.stopImmediatePropagation();
		$('.idhari_modal').val($(this).data('idhari'));
		$('.id_jadwal_pelajaran').val($(this).data('idjadwal'));
		$('.hari_modal').val($(this).data('hari'));
		$('.jam_modal').val($(this).data('jam_ke'));
		$('.idmapelguruedit_fk').val($(this).data('idmapel')).trigger('change');
		$('.idjam_modal').val($(this).data('idjam'));
		$('#modal_ubah_jadwal').modal('toggle');
	})
	$(document).on('click','.btn-add-proses', function(e){
		e.stopImmediatePropagation();
		$('.idhari_modal').val($(this).data('idhari'));
		$('.hari_modal').val($(this).data('hari'));
		$('.jam_modal').val($(this).data('jam_ke'));
		$('.idjam_modal').val($(this).data('idjam'));
		$('#modal_add_jadwal').modal('toggle');
	});
	$(document).on('click', '.btn-proses', function(e){
		e.stopImmediatePropagation();

		get_jadwal();
	});
	function get_jadwal()
	{
		blockui($('.panel-head'));
		blockui($('.panel-proses'));
		var tahun_ajaran	= $('.tahun_ajaran').val();
		var kelas			= $('.kelas').val();
		send_ajax( 'jadwal_pelajaran/get_jadwal/'+tahun_ajaran+'/'+kelas,{} ).then( function(data){
           $('.panel-proses').html(data);
		unblockui($('.panel-head'));
		unblockui($('.panel-proses'));
        });
	}

	$( document ).on('submit', "#app-submit-modal",function( e ) {
	    e.preventDefault();
		e.stopImmediatePropagation();
		blockui($('#modal_add_jadwal'));
	        send_ajax( $(this).attr('action'),$(this).serialize() ).then( function(data){
	            
				unblockui($('#modal_add_jadwal'));

				$('#modal_add_jadwal').modal('toggle');
				get_jadwal();
	        });
	    return false;
	});

	$( document ).on('submit', "#app-edit-modal",function( e ) {

	    e.preventDefault();
		e.stopImmediatePropagation();
		blockui($('#modal_ubah_jadwal'));
	        send_ajax( $(this).attr('action'),$(this).serialize() ).then( function(data){
	            
				unblockui($('#modal_ubah_jadwal'));

				$('#modal_ubah_jadwal').modal('toggle');
				get_jadwal();
	        });
	    return false;
	});

	$(document).on('click', '.btn-del-jadwal', function(e){
		e.stopImmediatePropagation();

		blockui($('#modal_ubah_jadwal'));
	    send_ajax( 'jadwal_pelajaran/delete_jadwal',{idjadwal : $('.id_jadwal_pelajaran').val()} ).then( function(data){
	        unblockui($('#modal_ubah_jadwal'));
			$('#modal_ubah_jadwal').modal('toggle');
			get_jadwal();
	    });
	})
</script>