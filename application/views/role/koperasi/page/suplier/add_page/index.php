<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/simpan_data" id="app-submit" method="POST">
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">
			<fieldset>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Nama Suplier</label>
	              <div class="col-lg-4">
	              	<input type="text" class="form-control" required name="suplier" placeholder="Input here......">
	              </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">No Hp</label>
	              <div class="col-lg-4">
	              	<input type="text" class="form-control" required name="no_hp" placeholder="Input here......">
	              </div>
	            </div>
	            <button class="btn btn-success" type="submit">Simpan</button>
            </fieldset>	
		</div>
	</div>
</div>
</form>