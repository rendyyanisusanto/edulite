<script type="text/javascript">
	$( "#app-proses" ).on('submit',function( e ) {
        e.preventDefault();
        // $('.se-pre-con').css('display','block');
           var form_data = new FormData(this);
            send_ajax_file( $(this).attr('action'),form_data).then( function(data){
                // $(".se-pre-con").fadeOut("slow");
                $('.proses-absen').html(data);
                // toastr.success('Data berhasil proses, Refresh untuk melihat perubahan');
                // set_content('<?php echo $data_get['param']['table'] ?>/get_data');
            });
        return false;
    });
    $( document ).on('submit',"#app-import",function( e ) {
        e.stopImmediatePropagation();
        e.preventDefault();
        blockui($('.proses-absen'));
           var form_data = new FormData(this);
            send_ajax_file( $(this).attr('action'),form_data).then( function(data){
                send_ajax_file( 'absensi/proses_absensi',form_data).then( function(data){
                    $('.proses-absen').html(data);
                });
                toastr.success('Data berhasil ditambahkan, Refresh untuk melihat perubahan');
                unblockui($('.proses-absen'));
            });
        return false;
    });
</script>