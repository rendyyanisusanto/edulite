<script>
    $(".siswa").select2({
	         ajax: { 
	           url: '<?php echo base_url('guru/laporan_presensi_siswa/get_siswa') ?>',
	           type: "post",
	           dataType: 'json',
	           delay: 250,
	           data: function (params) {
	              return {
	                searchTerm: params.term // search term
	              };
	           },
	           processResults: function (response) {
	              return {
	                 results: response
	              };
	           },
	           cache: true
	         }
	     });

		 $( "#app-submit" ).on('submit',function( e ) {
			e.stopImmediatePropagation();
			e.preventDefault();

			var form_data = new FormData(this);
				send_ajax_file( $(this).attr('action'),form_data).then( function(data){
					$('.content-laporan').html(data);
				});
			return false;
		});
</script>