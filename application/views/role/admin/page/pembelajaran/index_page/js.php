<script type="text/javascript">
	function get_pelajaran()
	{
		send_ajax( 'pembelajaran/get_pelajaran',{} ).then( function(data){
           $('.table-pelajaran tbody').html(data);
        });
	}

	get_pelajaran();
</script>