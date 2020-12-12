<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/simpan_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">
			<fieldset>
	            
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Kode Arsip</label>
	              <div class="col-lg-4">
	              	<input type="text" class="form-control" required name="kode_arsip" value="<?php echo rand(0,999999) ?>" placeholder="Input here......">
	              </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Nomor Surat</label>
	              <div class="col-lg-4">
	              	<input type="text" class="form-control" required name="no_surat" placeholder="Input here......">
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Pengirim</label>
	              <div class="col-lg-4">
	              	<input type="text" class="form-control" name="pengirim" required placeholder="Input here......">
	              </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Perihal</label>
	              <div class="col-lg-4">
	              	<textarea class="form-control" name="perihal" placeholder="Input here......"></textarea>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Tanggal:</label>
	              <div class="col-lg-4">
	                <input type="date" name="tanggal_surat" class="form-control" required >
	              </div>
	            </div>
	            <button class="btn btn-success" type="submit">Simpan</button>
            </fieldset>	
		</div>
	</div>
</div>
</form>