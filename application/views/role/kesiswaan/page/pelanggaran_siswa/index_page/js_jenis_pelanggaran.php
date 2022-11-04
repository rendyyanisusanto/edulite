<script type="text/javascript">
	var table=$('#tabel-data').DataTable( {
       "processing": true, 
            "serverSide": true, 
            "order": [], 
             
            "ajax": {
                "url": "<?php echo $data_get['param']['table'] ?>/datatable_jenis_pelanggaran",
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
        $('.jenis_pelanggaran').val($(this).data('jenis_pelanggaran'));
        $('#app-submit').attr('action', 'pelanggaran_siswa/update_jenis_pelanggaran');
        $('.btn-submit').text('Update');
        $('.btn-submit').removeClass('btn-success');
        $('.btn-submit').addClass('btn-warning');
        $('.btn-batal').css('display','');
        $('.title-poin').text('Update jenis Pelanggaran');
    });
    $(document).on('click', '.btn-batal', function(e){
        e.stopImmediatePropagation();
        reset();
    })

    function reset()
    {
        $('.jenis_pelanggaran').val('');
        $('#app-submit').attr('action', 'pelanggaran_siswa/simpan_jenis_pelanggaran');
        $('.btn-submit').text('Simpan');
        $('.btn-submit').removeClass('btn-warning');
        $('.btn-submit').addClass('btn-success');
        $('.btn-batal').css('display','none');
        $('.title-poin').text('Tambah jenis Pelanggaran');
        $("input[name=kategori_pelanggaran][value=RINGAN]").attr('checked', 'checked');
    }

    $(document).on('click', '.btn-hps', function(e){
        e.stopImmediatePropagation();
        let id = $(this).data('id');
        blockui($('.panel-pelanggaran'));
        if (confirm("Apakah anda yakin akan menghapus data ini?") == true) {
          send_ajax("Pelanggaran_siswa/hapus_jenis_pelanggaran", {id:id}).then(function(data){
            table.ajax.reload();
            toastr.success('Data berhasil dihapus, Refresh untuk melihat perubahan');
            unblockui($('.panel-pelanggaran'));
          })
        } 
    })
</script>