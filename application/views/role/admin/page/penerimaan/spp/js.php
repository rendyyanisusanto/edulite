<script type="text/javascript">
	$('.btn-find').on('click', function(e){
	        send_ajax( '<?php echo base_url('admin/penerimaan/find_siswa') ?>',{key : $('#find').val()} ).then( function(data){
	            $('.panel-result').html(data);
	        });
	});
	$(document).on('click','.btn-proses', function(e){
		e.stopImmediatePropagation();
		$('.id_siswa').val($(this).data("id"));
		send_ajax( '<?php echo base_url('admin/penerimaan/get_data_siswa/') ?>'+$(this).data("id"),{} ).then( function(data){
	            $('.panel-data-siswa').html(data);
	    });
	})
	$( "#app-submit" ).on('submit',function( e ) {
	       var form_data = new FormData(this);
	        send_ajax_file( $(this).attr('action'),form_data).then( function(data){
	           
	            toastr.success('Data berhasil ditambahkan, Refresh untuk melihat perubahan');
	            
	        });
	    return false;
	});
</script>