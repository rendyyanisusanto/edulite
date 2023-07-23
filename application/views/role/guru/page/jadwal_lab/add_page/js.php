<script type="text/javascript">

	$( "#app-submit" ).on('submit',function( e ) {
	    e.stopImmediatePropagation();
	    e.preventDefault();
	    $('.se-pre-con').css('display','block');
	        send_ajax( $(this).attr('action'),$(this).serialize() ).then( function(data){
	            $(".se-pre-con").fadeOut("slow");
	            // console.log(data);
	            toastr.success('Data berhasil ditambahkan, Refresh untuk melihat perubahan');
	            set_content('<?php echo $data_get['param']['table'] ?>/get_data');
	        });
	    return false;
	});


	function get_jadwal(){
		var tanggal = $('.tanggal').val();

		send_ajax('Jadwal_lab/get_content_jadwal', {tanggal : tanggal}).then(function(data){
			$('.jadwal').html(data);
		});
	}
</script>