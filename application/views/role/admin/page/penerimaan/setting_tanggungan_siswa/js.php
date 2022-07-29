<script type="text/javascript">
	get_data();
	function get_data()
	{
		send_ajax('Penerimaan/get_setting',{idkelas:$('.idkelas').val()}).then(function(data){
			$('.data').html(data)
		})
	}
	$(document).on('click', '.btn-detail', function(e){
		e.stopImmediatePropagation();
		var idsiswa = $(this).data('idsiswa')
		send_ajax('Penerimaan/detail_setting',{id_siswa:idsiswa}).then(function(data){

			$('.modal').modal('toggle');
			$('.contentform').html(data)
		});
	});
	$(document).on('submit', '#app-tanggungan', function(e){
			e.stopImmediatePropagation();
            blockui($('.modal'));
			send_ajax($(this).attr('action'), $(this).serialize()).then(function(data){
            	unblockui($('.modal'));
				toastr.success("data berhasil ditambahkan");
				$('.modal').modal('toggle');
				get_data();
			});
			return false;
		});
	$('.idkelas').on('change', function(e){
		get_data();
		$('.btn-add-kelas').text("Setting " + $( ".idkelas option:selected" ).text());
	});
	$('.btn-add-kelas').on('click', function(e){
		if ($('.idkelas').val()!=='') {
			send_ajax('Penerimaan/modal_setting_all_class', {idkelas:$('.idkelas').val()}).then(function(data){
				$('.modal').modal('toggle');	

				$('.contentform').html(data)
			});
		}else{
			toastr.error("Pilih kelas terlebih dahulu");
		}
		
	});
</script>