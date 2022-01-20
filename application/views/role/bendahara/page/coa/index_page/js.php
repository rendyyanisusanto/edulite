<script type="text/javascript">
	$(document).on('click', '.btn-process', function(e){
		e.stopImmediatePropagation();
		var id = $(this).data('id');
		proses(id);
	});

	$(document).on('submit', '#app-submit', function(e){

		e.stopImmediatePropagation();

		send_ajax($(this).attr('action'), $(this).serialize()).then(function(data){

	        var id = $('.idindukakun_fk').val();
			proses(id);
	        toastr.success('Data berhasil ditambahkan, Refresh untuk melihat perubahan');
		});
		return false;
	});

	$(document).on('click', '.btn-edit', function(e){
		$('.nama').val($(this).data('nama'));
		$('.no_ref').val($(this).data('no_ref'));
		$('.saldo_normal').val($(this).data('saldo_normal'));
		$('.btn-batal').css('display', '');
		$('#app-submit').attr('action','Coa/update_data');
		$('.btn-submit').html('<i class="icon-check"></i> Update Data');
		$('.btn-submit').removeClass('btn-success');
		$('.btn-submit').addClass('btn-warning');
		$('.id_akun').val($(this).data('id_akun'));
	});

	$(document).on('click', '.btn-batal', function(e){
		normal();
	})

	$(document).on('click', '.btn-delete', function(e){
		if (confirm("Apakah anda yakin akan menghapus akun "+$(this).data('nama')) == true) {
		    
		    send_ajax('Coa/hapus_akun', {id:$(this).data('id_akun')}).then(function(data){
		    	var id = $('.idindukakun_fk').val();
				proses(id);
		        toastr.success('Data berhasil dihapus, Refresh untuk melihat perubahan');
		    })
		  } else {

		  }
	})
	function proses(id)
	{
		blockui($('.panel-process'));
		send_ajax('Coa/get_akun',{id:id}).then(function(data){

			unblockui($('.panel-process'));
			$('.panel-process').html(data);
		});
	}
	function normal(){

		$('.nama').val('');
		$('.no_ref').val('');
		$('.saldo_normal').val('D');
		$('.btn-batal').css('display', 'none');
		$('.btn-submit').html('<i class="icon-plus3"></i> Tambah Data');
		$('#app-submit').attr('action','Coa/simpan_data');
		$('.btn-submit').removeClass('btn-warning');
		$('.btn-submit').addClass('btn-success');
		$('.id_akun').val('');
	}
</script>