

<script type="text/javascript">
$( "#app-submit" ).on('submit',function( e ) {
    e.preventDefault();
        send_ajax( $(this).attr('action'),$(this).serialize() ).then( function(data){
            var response = JSON.parse(data);
            if (response.status != 200) {
                toastr.error(response.message);
            }else{
                toastr.success(response.message);
            }
            call_guru();
        });
    return false;
});
call_guru();
function call_guru()
{
    send_ajax( 'Presensi_guru/get_presensi',{} ).then( function(data){
        $('.panel-guru').html(data);
    });
}

</script>