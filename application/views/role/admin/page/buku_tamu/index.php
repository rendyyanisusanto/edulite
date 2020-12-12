<script src="<?php echo base_url('include/template/limitless/')?>/global_assets/js/plugins/forms/selects/select2.min.js"></script>
<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/simpan_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">
			<fieldset>
	            
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Nama:</label>
	              <div class="col-lg-9">
	                <input type="text" name="nama" class="form-control" required placeholder="Input here......">
	              </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Alamat:</label>
	              <div class="col-lg-9">
	                <input type="text" name="alamat" class="form-control" required placeholder="Input here......">
	              </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Keperluan:</label>
	              <div class="col-lg-9">
	                <input type="text" name="keperluan" class="form-control" required placeholder="Input here......">
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Tanggal:</label>
	              <div class="col-lg-9">
	                <input type="date" name="tanggal" class="form-control" required placeholder="Input here......">
	              </div>
	            </div>
	            <button class="btn btn-success" type="submit">Simpan</button>
            </fieldset>	
		</div>
	</div>
</div>
</form>