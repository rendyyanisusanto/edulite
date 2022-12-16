<script src="<?php echo base_url('include/template/dashboard/')?>/js/plugins/forms/selects/select2.min.js"></script>
<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/simpan_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">
			<fieldset>
	            
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Tahun Ajaran</label>
	              <div class="col-lg-4">
	              	<select class="select" name="idtahunajaran_fk">
	              		<option value="">Pilih</option>
		              	<?php foreach ($data_get['tahun_ajaran'] as $key => $value): ?>
		              		<option <?php echo ($value['is_active'] == 1 ) ? 'selected':''; ?> value="<?php echo $value['id_tahun_ajaran'] ?>"><?php echo $value['tahun_ajaran'] ?></option>
		              	<?php endforeach ?>
	              	</select>
	              </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Department</label>
	              <div class="col-lg-4">
	              	<select class="select department" required name="iddepartment_fk">
	              		<option value="">Pilih</option>
		              	<?php foreach ($data_get['department'] as $key => $value): ?>
		              		<option value="<?php echo $value['id_department'] ?>"><?php echo $value['department'] ?></option>
		              	<?php endforeach ?>
	              	</select>
	              </div>
	            </div>

	            <div class="divjur"></div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Nama Kelas:</label>
	              <div class="col-lg-9">
	                <input type="text" name="kelas" class="form-control" required placeholder="Input here......">
	              </div>
	            </div>
				<a href="<?php echo $data_get['param']['table'] ?>/get_data" class="app-item btn btn-danger"><i class="icon-arrow-left7"></i> Kembali</a>
	            <button class="btn btn-success" type="submit"><i class="icon-floppy-disk"></i> Simpan</button>
            </fieldset>	
		</div>
	</div>
</div>
</form>