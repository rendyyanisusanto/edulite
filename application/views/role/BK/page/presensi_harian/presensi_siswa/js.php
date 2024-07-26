<script type="text/javascript">
    var btn_abs;
    $( "#app-proses" ).on('submit',function( e ) {
        e.preventDefault();
            blockui($('.panel-head'));
            blockui($('.proses-absen'));
           var form_data = new FormData(this);
            send_ajax_file( $(this).attr('action'),form_data).then( function(data){

                
                setTimeout(function(){ 
                    $('.proses-absen').html(data);

                    unblockui($('.panel-head'));
                    unblockui($('.proses-absen'));
                }, 1000);
            });
        return false;
    });

    function call_jadwal() {
        send_ajax( 'Presensi_harian/proses_presensi_harian_index',{tanggal : $('.tanggal').val()}).then( function(data){

                
                setTimeout(function(){ 
                    $('.proses-absen').html(data);

                    unblockui($('.panel-head'));
                    unblockui($('.proses-absen'));
                }, 1000);
        });
    }
    $(document).on('click', '.btn-absen', function(e){
        e.stopImmediatePropagation();
        btn_abs = $(this);
        var idmapel = $(this).data('idmapel');

        btn_abs.attr('disabled', true);
        btn_abs.html('<i class="icon-spinner"></i>');

        send_ajax('Presensi_harian/absen/'+$(this).data('idmapel')+'/'+$('.tanggal').val()).then(function(data){
            
            btn_abs.attr('disabled', false);
            btn_abs.html('<i class="icon-eye"></i>');
            $('.idmapel_form').val(idmapel);
            $('.modal-body').html(data);
            $('.tglabsen').val($('.tanggal').val());
            $('#modal_absen').modal('toggle');

        });

    });
    $(document).on('click', '.btn-wa', function(e){
        e.stopImmediatePropagation();
        btn_abs = $(this);
        var idmapel = $(this).data('idmapel');

        send_ajax('Presensi_harian/wa/'+$(this).data('idmapel'),{}).then(function(data){
            

        });

    });
    
    $(document).on('submit', '#app-absen-save', function(e){
        e.preventDefault();
        e.stopImmediatePropagation();
        btn_abs.attr('disabled', true);
        btn_abs.html('<i class="icon-spinner"></i>');
        var idmapel = $('.idmapel_form').val();
                $('.btn-absen-submit').attr('disabled', 'true');
                $('.btn-absen-submit').html('<i class="icon-spinner"></i> Menunggu Proses');
           var form_data = new FormData(this);
            send_ajax_file( $(this).attr('action')+'/'+idmapel,form_data).then( function(data){
                toastr.success('Data berhasil proses, Refresh untuk melihat perubahan');
                setTimeout(function(){ 
                    
                    $('#modal_absen').modal('toggle');
                    call_jadwal();
                }, 1000);
            });
        return false;
    })

    
</script>