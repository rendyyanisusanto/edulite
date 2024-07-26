<div class="row">
	<div class="col-md-4">
		<div class="panel panel-body">
			<label>Tanggal</label>
			<input type="date" value="<?php echo date('Y-m-d') ?>" name="tanggal" class="tanggal form-control" >
			<hr>
			<button class="btn btn-sm btn-success" type="button" onclick="get_jadwal();"><i class="icon-spinner2"></i> Proses</button>
		</div>
	</div>
</div>

<div class="row">
		<div class="col-md-12">
			<div class="content-jadwal"></div>
		</div>
</div>