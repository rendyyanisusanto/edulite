<script type="text/javascript">
	$(document).on('click', '.btn-find', function(event) {
		event.preventDefault();
		/* Act on the event */

		var mulai 	= $('.mulai');
		var sampai 	= $('.sampai');
		var obj 	=	{
			mulai 	: mulai.val(),
			sampai 	: sampai.val()
		}
		send_ajax( 'jurnal_umum/find', obj).then( function(data){
            blockui($('.jurnal-result'));
            setTimeout(function(){
	            unblockui($('.jurnal-result'));
	            $('.jurnal-result').html(data);
    		}, 500);
        });
	});
</script>