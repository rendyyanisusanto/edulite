<script type="text/javascript">
	call_data();
	$('#app-submit').on('submit', function(e){
		e.stopImmediatePropagation();

		send_ajax($(this).attr('action'), $(this).serialize()).then(function(e){
			toastr.success("berhasil menambahkan data");
			call_data();
		});

		return false;
	});

	function call_data(){
		send_ajax("catatan_siswa/get_data_catatan/"+$('.id_catatan_siswa').val(), {}).then(function(data){
			$('.panel-tindakan').html(data);
		});		
	}
</script>