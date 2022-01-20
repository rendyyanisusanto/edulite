<script type="text/javascript">
	$(document).on('submit', '#app-proses', function(e){
		blockui($('.proses-jurnal'));
        blockui($('.panel-head'));
		send_ajax($(this).attr('action'), $(this).serialize()).then(function(data){
            setTimeout(function(){ 
                $('.proses-jurnal').html(data);
                unblockui($('.proses-jurnal'));
                unblockui($('.panel-head'));
            }, 1000);
		});
		return false;
	});

	$(document).on('submit', '#app-jurnal-save', function(e){
		blockui($('.proses-jurnal'));
		send_ajax($(this).attr('action'), $(this).serialize()).then(function(data){
			toastr.success("Presensi berhasil disimpan");
			$('.proses-jurnal').html(data);	
			unblockui($('.proses-jurnal'));
		});
		return false;
	});


    $(document).on('click', '.btn-edit-jurnal', function(e){
        e.stopImmediatePropagation();

        $('.btn-batal').css('display', "");
        $('.btn-jurnal-submit').addClass('btn-primary');
        $('.btn-jurnal-submit').html('<i class="icon-pencil3"></i> Ubah Data');
        $('.btn-jurnal-submit').removeClass('btn-success');
        $('#app-jurnal-save').attr('action', 'Akademik/update_jurnal_harian');
        $('.uraian_jurnal').val($(this).data('uraian'));
        $('.id_jurnal_guru').val($(this).data('id'));
    });

    $(document).on('click', '.btn-batal', function(e){
         $('.btn-batal').css('display', "none");
        $('.btn-jurnal-submit').html('<i class="icon-floppy-disk"></i> Simpan');
        $('.btn-jurnal-submit').removeClass('btn-primary');
        $('.btn-jurnal-submit').addClass('btn-success');
        $('#app-jurnal-save').attr('action', 'Jurnal_guru/save_jurnal_harian');
        $('.uraian_jurnal').val("");
    })

     $(document).on('click', '.btn-del-jurnal', function(e){
        e.stopImmediatePropagation();

        
        if (confirm('Apakah anda yakin menghapus data ini?')) {
            blockui($('.proses-jurnal'));
           send_ajax('Akademik/delete_jurnal/'+$(this).data('id')+'/'+$(this).data('idmapel')+'/'+$(this).data('tanggal'), {}).then(function(data){
                toastr.success('Data berhasil dihapus, Refresh untuk melihat perubahan');
                $('.proses-jurnal').html(data);	
                unblockui($('.proses-jurnal'));
                
            });
        } else {
        }
    });


</script>