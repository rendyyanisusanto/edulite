<script>
	function get_event(id){
		send_ajax('Event/get_ev_guru', {id:id}).then(function(data){
			$('.content-ev').html(data);
		})
	}
	function get_event_sekolah(){
		send_ajax('Event/get_ev_sekolah', {}).then(function(data){
			$('.content-ev').html(data);
		})
	}

</script>