<script type="text/javascript">
	$(".styled").uniform();$(".control-warning").uniform({
        wrapperClass: 'border-warning-600 text-warning-800'
    });
    $( "#app-submit" ).on('submit',function( e ) {
	    e.preventDefault();
	    
	        send_ajax( $(this).attr('action'),$(this).serialize() ).then( function(data){
	             blockui($('.panel-result'));
	            setTimeout(function(){
		            unblockui($('.panel-result'));
		           $('.neraca').html(data); 
	    		}, 500);
	        });
	    return false;
	});
	
</script>