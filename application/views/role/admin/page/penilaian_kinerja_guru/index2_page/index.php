<div class="row">
	<div class="col-md-6">
		<div class="panel panel-body panel-top">
				<div class="form-group">
	              <label class="col-lg-3 control-label">Tahun Ajaran</label>
	              <div class="col-lg-9">
	              	<select class="form-control id_tahun_ajaran_form" name="id_tahun_ajaran">
	              		<?php foreach ($data_get['tahun_ajaran'] as $key => $value): ?>
	              			<option value="<?php echo $value['id_tahun_ajaran'] ?>" <?php echo ($value['is_active'] == 1) ? "selected" : ""; ?>><?php echo $value['tahun_ajaran'] ?></option>
	              		<?php endforeach ?>
	              	</select>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Periode</label>
	              <div class="col-lg-9">
	              	<input type="month" class="form-control periode_form" name="periode" required placeholder="Input here......">
	              </div>
	            </div>
	            
	            <button type="button" class="btn btn-proses btn-primary"><i class="icon-spinner10"></i> Proses</button>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<div class="panel-nilai"></div>
	</div>
</div>