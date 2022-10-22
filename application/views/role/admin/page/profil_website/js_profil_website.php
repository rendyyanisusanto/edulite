<script type="text/javascript">
    
    CKEDITOR.replace( 'about_us',
                {
                    filebrowserBrowseUrl : '<?php echo base_url('include/kcfinder/');?>browse.php?type=files',
                    filebrowserImageBrowseUrl : '<?php echo base_url('include/kcfinder/');?>browse.php?type=images',
                    filebrowserFlashBrowseUrl : '<?php echo base_url('include/kcfinder/');?>browse.php?type=flash',
                    filebrowserUploadUrl : '<?php echo base_url('include/kcfinder/');?>upload.php?type=files',
                    filebrowserImageUploadUrl : '<?php echo base_url('include/kcfinder/');?>upload.php?type=images',
                    filebrowserFlashUploadUrl : '<?php echo base_url('include/kcfinder/');?>upload.php?type=flash',
                    
                });
 
    $( "#app-submit" ).on('submit',function( e ) {
        e.stopImmediatePropagation();
        e.preventDefault();
        $('.se-pre-con').css('display','block');
        for (instance in CKEDITOR.instances) {
                CKEDITOR.instances[instance].updateElement();
            }
        var form_data = new FormData(this);
        send_ajax_file( $(this).attr('action'),form_data).then( function(data){
            $(".se-pre-con").fadeOut("slow");
            // console.log(data);
            toastr.success('Data berhasil ditambahkan, Refresh untuk melihat perubahan');
            set_content('<?php echo $data_get['param']['table'] ?>/get_data');
        });
        return false;
    });

</script>