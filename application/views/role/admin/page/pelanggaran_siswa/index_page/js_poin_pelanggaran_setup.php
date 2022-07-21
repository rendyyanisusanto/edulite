<script type="text/javascript">
    var table=$('#tabel-data').DataTable( {
       "processing": true, 
            "serverSide": true, 
            "order": [], 
             
            "ajax": {
                "url": "<?php echo $data_get['param']['table'] ?>/datatable_poin",
                "type": "POST",
            },
 
            "columnDefs": [
            { 
                "targets": [ 0 ], 
                "orderable": false, 
            },
            ],
    } );
    $( "#app-submit" ).on('submit',function( e ) {
           $('.btn-submit').attr('disabled', 'true');
            $('.btn-submit').html('<i class="icon-spinner"></i> Menunggu Proses');
            
            blockui($('.panel-pelanggaran'));
           var form_data = new FormData(this);
            send_ajax_file( $(this).attr('action'),form_data).then( function(data){
                toastr.success('Data berhasil proses, Refresh untuk melihat perubahan');
                setTimeout(function(){ 
                    unblockui($('.panel-pelanggaran'));
                     table.ajax.reload();

                    $('.btn-submit').attr('disabled', false);
                    reset();
                }, 1000);
            });
        return false;
    });
    $(document).on('click', '.btn-edit', function(e){
        e.stopImmediatePropagation();
        $('.id').val($(this).data('id'));
        $('.kode_pelanggaran').val($(this).data('kode_pelanggaran'));
        $('.nama_pelanggaran').val($(this).data('nama_pelanggaran'));
        $('.poin').val($(this).data('poin'));
        $('.idjenispelanggaran_fk').val($(this).data('idjenispelanggaran_fk')).trigger('change');
        $('#app-submit').attr('action', 'pelanggaran_siswa/update_poin');
        $('.btn-submit').text('Update');
        $('.btn-submit').removeClass('btn-success');
        $('.btn-submit').addClass('btn-warning');
        $('.btn-batal').css('display','');
    });
    $(document).on('click', '.btn-batal', function(e){
        e.stopImmediatePropagation();
        reset();
    })

    function reset()
    {
        $('.kode_pelanggaran').val('');
        $('.nama_pelanggaran').val('');
        $('.poin').val('');
        $('.idjenispelanggaran_fk').val('').trigger('change');
        $('#app-submit').attr('action', 'pelanggaran_siswa/simpan_poin');
        $('.btn-submit').text('Simpan');
        $('.btn-submit').removeClass('btn-warning');
        $('.btn-submit').addClass('btn-success');
        $('.btn-batal').css('display','none');
    }
</script>