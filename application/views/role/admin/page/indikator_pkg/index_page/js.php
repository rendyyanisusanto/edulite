<script type="text/javascript">
	$( "#app-proses" ).on('submit',function( e ) {
	    e.stopImmediatePropagation();
	    e.preventDefault();
	    	blockui($('.panel-ta'));
	        send_ajax( $(this).attr('action'),$(this).serialize() ).then( function(data){

	    		unblockui($('.panel-ta'));
	            $('.indikator').html(data);
	            $('.subindikator').html("");
	        });
	    return false;
	});

	$( document.body ).on('submit',"#app-indikator",function( e ) {
	    e.stopImmediatePropagation();
	    e.preventDefault();
	    	blockui($('.panel-indikator'));
	        send_ajax( $(this).attr('action'),$(this).serialize() ).then( function(data){

	    		unblockui($('.panel-indikator'));
	            $('.indikator').html(data);
	            $('.subindikator').html("");
	        });
	    return false;
	});

	$(document.body).on('click', '.btn-sub', function(e){
		e.stopImmediatePropagation();
		blockui($('.panel-indikator'))
		send_ajax('<?php echo $data_get['param']['table'] ?>/sub_indikator',{id:$(this).data("id")}).then(function(data){
			unblockui($('.panel-indikator'))

			$('.subindikator').html(data);
		});
	});

	$( document.body ).on('submit',"#app-subindikator",function( e ) {
	    e.stopImmediatePropagation();
	    e.preventDefault();
	    	blockui($('.panel-subindikator'));
	        send_ajax( $(this).attr('action'),$(this).serialize() ).then( function(data){

	    		unblockui($('.panel-subindikator'));
	            $('.subindikator').html(data);
	        });
	    return false;
	});
</script>