<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/update_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">

			<center><h3><b>Halaman Edit Jurusan</b></h3></center>
			<fieldset>
	            <input type="hidden" value="<?= $data_get['jurusan']['id_jurusan'] ?>" name="id_jurusan">
	            
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Jurusan</label>
	              <div class="col-lg-4">
	              	<input type="text" class="form-control" value="<?= $data_get['jurusan']['jurusan'] ?>" required name="jurusan" placeholder="Input here......">
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Singkatan</label>
	              <div class="col-lg-4">
	              	<input type="text" class="form-control" value="<?= $data_get['jurusan']['singkatan'] ?>" name="singkatan" required placeholder="Input here......">
	              </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Department</label>
	              <div class="col-lg-4">
	              	<select class="form-control" required="" name="iddepartment_fk">
	              		<option value=""> -- Pilih --</option>
	              		<?php foreach ($data_get['department'] as $value): ?>
	              			<option <?= ($value['id_department'] == $data_get['jurusan']['iddepartment_fk']) ? "selected":""; ?> value="<?= $value['id_department'] ?>"><?= $value['department'] ?></option>
	              		<?php endforeach ?>
	              	</select>
	              </div>
	            </div>
	            
	            <button class="btn btn-success" type="submit">Simpan</button>
            </fieldset>	
		</div>
	</div>
</div>
</form>