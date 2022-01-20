<script type="text/javascript">
	$('.table').on('change', function(){
		send_ajax( '<?php echo $data_get['param']['table'] ?>/get_user',{table:$(this).val()} ).then( function(data){
            $(".se-pre-con").fadeOut("slow");
            $('.user').html(data);
			$('.next').css('display', '');
        });
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