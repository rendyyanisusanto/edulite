<script>
    function proses(){
        send_ajax("Skl/get_alumni", {tahun_lulus:$('.tahun_lulus').val()}).then(function(data){
			$('.skl-proses').html(data);
		});
    }

    

</script>