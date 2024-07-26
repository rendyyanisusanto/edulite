
<script type="text/javascript">
    get_jadwal();
	function get_jadwal(){
        send_ajax("Presensi_harian/get_jadwal", {tanggal:$('.tanggal').val()}).then(function(data){
            $('.content-jadwal').html(data);
        })
    }
</script>