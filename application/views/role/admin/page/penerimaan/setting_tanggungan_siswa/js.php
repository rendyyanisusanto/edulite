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

			send_ajax($(this).attr('action'), $(this).serialize()).then(function(data){
				toastr.success("data berhasil ditambahkan");

				$('.modal').modal('toggle');

				get_data();
			})

			return false;
		});
	$('.idkelas').on('change', function(e){
		get_data();
	})
</script>