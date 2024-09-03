<script>

$( "#app-submit" ).on('submit',function( e ) {
	    e.stopImmediatePropagation();
	    e.preventDefault();
	    $('.se-pre-con').css('display','block');


	       var form_data = new FormData(this);
	        send_ajax_file( $(this).attr('action'),form_data).then( function(data){
	            $(".se-pre-con").fadeOut("slow");
	            console.log(data);
	            toastr.success('Data berhasil ditambahkan, Refresh untuk melihat perubahan');
	            set_content('<?php echo $data_get['param']['table'] ?>/get_data');
	        });
	    return false;
	});
	
	function get_status(){
		var status = $('.status_request').val();

		if (status == "MASUK") {
			$('.jam_pulang').css('display', 'none');
			$('.jam_masuk').css('display', '');
			$('.jam_masuk').attr('required', true);
			$('.jam_pulang').attr('required', false);
		}else if(status == "PULANG"){
			$('.jam_masuk').css('display', 'none');
			$('.jam_pulang').css('display', '');
			$('.jam_pulang').attr('required', true);
			$('.jam_masuk').attr('required', false);
		}else{

			$('.jam_masuk').css('display', '');
			$('.jam_pulang').css('display', 'none');
			$('.jam_pulang').attr('required', true);
			$('.jam_masuk').attr('required', true);
		}
	}
</script>