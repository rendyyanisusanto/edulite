<div class="row">
	<div class="col-md-6">
		<div class="panel panel-body panel-top">
			<form class="form-horizontal" action="Penilaian_kinerja_guru/proses_report" id="app-submit" method="POST">
				<div class="form-group">
	              <label class="col-lg-3 control-label">Tahun Ajaran</label>
	              <div class="col-lg-9">
	              	<select class="form-control" name="id_tahun_ajaran">
	              		<?php foreach ($data_get['tahun_ajaran'] as $key => $value): ?>
	              			<option value="<?php echo $value['id_tahun_ajaran'] ?>" <?php echo ($value['is_active'] == 1) ? "selected" : ""; ?>><?php echo $value['tahun_ajaran'] ?></option>
	              		<?php endforeach ?>
	              	</select>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Periode</label>
	              <div class="col-lg-9">
	              	<input type="month" class="form-control" name="periode" required placeholder="Input here......">
	              </div>
	            </div>
	            
	            <button type="submit" class="btn btn-primary"><i class="icon-spinner10"></i> Proses</button>
			</form>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<div class="panel-pkg"></div>
	</div>
</div>