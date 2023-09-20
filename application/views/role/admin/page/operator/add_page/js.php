<script type="text/javascript">
	$('.select').select2();
	
	$( "#app-submit" ).on('submit',function( e ) {
	    e.stopImmediatePropagation();
	    e.preventDefault();
	    $('.se-pre-con').css('display','block');
	        send_ajax( $(this).attr('action'),$(this).serialize() ).then( function(data){
	            $(".se-pre-con").fadeOut("slow");
	            // console.log(data);
	            toastr.success('Data berhasil ditambahkan, Refresh untuk melihat perubahan');
	            set_content('<?php echo $data_get['param']['table'] ?>/get_data');
	        });
	    return false;
	});

	$('.department').on('change', function(e){
		e.stopImmediatePropagation();

		send_ajax('kelas/get_jur', {id:$(this).val()}).then(function(data){
			$('.divjur').html(data);
		})
	})
</script>