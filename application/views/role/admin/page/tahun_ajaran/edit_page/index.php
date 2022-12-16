<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/update_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-6">
		<div class="panel panel-body">

			<center><h3><b>Halaman Edit tahun_ajaran</b></h3></center>
			<fieldset>
	            <input type="hidden" value="<?= $data_get['tahun_ajaran']['id_tahun_ajaran'] ?>" name="id_tahun_ajaran">
	            
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Tahun Ajaran</label>
	              <div class="col-lg-4">
	              	<input type="text" class="form-control" value="<?= $data_get['tahun_ajaran']['tahun_ajaran'] ?>" required name="tahun_ajaran" placeholder="Input here......">
	              </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Semester</label>
	              <div class="col-lg-4">
	              	<select class="form-control" name="semester">
	              		<option <?= ($data_get['tahun_ajaran']['semester'] == 'ganjil') ? "selected" : "" ; ?> value="ganjil">Ganjil</option>
	              		<option <?= ($data_get['tahun_ajaran']['semester'] == 'genap') ? "selected" : "" ; ?> value="genap">Genap</option>
	              	</select>
	              </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Status</label>
	              <div class="col-lg-4">
	              	<select class="form-control" name="is_active">
	              		<option <?= ($data_get['tahun_ajaran']['is_active'] == 0) ? "selected" : "" ; ?> value="0">Tidak Aktif</option>
	              		<option <?= ($data_get['tahun_ajaran']['is_active'] == 1) ? "selected" : "" ; ?> value="1">Aktif</option>
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