<script type="text/javascript">
	$('.table').on('change', function(){
		send_ajax( '<?php echo $data_get['param']['table'] ?>/get_user',{table:$(this).val()} ).then( function(data){
            $(".se-pre-con").fadeOut("slow");
            $('.user').html(data);
        });
	});
	$('.user').on('change', function(){
		if ($(this).val() != "") {
		send_ajax( '<?php echo $data_get['param']['table'] ?>/get_user_data',{id:$(this).val(), table:$('.table').val()} ).then( function(data){
			var response = JSON.parse(data);
            $(".se-pre-con").fadeOut("slow");
            $('.identity_name').val(response.nama);
        });
        	$('.start-user').css('display','');
		}else{
			$('.start-user').css('display','none');
		}
	});
	$( "#app-submit" ).on('submit',function( e ) {
    e.preventDefault();
    $('.se-pre-con').css('display','block');
        send_ajax( $(this).attr('action'),$(this).serialize() ).then( function(data){
            $(".se-pre-con").fadeOut("slow");
            toastr.success('Data berhasil ditambahkan, Refresh untuk melihat perubahan');
            set_content('<?php echo $data_get['param']['table'] ?>/get_data');
        });
    return false;
});
</script>