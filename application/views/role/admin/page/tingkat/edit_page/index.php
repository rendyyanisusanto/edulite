<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/update_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">

			<center><h3><b>Halaman Edit tingkat</b></h3></center>
			<fieldset>
	            <input type="hidden" value="<?= $data_get['tingkat']['id_tingkat'] ?>" name="id_tingkat">
	            
	            <div class="form-group">
	              <label class="col-lg-3 control-label">tingkat</label>
	              <div class="col-lg-4">
	              	<input type="text" class="form-control" value="<?= $data_get['tingkat']['tingkat'] ?>" required name="tingkat" placeholder="Input here......">
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Department</label>
	              <div class="col-lg-4">
	              	<select class="form-control" required="" name="iddepartment_fk">
	              		<option value=""> -- Pilih --</option>
	              		<?php foreach ($data_get['department'] as $value): ?>
	              			<option <?= ($value['id_department'] == $data_get['tingkat']['iddepartment_fk']) ? "selected":""; ?> value="<?= $value['id_department'] ?>"><?= $value['department'] ?></option>
	              		<?php endforeach ?>
	              	</select>
	              </div>
	            </div>
	            
				<a href="<?php echo $data_get['param']['table'] ?>/get_data" class="app-item btn btn-danger"><i class="icon-arrow-left7"></i> Kembali</a>
	            <button class="btn btn-success" type="submit"><i class="icon-floppy-disk"></i> Simpan</button>
            </fieldset>	
		</div>
	</div>
</div>
</form>