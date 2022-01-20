<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body panel-ta">
			<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/proses_data" id="app-proses" method="POST">
				<div class="form-group">
	              <label class="col-lg-3 control-label">Tahun Ajaran</label>
	              <div class="col-lg-4">
	              	<select class="form-control" name="idtahunajaran_fk">
	              		<option value="">Pilih</option>
		              	<?php foreach ($data_get['tahun_ajaran'] as $key => $value): ?>
		              		<option <?php echo ($value['is_active'] == 1 ) ? 'selected':''; ?> value="<?php echo $value['id_tahun_ajaran'] ?>"><?php echo $value['tahun_ajaran'] ?></option>
		              	<?php endforeach ?>
	              	</select>
	              </div>
	              <div class="col-lg-3">
	              	<button class="btn btn-success"><i class="icon-spinner"></i> Proses</button>
	              </div>
	            </div>
			</form>
		</div>
	</div>
	<div class="col-md-12">
		<div class="col-md-6">
			<div class="indikator"></div>
		</div>
		<div class="col-md-6">
			<div class="subindikator"></div>
		</div>
	</div>
</div>