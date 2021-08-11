
<script type="text/javascript">
    get_silabus();
    function get_silabus(){
        send_ajax('Silabus/get_silabus').then(function(data){
            $('.panel-silabus').html(data);
        });
    }
    $(document).on('click', '.btn-act', function(e){
    	$('.idmapel_fk').val($(this).data('idmapel_fk'));
    	$('.idtingkat_fk').val($(this).data('idtingkat_fk'));
    	$('.idjurusan_fk').val($(this).data('idjurusan_fk'));
    	$('.modal-title').html("<b><h3>Silabus " +$(this).data('mapel')+" Kelas/Jurusan "+$(this).data('kelas')+"</h3></b>");
    	$('#modal_silabus').modal('toggle');
    })

    $( "#app-submit" ).on('submit',function( e ) {
	    e.stopImmediatePropagation();
	    e.preventDefault();
        $('.btn-submit').attr('disabled', true);
	    // $('.se-pre-con').css('display','block');
	        var form_data = new FormData(this);
        send_ajax_file( $(this).attr('action'),form_data).then( function(data){

                $('.btn-submit').attr('disabled', false);
                $('.file-silabus').val("");
        		$('#modal_silabus').modal('toggle');
	            toastr.success('Silabus berhasil diupload, Refresh untuk melihat perubahan');
	           	get_silabus();
	        });
	    return false;
	});
</script>