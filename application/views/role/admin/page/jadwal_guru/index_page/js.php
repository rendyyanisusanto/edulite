<script type="text/javascript">
	$('.select').select2();

	$('.btn-proses').on('click', function(e){
		get_hari();
	});

	$(document).on('click','.btn-proses-hari', function(e){

    	e.stopImmediatePropagation();

		var tahun_ajaran	= $('.tahun_ajaran').val();
		var guru 			= $('.guru').val();
		var hari  			= $('.idhari_fk').val();
		var jam_mulai  		= $('.jam_mulai').val();
		var jam_selesai  	= $('.jam_selesai').val();
		if (hari !== '' && jam_mulai !=='' && jam_selesai !== '') {
			send_ajax( 'jadwal_guru/save_hari',{idtahunajaran_fk:tahun_ajaran,idguru_fk:guru, idhari_fk:hari, jam_mulai:jam_mulai, jam_selesai:jam_selesai} ).then( function(data){
				toastr.success('Data berhasil ditambahkan, Refresh untuk melihat perubahan');
	           get_hari();
	        });
        }else{
        	toastr.error("Harap lengkapi data");
        }
	});
	$('.select').on("select2:select", function(e) { 
		e.stopImmediatePropagation();
		$('.select').trigger('change.select2');
	   get_hari();
	});
	$(document).on('click', '.btn-hps', function(e){
		e.stopImmediatePropagation();
		var id = $(this).data('id');
		send_ajax( 'jadwal_guru/hapus_hari',{id:id} ).then( function(data){
			toastr.success('Data berhasil dihapus, Refresh untuk melihat perubahan');
           get_hari();
        });

	});

	function get_hari()
	{

		blockui($('.panel-guru'));
		var tahun_ajaran	= $('.tahun_ajaran').val();
		var guru 			= $('.guru').val();
		send_ajax( 'jadwal_guru/get_hari',{idtahunajaran_fk:tahun_ajaran,idguru_fk:guru} ).then( function(data){
           $('.panel-guru').html(data);

			unblockui($('.panel-guru'));
        });
	}

</script>