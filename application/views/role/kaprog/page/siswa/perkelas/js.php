<script type="text/javascript">
	$( "#app-proses" ).on('submit',function( e ) {
        e.preventDefault();
            blockui($('.panel-head'));
            blockui($('.proses-siswa'));
           var form_data = new FormData(this);
            send_ajax_file( $(this).attr('action'),form_data).then( function(data){
                
                unblockui($('.panel-head'));
                unblockui($('.proses-siswa'));
                $('.proses-siswa').html(data);
            });
        return false;
    });
</script>