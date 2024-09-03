<script>
	get_rekap()
	function get_rekap(){
		var rekap = $('.rekap').val();

		send_ajax('Presensi_guru/get_rekap/'+rekap, {}).then(function(data){
			$('.filter').html(data);
		})
	}
	$( "#app-submit" ).on('submit',function( e ) {
	    e.preventDefault();
	        send_ajax( $(this).attr('action'),$(this).serialize() ).then( function(data){
	            $('.panel-proses').html(data);
	        });
	    return false;
	});
</script>