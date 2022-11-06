<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/simpan_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">

			<center><h3><b>Halaman Tambah tingkat</b></h3></center>
			<fieldset>
	            
	            
	            <div class="form-group">
	              <label class="col-lg-3 control-label">tingkat</label>
	              <div class="col-lg-4">
	              	<input type="text" class="form-control" required name="tingkat" placeholder="Input here......">
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Department</label>
	              <div class="col-lg-4">
	              	<select class="form-control" required="" name="iddepartment_fk">
	              		<option value=""> -- Pilih --</option>
	              		<?php foreach ($data_get['department'] as $value): ?>
	              			<option value="<?= $value['id_department'] ?>"><?= $value['department'] ?></option>
	              		<?php endforeach ?>
	              	</select>
	              </div>
	            </div>
	            
	            <button class="btn btn-success" type="submit"><i class="icon-floppy-disk"></i> Simpan</button>
            </fieldset>	
		</div>
	</div>
</div>
</form>