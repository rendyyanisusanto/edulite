<script>
	function get_event(id){
		send_ajax('Event/get_ev_guru', {id:id}).then(function(data){
			$('.content-ev').html(data);
		})
	}
</script>