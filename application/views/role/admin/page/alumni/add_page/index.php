<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/simpan_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">
			<fieldset>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Nama</label>
	              <div class="col-lg-4">
	              	<input type="text" class="form-control" required name="nama" placeholder="Input here......">
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Tahun Lulus</label>
	              <div class="col-lg-2">
	              	<input type="text" class="form-control" name="tahun_lulus" required placeholder="Input here......">
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">No. HP</label>
	              <div class="col-lg-3">
	              	<input type="text" class="form-control" name="no_hp" required placeholder="Input here......">
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Alamat</label>
	              <div class="col-lg-6">
	              	<input type="text" class="form-control" name="alamat" required placeholder="Input here......">
	              </div>
	            </div>
	            <div class="panel panel-body">
	            	<b>Kegiatan saat ini :</b>
	            	<div class="form-group">
		              <label class="col-lg-3 control-label">Kuliah</label>
		              <div class="col-lg-4">
		              	<input type="text" class="form-control" name="kuliah" required placeholder="Input here......">
		              </div>
		            </div>
		            <div class="form-group">
		              <label class="col-lg-3 control-label">Menikah</label>
		              <div class="col-lg-4">
		              	<input type="text" class="form-control" name="menikah" required placeholder="Input here......">
		              </div>
		            </div>
		            <div class="form-group">
		              <label class="col-lg-3 control-label">Bekerja</label>
		              <div class="col-lg-4">
		              	<input type="text" class="form-control" name="bekerja" required placeholder="Input here......">
		              </div>
		            </div>
		            <div class="form-group">
		              <label class="col-lg-3 control-label">Pesantren</label>
		              <div class="col-lg-4">
		              	<input type="text" class="form-control" name="pesantren" required placeholder="Input here......">
		              </div>
		            </div>
	            </div>

	            <button class="btn btn-success" type="submit">Simpan</button>
            </fieldset>	
		</div>
	</div>
</div>
</form>