<script type="text/javascript">
	get_kd();

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