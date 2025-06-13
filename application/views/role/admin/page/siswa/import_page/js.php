<script type="text/javascript">
	$('.select').select2();
	$('.jurusan').on('change', function(e){
    
		    send_ajax( 'Siswa/get_kelas',{'id' : $(this).val()} ).then( function(data){
		        $('.select_kelas').html(data);
		    });

	});
	$(document).on('change','.kelas', function(e){
		e.stopImmediatePropagation();
		
		if( typeof $(this).val() === 'undefined' || $(this).val() === null ){
		}else{
			$('#download_template').attr('href', '<?php echo base_url('admin/siswa/download_file_siswa/'); ?>'+$(this).val());
			$('#download_template').text('Download template import siswa ');
		}
	})
	$('.btn-template').on('click', function(e){
		e.stopImmediatePropagation();

		send_ajax('Siswa/download_file_siswa/'+$('.kelas').val(),{}).then(function(data){
			window.open('<?=base_url('admin/');?>Siswa/download_file_siswa/'+$('.kelas').val(),'_blank');
		});
	})
	$('#app-import').on('submit', function(e){
       	var form_data = new FormData(this);
       	blockui('.panel-proses');
		send_ajax_file($(this).attr('action'), form_data).then(function(data){
			$('.panel-proses').html(data);
			$('.idjurusan_fk').val($('.jurusan').val());
			$('.idkelas_fk').val($('.kelas').val());
			setTimeout(function(a){
				unblockui('.panel-proses');
			}, 1000);
		});

		return false;
	});
	$(document).on('click', '.btn-del', function(e){
		e.stopImmediatePropagation();

       	blockui('.panel-proses');
		$(this).parent().parent().remove();
		setTimeout(function(a){
				unblockui('.panel-proses');
			}, 1000);
	});
	$(document).on('submit', '#app-submit-form', function(e){
		e.stopImmediatePropagation();
		blockui('.panel-proses');
		send_ajax($(this).attr('action'), $(this).serialize()).then(function(data){

            toastr.success('Data berhasil ditambahkan, Refresh untuk melihat perubahan');

			unblockui('.panel-proses');
			set_content('<?php echo $data_get['param']['table'] ?>/get_data');
		});
		return false;
	})
</script>