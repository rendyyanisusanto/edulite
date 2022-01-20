<script type="text/javascript">
		$(".siswa").select2({
	         ajax: { 
	           url: '<?php echo base_url('bendahara/penerimaan/get_siswa') ?>',
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

		$(document).on('click', '.btn-proses', function(e){
			e.stopImmediatePropagation();
			// alert($('.siswa').val());
			if ($('.siswa').val()) {
				send_ajax('penerimaan/proses_penerimaan', {id:$('.siswa').val()}).then(function(data){
					$('.panel-proses').html(data);
				});
			}else{
				alert("silahkan pilih siswa terlebih dahulu");
			}
		})

		$(document).on('submit', '#app-submit', function(e){
			e.stopImmediatePropagation();

			send_ajax($(this).attr('action'), $(this).serialize()).then(function(data){
				toastr.success("data berhasil ditambahkan");
			})

			return false;
		});

</script>