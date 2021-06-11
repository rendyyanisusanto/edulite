<script type="text/javascript">

	$('.select').select2();
	$('.btn-proses').on('click', function(e){
		e.stopImmediatePropagation();

		get_jam();
	})
	get_jam();

	$( document ).on('submit', "#app-submit",function( e ) {
	    e.preventDefault();
		e.stopImmediatePropagation();
		blockui($('.panel-head'));
		blockui($('.panel-jam'));
	        send_ajax( $(this).attr('action'),$(this).serialize() ).then( function(data){
	            var response = JSON.parse(data);
	            if (response.status == 1) {
	            	toastr.success('Data berhasil ditambahkan/diubah, Refresh untuk melihat perubahan');
	            }else{
	            	toastr.error('Data Gagal Ditambahkan/diubah');
	            }
				unblockui($('.panel-head'));
				unblockui($('.panel-jam'));

				get_jam();
	        });
	    return false;
	});
	function get_jam()
	{

		blockui($('.panel-head'));
		blockui($('.panel-jam'));
		var tahun_ajaran	= $('.tahun_ajaran').val();
		send_ajax( 'jam_pelajaran/get_jam/'+tahun_ajaran,{} ).then( function(data){
           $('.panel-jam').html(data);
		unblockui($('.panel-head'));
		unblockui($('.panel-jam'));
        });
	}
	$(document).on('click', '.btn-edit', function(e){
		e.stopImmediatePropagation();
		$('.btn-submit').removeClass('btn-success');
		$('.btn-submit').addClass('btn-info');
		$('.btn-submit').html('<i class="icon-checkmark3"></i> Update');
		$('.btn-batal').css('display', '');


		$('#app-submit').attr('action', 'jam_pelajaran/update_data');
		$('.nama').val($(this).data('nama'));
		$('.jam_mulai').val($(this).data('jam_mulai'));
		$('.jam_selesai').val($(this).data('jam_selesai'));
		$('.id_jam_pelajaran').val($(this).data('id_jam_pelajaran'));
	})

	$(document).on('click', '.btn-batal', function(e){
		e.stopImmediatePropagation();
		$('.btn-submit').removeClass('btn-info');
		$('.btn-submit').addClass('btn-success');
		$('.btn-submit').html('<i class="icon-floppy-disk"></i> Simpan');
		$('.btn-batal').css('display', 'none');


		$('#app-submit').attr('action', 'jam_pelajaran/simpan_data');
		$('.nama').val("");
		$('.jam_mulai').val("");
		$('.jam_selesai').val("");
		$('.id_jam_pelajaran').val("");
	})

	$(document).on('click', '.btn-del', function(e){
		e.stopImmediatePropagation();

		if (confirm('Apakah anda yakin menghapus data ini?')) {
			send_ajax( 'jam_pelajaran/hapus_data/'+$(this).data('id_jam_pelajaran'),{} ).then( function(data){
	           var response = JSON.parse(data);
	            if (response.status == 1) {
	            	toastr.success('Data berhasil dihapus, Refresh untuk melihat perubahan');
	            }else{
	            	toastr.error('Data Gagal dihapus');
	            }
	            get_jam();
	        });
		} else {
		}
	})
</script>