<script type="text/javascript">
	get_kd();
	$(document).on('click', '.btn-edit',function(e){

	    e.stopImmediatePropagation();
	            $('.idmateri').val($(this).data('id'));
	            $('.materi').val($(this).data('materi'));
	            $('.kdtiga').val($(this).data('kdtiga'));
	            $('.kdempat').val($(this).data('kdempat'));
	            $('#modal_edit').modal('toggle');
	});
	$(document).on('click', '.btn-del', function(e){
		e.stopImmediatePropagation();

		var txt;
		var r = confirm("Apakah anda yakin ingin menghapus data ini!");
		if (r == true) {
			send_ajax( 'Kd/hapus_data/'+($(this).data('id')),$(this).serialize() ).then( function(data){
	            toastr.success('Data berhasil dihapus, Refresh untuk melihat perubahan');
	            get_kd();
	        });
		} else {
		}
	})
	$( "#app-submit" ).on('submit',function( e ) {
	    e.stopImmediatePropagation();
	    e.preventDefault();
	    // $('.se-pre-con').css('display','block');
	        send_ajax( $(this).attr('action'),$(this).serialize() ).then( function(data){
	            toastr.success('Data berhasil ditambahkan, Refresh untuk melihat perubahan');
	            get_kd();
	            $('.materi').val("");
	            $('.kdtiga').val("");
	            $('.kdempat').val("");
	            $('#modal_default').modal('toggle');
	        });
	    return false;
	});

	$( "#app-submit-update" ).on('submit',function( e ) {
	    e.stopImmediatePropagation();
	    e.preventDefault();
	    // $('.se-pre-con').css('display','block');
	        send_ajax( $(this).attr('action'),$(this).serialize() ).then( function(data){
	            toastr.success('Data berhasil ditambahkan, Refresh untuk melihat perubahan');
	            get_kd();
	            $('.materi').val("");
	            $('.kdtiga').val("");
	            $('.kdempat').val("");
	            $('#modal_edit').modal('toggle');
	        });
	    return false;
	});

	function get_kd()
	{
		var id_mata_pelajaran = $('.id_mata_pelajaran').val();
		var id_kelas = $('.id_kelas').val();
		var id_guru = $('.id_guru').val();
		var id_tahun_ajaran = $('.id_tahun_ajaran').val();
		send_ajax( 'Kd/get_data_kd',{id_mata_pelajaran:id_mata_pelajaran,id_kelas:id_kelas,id_guru:id_guru,id_tahun_ajaran:id_tahun_ajaran} ).then( function(data){
	        $('.p-kd').html(data);
	    });
	}
</script>