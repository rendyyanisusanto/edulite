<script type="text/javascript">
	$(".styled").uniform();
	get_table_soal();
    // File input
    $(".file-styled").uniform({
        wrapperClass: 'bg-blue',
        fileButtonHtml: '<i class="icon-file-plus"></i>'
    });
	 $(".control-primary").uniform({
        wrapperClass: 'border-primary-600 text-primary-800'
    });
	$('.btn-proses').on('click', function(e){
		e.stopImmediatePropagation();
		get_siswa();
		
	});

	$(document).on('submit', '#app-submit', function(e){
		send_ajax($(this).attr('action'), $(this).serialize()).then(function(data){

		});
		return false;
	})

	$(document).on('click', '.btn-bank-soal', function(e){
		e.stopImmediatePropagation();
		get_bank_soal("");
		$('#modal_bank_soal').modal('toggle');

	});
	$(document).on('click', '.btn-find-bank', function(e){
		e.stopImmediatePropagation();

		get_bank_soal($('.inp-find-bank').val());
	})
	$(document).on('click','.btn-add-soal', function(e){
		e.stopImmediatePropagation();
		send_ajax('Oas/add_soal_bank', {id_soal : $(this).data('id'), id_oas:$('.id_oas').val()}).then(function(e){

			$('#modal_bank_soal').modal('toggle');
			get_table_soal();
		});
	});

	$(document).on('click', '.btn-del-row', function(e){
		e.stopImmediatePropagation();
		$(this).parent().parent().remove();
	})
	$(document).on('click', '.btn-del-soal', function(e){
		e.stopImmediatePropagation();
		if (confirm('Apakah anda yakin akan menghapus soal ini ?') == true) {
			send_ajax('Oas/delete_soal', {id:$(this).data('id')}).then(function(data){
				get_table_soal();	
			});
		}
		
	})
	function get_bank_soal(txt){
		blockui($('#modal-content-soal'));
		send_ajax('Oas/get_bank_soal',{txt:txt}).then(function(data){
			setTimeout(function(){
				$('.content-modal-bank').html(data);

				unblockui($('#modal-content-soal'));
			}, 1000);
			
		});
	}
	function get_table_soal(){
		blockui($('.table-soal'));

		send_ajax('Oas/get_table_soal/'+$('.id_oas').val(),{}).then(function(data){
			$('.table-soal tbody').html(data);
			setTimeout(function(){
				unblockui($('.table-soal'));
			}, 1000);
		});
	}
</script>