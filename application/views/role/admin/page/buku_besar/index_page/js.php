<script type="text/javascript">

	$('.select').select2();
	$(".styled").uniform();$(".control-warning").uniform({
        wrapperClass: 'border-warning-600 text-warning-800'
    });

	$(document).on('change', '.chk-akun', function(event) {
		event.preventDefault();
		if ($(this).is(":checked"))
		{
 			$('.slc').css('display','none');
		}else{
			$('.slc').css('display', '');
		}
		
	});		

	$( "#app-submit" ).on('submit',function( e ) {
	    e.preventDefault();
	    
	        send_ajax( $(this).attr('action'),$(this).serialize() ).then( function(data){
	            blockui($('.panel-result'));
	            setTimeout(function(){
		            unblockui($('.panel-result'));
		           $('.buku_besar').html(data); 
	    		}, 500);
	        });
	    return false;
	});
	$(document).on('click', '.btn-find', function(event) {
		event.preventDefault();
		/* Act on the event */
		var mulai 	= 	$('.mulai');
		var sampai 	= 	$('.sampai');
		var data_set 	=	{
			mulai:mulai.val(),
			sampai:sampai.val()
		}

		send_ajax( 'buku_besar/akun',data_set ).then( function(data){
            blockui($('.panel-result'));
            setTimeout(function(){
	            unblockui($('.panel-result'));
	           $('.buku_besar').html(data); 
    		}, 500);
        });

	});
	
</script>