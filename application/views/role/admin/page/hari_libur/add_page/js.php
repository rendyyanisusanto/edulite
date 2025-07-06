<script type="text/javascript">
	
	$( "#app-submit" ).on('submit',function( e ) {
	    e.stopImmediatePropagation();
	    e.preventDefault();
	    $('.se-pre-con').css('display','block');
	        var form_data = new FormData(this);
        send_ajax_file( $(this).attr('action'),form_data).then( function(data){
	            $(".se-pre-con").fadeOut("slow");
	            // console.log(data);
				var response = JSON.parse(data);
	            if (response.status != 200) {
	                toastr.error(response.message);
	            }else{

					toastr.success(response.message);
				}
	            set_content('<?php echo $data_get['param']['table'] ?>/get_data');
	        });
	    return false;
	});
	
    function add_guru()
    {
        var data = '<div class="form-group"><div class="col-lg-6"><select name="idguru_fk[]" class="form-control" required><option value="">Pilih Guru</option><?php foreach ($data_get['guru'] as $key => $value): ?><option value="<?php echo $value['id_guru'] ?>"><?php echo $value['nama'] ?></option><?php endforeach; ?></select></div><button type="button" class="btn btn-danger" onclick="$(this).parent().remove();"><i class="icon-trash"></i></button></div>';
        $('.content-guru').append(data);
    }
</script>