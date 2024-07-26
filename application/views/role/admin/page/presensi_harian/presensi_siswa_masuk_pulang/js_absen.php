
<script type="text/javascript">
	$("#app-absen-save").on('submit' ,function( e ) {
        e.preventDefault();
        e.stopImmediatePropagation();
                $('.btn-absen-submit').attr('disabled', 'true');
                $('.btn-absen-submit').html('<i class="icon-spinner"></i> Menunggu Proses');
           var form_data = new FormData(this);
            send_ajax_file( $(this).attr('action'),form_data).then( function(data){
            	toastr.success('Data berhasil proses, Refresh untuk melihat perubahan');
                setTimeout(function(){ 
                    set_content('Presensi_harian/presensi_siswa_masuk_pulang');
                }, 1000);
            });
        return false;
    });

</script>