<div class="row">
	<div class="col-md-3">
		<div class="panel panel-body">
			<?php foreach ($data_get['guru'] as $key => $value): ?>
				<button style="text-align:left;" onclick="get_event(<?php echo $value['id_guru'] ?>);" data class="btn btn-default btn-block"><?php echo $value['nama'] ?></button>
			<?php endforeach ?>
		</div>
	</div>
	<div class="col-md-9">
		<div class="content-ev"></div>
	</div>
</div>
