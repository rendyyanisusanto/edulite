<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/simpan_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-6">
		<div class="panel panel-body">

			<center><h3><b>Halaman Tambah Tahun Ajaran</b></h3></center>
			<fieldset>
	            
	            
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Tahun Ajaran</label>
	              <div class="col-lg-4">
	              	<input type="text" class="form-control" required name="tahun_ajaran" placeholder="Input here......">
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Semester</label>
	              <div class="col-lg-4">
	              	<select class="form-control" name="semester">
	              		<option value="ganjil">Ganjil</option>
	              		<option value="genap">Genap</option>
	              	</select>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Status</label>
	              <div class="col-lg-4">
	              	<select class="form-control" name="is_active">
	              		<option value="0">Tidak Aktif</option>
	              		<option value="1">Aktif</option>
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