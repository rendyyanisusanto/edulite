<script type="text/javascript">
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
    $( document).on('submit',"#app-proses-save" ,function( e ) {
        e.preventDefault();
        e.stopImmediatePropagation();
        // $('.se-pre-con').css('display','block');
                $('.btn-submit').attr('disabled', 'true');
                $('.btn-submit').html('<i class="icon-spinner"></i> Menunggu Proses');
           var form_data = new FormData(this);
            send_ajax_file( $(this).attr('action'),form_data).then( function(data){
                // $(".se-pre-con").fadeOut("slow");
                // $('.proses-absen').html(data);
                // toastr.success('Data berhasil proses, Refresh untuk melihat perubahan');
                set_content('<?php echo $data_get['param']['table'] ?>/get_data');
            });
        return false;
    });
    $( document ).on('submit',"#app-import",function( e ) {
        e.stopImmediatePropagation();
        e.preventDefault();
        blockui($('.panel-upl'));
        blockui($('.proses-absen'));
           var form_data = new FormData(this);
            send_ajax_file( $(this).attr('action'),form_data).then( function(data){
                setTimeout(function(){ 
                    send_ajax_file( 'presensi_harian/proses_presensi_harian',form_data).then( function(data){
                        $('.proses-absen').html(data);
                    });
                    toastr.success('Data berhasil ditambahkan, Refresh untuk melihat perubahan');
                    unblockui($('.proses-absen'));
                    unblockui($('.panel-upl'));
                }, 1000);
                
            });
        return false;
    });
</script>