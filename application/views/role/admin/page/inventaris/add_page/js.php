<script type="text/javascript">
    CKEDITOR.replace( 'keterangan' );
	$('.select').select2();
$( "#app-submit" ).on('submit',function( e ) {
    e.preventDefault();
    $('.se-pre-con').css('display','block');

    for (instance in CKEDITOR.instances) {
                CKEDITOR.instances[instance].updateElement();
            }
    // console.log($(this).serialize());
        send_ajax( $(this).attr('action'),$(this).serialize() ).then( function(data){
            $(".se-pre-con").fadeOut("slow");
            // console.log(data);
            toastr.success('Data berhasil ditambahkan, Refresh untuk melihat perubahan');
            set_content('<?php echo $data_get['param']['table'] ?>/get_data');
        });
    return false;
});
</script>