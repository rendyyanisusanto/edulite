<script type="text/javascript">
	$( "#app-proses" ).on('submit',function( e ) {
        e.preventDefault();
        // $('.se-pre-con').css('display','block');
           var form_data = new FormData(this);
            send_ajax_file( $(this).attr('action'),form_data).then( function(data){
                // $(".se-pre-con").fadeOut("slow");
                $('.proses-rapor').html(data);
                // toastr.success('Data berhasil proses, Refresh untuk melihat perubahan');
                // set_content('<?php echo $data_get['param']['table'] ?>/get_data');
            });
        return false;
    });
</script>