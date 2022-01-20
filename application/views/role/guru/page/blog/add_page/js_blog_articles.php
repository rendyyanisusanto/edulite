<script type="text/javascript">
	
    CKEDITOR.replace( 'description' );

    $( "#app-submit" ).on('submit',function( e ) {
	    e.preventDefault();
		    $('.se-pre-con').css('display','block');
		    for (instance in CKEDITOR.instances) {
                CKEDITOR.instances[instance].updateElement();
            }
            $('.se-pre-con').css('display','block');
            var form_data = new FormData(this);
            send_ajax_file( $(this).attr('action'),form_data).then( function(data){
                $(".se-pre-con").fadeOut("slow");
                toastr.success('Data berhasil ditambahkan, Refresh untuk melihat perubahan');
               set_content('<?php echo $data_get['param']['table'] ?>/add_artikel');
            });
	    
	    return false;
	});
</script>