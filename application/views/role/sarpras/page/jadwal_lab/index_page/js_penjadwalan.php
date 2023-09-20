<script type="text/javascript">
	get_jadwal();
	function get_jadwal(){
		var nweek = $('.nweek').val();
		send_ajax('Jadwal_lab/jadwal', {tanggal:nweek}).then(function(data){
			$('.content-jadwal').html(data)
		})
	}
	function get_jadwal_rilis(){
		var nweek = $('.nweek').val();
		send_ajax('Jadwal_lab/jadwal_rilis', {tanggal:nweek}).then(function(data){
			$('.content-jadwal').html(data)
		})
	}
	function update_status(id)
	{
		send_ajax('Jadwal_lab/get_detail', {id:id}).then(function(data){
			$('.content-detail').html(data);
			$('.modal-jadwal').modal('toggle');
		})
	}

	$( "#app-submit-modal" ).on('submit',function( e ) {
	    e.stopImmediatePropagation();
	    e.preventDefault();
	        send_ajax( $(this).attr('action'),$(this).serialize() ).then( function(data){
	        	get_jadwal();
				$('.modal-jadwal').modal('toggle');
	        });
	    return false;
	});

</script>