
<script type="text/javascript">
    get_silabus();
    function get_silabus(){
        send_ajax('Silabus/get_silabus').then(function(data){
            $('.panel-silabus').html(data);
        });
    }

</script>