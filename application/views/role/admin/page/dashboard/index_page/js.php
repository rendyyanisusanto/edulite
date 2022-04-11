<script type="text/javascript">
    stats();
    function stats()
    {
        blockui($('.stats'));
        send_ajax('Dashboard/stats',{} ).then( function(data){
           
            setTimeout(function(){
                unblockui($('.stats'));
                $('.stats').html(data); 
            }, 1000);
        });
    }
</script>