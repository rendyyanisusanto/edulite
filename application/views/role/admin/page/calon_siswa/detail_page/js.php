
<script type="text/javascript">
	$('#btn-edit').on('click', function(e){
		set_content('<?php echo $data_get['param']['table'] ?>/edit_page/'+$(this).data('id'));
	});
</script>