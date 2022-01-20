<script type="text/javascript">
	$('.select').select2();

	$('.btn-proses').on('click', function(e){
		get_mapel();
	});

	$(document).on('click','.btn-proses-mapel', function(e){

    	e.stopImmediatePropagation();
		var tahun_ajaran	= $('.tahun_ajaran').val();
		var guru 			= $('.guru').val();
		var mapel  			= $('.idmapel_fk').val();
		var kelas  			= $('.idkelas_fk').val();
		send_ajax( 'guru_mapel/save_mapel',{idtahunajaran_fk:tahun_ajaran,idguru_fk:guru, idmapel_fk:mapel, idkelas_fk:kelas} ).then( function(data){
			toastr.success('Data berhasil ditambahkan, Refresh untuk melihat perubahan');
           get_mapel();
        });
	});

	$(document).on('click', '.btn-hps', function(e){
		e.stopImmediatePropagation();
		var id = $(this).data('id');
		send_ajax( 'guru_mapel/hapus_mapel',{id:id} ).then( function(data){
			toastr.success('Data berhasil dihapus, Refresh untuk melihat perubahan');
           get_mapel();
        });

	});

	function get_mapel()
	{

		blockui($('.panel-guru'));
		var tahun_ajaran	= $('.tahun_ajaran').val();
		var guru 			= $('.guru').val();
		send_ajax( 'guru_mapel/get_data_guru',{idtahunajaran_fk:tahun_ajaran,idguru_fk:guru} ).then( function(data){
           $('.panel-guru').html(data);

		unblockui($('.panel-guru'));
        });
	}

</script>