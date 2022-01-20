<script type="text/javascript">
	$('#app-submit').on('submit', function(e){
				$('.btn-submit').attr('disabled', 'true');
                $('.btn-submit').html('<i class="icon-spinner"></i> Menunggu Proses');
           	var form_data = new FormData(this);
            send_ajax_file( $(this).attr('action'),form_data).then( function(data){
            	var response = JSON.parse(data);
            	if (response.status == false) {
            		toastr.error('Password lama salah !');

					$('.btn-submit').attr('disabled', false);
	                $('.btn-submit').html('Simpan');
            	}else{
            		toastr.success('Data berhasil diubah, Refresh untuk melihat perubahan');
            		setTimeout(function(){ 
	                	set_content('Data_profil/akun');
	                }, 1000);
            	}
            
                
            });
        return false;
	});	
</script>