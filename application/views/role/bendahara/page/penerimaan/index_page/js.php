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
			get_proses();
			
		})

		$(document).on('submit', '#app-submit', function(e){
			e.stopImmediatePropagation();

			send_ajax($(this).attr('action'), $(this).serialize()).then(function(data){
				toastr.success("data berhasil ditambahkan");
				get_proses();
			})

			return false;
		});

		$(document).on('change', '.jenis_penerimaan', function(e){
			e.stopImmediatePropagation();

			send_ajax('penerimaan/get_code', {id:$(this).val()}).then(function(data){
				var resp = JSON.parse(data);
				$('.invoice').val(resp);
			});
		})

		$(document).on('submit', '#app-tanggungan', function(e){
			e.stopImmediatePropagation();

			send_ajax($(this).attr('action'), $(this).serialize()).then(function(data){
				toastr.success("Data tanggungan berhasil ditambahkan");
				get_proses();
			});

			return false;
		})

		function get_proses()
		{
			if ($('.siswa').val()) {
				blockui($('.panel-proses'));
				send_ajax('penerimaan/proses_penerimaan', {id:$('.siswa').val()}).then(function(data){
					
					unblockui($('.panel-proses'));
					$('.panel-proses').html(data);
				});
			}else{
				alert("silahkan pilih siswa terlebih dahulu");
			}
		}
		$(document).on('keyup', '.jumlah', function(e){
			if ($(this).val()>0) {

				$(this).val(formatRupiah($(this).val()));
			}else{
				$(this).val(1);
			}
		})
		$(document).on('keyup', '.diskon', function(e){
			if ($(this).val()>0) {

				$(this).val(formatRupiah($(this).val()));
			}else{
				$(this).val(1);
			}
		})
		function formatRupiah(angka){
			var number_string = angka.replace(/[^,\d]/g, '').toString(),
			split   		= number_string.split(','),
			sisa     		= split[0].length % 3,
			rupiah     		= split[0].substr(0, sisa),
			ribuan     		= split[0].substr(sisa).match(/\d{3}/gi);
 
			// tambahkan titik jika yang di input sudah menjadi angka ribuan
			if(ribuan){
				separator = sisa ? '.' : '';
				rupiah += separator + ribuan.join('.');
			}
 
			rupiah = split[1] != undefined ? rupiah + ',' + split[1] : rupiah;
			return rupiah;
		}

</script>