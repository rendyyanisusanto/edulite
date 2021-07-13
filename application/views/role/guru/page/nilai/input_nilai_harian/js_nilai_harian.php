<script type="text/javascript">
	$( "#app-submit" ).on('submit',function( e ) {
        e.preventDefault();
        $('.se-pre-con').css('display','block');


           var form_data = new FormData(this);
            send_ajax_file( $(this).attr('action'),form_data).then( function(data){
                $(".se-pre-con").fadeOut("slow");
                console.log(data);
                toastr.success('Data berhasil ditambahkan, Refresh untuk melihat perubahan');
                set_content('<?php echo $data_get['param']['table'] ?>/get_data');
            });
        return false;
    });

    $( "#app-proses-submit" ).on('submit',function( e ) {
        e.stopImmediatePropagation();
        e.preventDefault();
        // $('.se-pre-con').css('display','block');

        blockui($('.proses-nilai'));
            send_ajax( $(this).attr('action'),$(this).serialize() ).then( function(data){
                toastr.success('Data berhasil ditambahkan, Refresh untuk melihat perubahan');
                unblockui($('.proses-nilai'));
            });
        return false;
    });
</script>