<script type="text/javascript">
     $(document).on('submit', '#app-proses', function(e){
        blockui($('.proses-input-pengetahuan'));
        blockui($('.panel-head'));
        send_ajax($(this).attr('action'), $(this).serialize()).then(function(data){
           setTimeout(function(){ 
                $('.proses-input-pengetahuan').html(data);
                unblockui($('.proses-input-pengetahuan'));
                unblockui($('.panel-head'));
            }, 1000);
        });
        return false;
    });

    $(document).on('click', '.btn-add', function(e){
        e.stopImmediatePropagation();

        send_ajax('Akademik/get_modal_np', {
            idkelas_fk:$(this).data('idkelas_fk'),
            idmatapelajaran_fk:$(this).data('idmatapelajaran_fk'),
            idtahunajaran_fk:$(this).data('idtahunajaran_fk'),
            idguru_fk:$(this).data('idguru_fk'),
        }).then(function(data){
            $('.form-panel').html(data);
            $('#modal_add_np').modal('toggle');
        });
    });
    $(document).on('submit', '#app-submit-np', function(e){
        e.stopImmediatePropagation();

        send_ajax($(this).attr('action'), $(this).serialize()).then(function(data){
            $('#modal_add_np').modal('toggle');
        });

        return false;
    })
</script>