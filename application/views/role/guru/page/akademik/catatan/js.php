<script type="text/javascript">
    $(document).on('submit', '#app-proses', function(e){
        blockui($('.proses-catatan'));
        blockui($('.panel-head'));
        send_ajax($(this).attr('action'), $(this).serialize()).then(function(data){
           setTimeout(function(){ 
                $('.proses-catatan').html(data);
                unblockui($('.proses-catatan'));
                unblockui($('.panel-head'));
            }, 1000);
        });
        return false;
    });

    $(document).on('submit', '#app-catatan-save', function(e){
        blockui($('.proses-catatan'));
        send_ajax($(this).attr('action'), $(this).serialize()).then(function(data){
            toastr.success("Catatan berhasil disimpan");
            $('.proses-catatan').html(data); 
            unblockui($('.proses-catatan'));
        });
        return false;
    });



    $(document).on('click', '.btn-edit-catatan', function(e){
        e.stopImmediatePropagation();

        $('.btn-batal-catatan').css('display', "");
        $('.btn-catatan-submit').addClass('btn-primary');
        $('.btn-catatan-submit').html('<i class="icon-pencil3"></i> Ubah Data');
        $('.btn-catatan-submit').removeClass('btn-success');
        $('#app-catatan-save').attr('action', 'Akademik/update_catatan_siswa');
        $('.idsiswa_fk').val($(this).data('idsiswa')).trigger('change');
        $('.uraian_catatan').val($(this).data('uraian'));
        $('.teruskan_ke').val($(this).data('teruskan_ke'));
        $('.id_catatan_siswa').val($(this).data('id'));
    })

    $(document).on('click', '.btn-batal-catatan', function(e){
         $('.btn-batal-catatan').css('display', "none");
        $('.btn-catatan-submit').html('<i class="icon-floppy-disk"></i> Simpan');
        $('.btn-catatan-submit').removeClass('btn-primary');
        $('.btn-catatan-submit').addClass('btn-success');
        $('#app-catatan-save').attr('action', 'Akademik/save_catatan_siswa');
        $('.uraian_catatan').val("");
        $('.teruskan_ke').val("");
        $('.id_catatan_siswa').val("");
    })

    $(document).on('click', '.btn-batal', function(e){
         $('.btn-batal').css('display', "none");
        $('.btn-jurnal-submit').html('<i class="icon-floppy-disk"></i> Simpan');
        $('.btn-jurnal-submit').removeClass('btn-primary');
        $('.btn-jurnal-submit').addClass('btn-success');
        $('#app-jurnal-save').attr('action', 'Akademik/save_jurnal_harian');
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