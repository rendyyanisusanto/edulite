<script type="text/javascript">

	$('.tb').on('click', function(e){
		var dataset = $(this).data('set');

		set_item_tab(dataset);
	})
	set_item_tab('absen');


	$( document).on('submit',"#app-absen-save" ,function( e ) {
        e.preventDefault();
        e.stopImmediatePropagation();
                $('.btn-absen-submit').attr('disabled', 'true');
                $('.btn-absen-submit').html('<i class="icon-spinner"></i> Menunggu Proses');
           var form_data = new FormData(this);
            send_ajax_file( $(this).attr('action'),form_data).then( function(data){
            	toastr.success('Data berhasil proses, Refresh untuk melihat perubahan');
                setTimeout(function(){ 
                    set_item_tab('absen');
                }, 1000);
            });
        return false;
    });

    $( document).on('submit',"#app-jurnal-save" ,function( e ) {
        e.preventDefault();
        e.stopImmediatePropagation();
                $('.btn-jurnal-submit').attr('disabled', 'true');
                $('.btn-jurnal-submit').html('<i class="icon-spinner"></i> Menunggu Proses');
                var idmapel=$('.idmapel_set').val();
                // alert(idmapel);
           var form_data = new FormData(this);
            send_ajax_file( $(this).attr('action')+'/'+idmapel,form_data).then( function(data){
                toastr.success('Data berhasil proses, Refresh untuk melihat perubahan');
                setTimeout(function(){ 
                    set_item_tab('jurnal_guru_set');
                }, 1000);
            });
        return false;
    });

    $( document).on('submit',"#app-catatan-save" ,function( e ) {
        e.preventDefault();
        e.stopImmediatePropagation();
                $('.btn-catatan-submit').attr('disabled', 'true');
                $('.btn-catatan-submit').html('<i class="icon-spinner"></i> Menunggu Proses');
                var idmapel='<?php echo $data_get['mapel_hari_ini']['id_jadwal_pelajaran'] ?>';
           var form_data = new FormData(this);
            send_ajax_file( $(this).attr('action')+'/'+idmapel,form_data).then( function(data){
                toastr.success('Data berhasil proses, Refresh untuk melihat perubahan');
                setTimeout(function(){ 
                    set_item_tab('catatan');
                }, 1000);
            });
        return false;
    });

    $(document).on('click', '.btn-del-jurnal', function(e){
        e.stopImmediatePropagation();

        
        if (confirm('Apakah anda yakin menghapus data ini?')) {
            blockui($('.content-div'));
           send_ajax('Jurnal_guru/delete_jurnal/'+$(this).data('id'), {}).then(function(e){
                toastr.success('Data berhasil dihapus, Refresh untuk melihat perubahan');
                    setTimeout(function(){ 
                        set_item_tab('jurnal_guru_set');
                    }, 1000);
            });
        } else {
        }
    });
    $(document).on('click', '.btn-del-catatan', function(e){
        e.stopImmediatePropagation();

        
        if (confirm('Apakah anda yakin menghapus data ini?')) {
            blockui($('.content-div'));
           send_ajax('Jurnal_guru/delete_catatan_siswa/'+$(this).data('id'), {}).then(function(e){
                toastr.success('Data berhasil dihapus, Refresh untuk melihat perubahan');
                    setTimeout(function(){ 
                        set_item_tab('catatan');
                    }, 1000);
            });
        } else {
        }
    });

    $(document).on('click', '.btn-edit-jurnal', function(e){
        e.stopImmediatePropagation();

        $('.btn-batal').css('display', "");
        $('.btn-jurnal-submit').addClass('btn-primary');
        $('.btn-jurnal-submit').html('<i class="icon-pencil3"></i> Ubah Data');
        $('.btn-jurnal-submit').removeClass('btn-success');
        $('#app-jurnal-save').attr('action', 'Jurnal_guru/update_jurnal_harian');
        $('.uraian_jurnal').val($(this).data('uraian'));
        $('.id_jurnal_guru').val($(this).data('id'));
    })

    $(document).on('click', '.btn-edit-catatan', function(e){
        e.stopImmediatePropagation();

        $('.btn-batal-catatan').css('display', "");
        $('.btn-catatan-submit').addClass('btn-primary');
        $('.btn-catatan-submit').html('<i class="icon-pencil3"></i> Ubah Data');
        $('.btn-catatan-submit').removeClass('btn-success');
        $('#app-catatan-save').attr('action', 'Jurnal_guru/update_catatan_siswa');
        $('.idsiswa_fk').val($(this).data('idsiswa')).trigger('change');
        $('.uraian_catatan').val($(this).data('uraian'));
        $('.teruskan_ke').val($(this).data('teruskan_ke'));
        $('.id_catatan_siswa').val($(this).data('id'));
    })

    $(document).on('click', '.btn-batal', function(e){
         $('.btn-batal').css('display', "none");
        $('.btn-jurnal-submit').html('<i class="icon-floppy-disk"></i> Simpan');
        $('.btn-jurnal-submit').removeClass('btn-primary');
        $('.btn-jurnal-submit').addClass('btn-success');
        $('#app-jurnal-save').attr('action', 'Jurnal_guru/save_jurnal_harian');
        $('.uraian_jurnal').val("");
    })

     $(document).on('click', '.btn-batal-catatan', function(e){
         $('.btn-batal-catatan').css('display', "none");
        $('.btn-catatan-submit').html('<i class="icon-floppy-disk"></i> Simpan');
        $('.btn-catatan-submit').removeClass('btn-primary');
        $('.btn-catatan-submit').addClass('btn-success');
        $('#app-catatan-save').attr('action', 'Jurnal_guru/save_catatan_siswa');
        $('.uraian_catatan').val("");
        $('.teruskan_ke').val("");
        $('.id_catatan_siswa').val("");
    })
	function set_item_tab(dataset)
	{
		var idmapel='<?php echo $data_get['mapel_hari_ini']['id_jadwal_pelajaran'] ?>';
		blockui($('.content-div'));
		send_ajax( 'Jurnal_guru/'+dataset+'/'+idmapel,{} ).then( function(data){

           $('.content-div').html(data);
           unblockui($('.content-div'));
        });
	
	}	
</script>