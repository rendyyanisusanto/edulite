<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/simpan_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">

			<center><h3><b>Halaman Tambah Jurusan</b></h3></center>
			<fieldset>
	            
	            
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Jurusan</label>
	              <div class="col-lg-4">
	              	<input type="text" class="form-control" required name="jurusan" placeholder="Input here......">
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Singkatan</label>
	              <div class="col-lg-4">
	              	<input type="text" class="form-control" name="singkatan" required placeholder="Input here......">
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
	            
				<a href="<?php echo $data_get['param']['table'] ?>/get_data" class="app-item btn btn-danger"><i class="icon-arrow-left7"></i> Kembali</a>
	            <button class="btn btn-success" type="submit"><i class="icon-floppy-disk"></i> Simpan</button>
            </fieldset>	
		</div>
	</div>
</div>
</form>