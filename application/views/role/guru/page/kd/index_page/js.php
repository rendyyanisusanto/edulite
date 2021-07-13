<script type="text/javascript">
	$(".btn-act").on("click", function(e){
		e.stopImmediatePropagation();
		var btn = $(this);
		$('.btn-act').removeClass('btn-warning');
		$('.btn-act').addClass('btn-success');
		$(this).addClass('btn-warning');
		$(this).html('<i class="icon-spinner"></i>');
		$(this).attr('disabled', true);
		blockui($('.panel-kd'));
		var id_mapel = $(this).data('id_mapel')
		var id_kelas = $(this).data('id_kelas')
		var id_guru = $(this).data('id_guru')
		var id_tahun_ajaran = $(this).data('id_tahun_ajaran')
		send_ajax( 'Kd/get_kd',{id_mapel:id_mapel, id_kelas:id_kelas, id_guru:id_guru, id_tahun_ajaran:id_tahun_ajaran} ).then( function(data){

			
           $('.panel-kd').html(data);

			
			unblockui($('.panel-kd'));
        });
        setTimeout(function(){ 
		    $(btn).html('<i class="icon-circle-right2"></i>');
			$(btn).attr('disabled', false);
	    }, 1000);
        
	})
</script>