<script type="text/javascript">
	$( "#app-submit" ).on('submit',function( e ) {
	    e.preventDefault();
	        send_ajax( $(this).attr('action'),$(this).serialize() ).then( function(data){
	            $('.panel-proses').html(data);
	        });
	    return false;
	});
</script>