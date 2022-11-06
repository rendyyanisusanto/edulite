<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/update_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">

			<center><h3><b>Halaman Edit department</b></h3></center>
			<fieldset>
	            <input type="hidden" value="<?= $data_get['department']['id_department'] ?>" name="id_department">
	            
	            <div class="form-group">
	              <label class="col-lg-3 control-label">department</label>
	              <div class="col-lg-4">
	              	<input type="text" class="form-control" value="<?= $data_get['department']['department'] ?>" required name="department" placeholder="Input here......">
	              </div>
	            </div>
	            <button class="btn btn-success" type="submit"><i class="icon-floppy-disk"></i> Simpan</button>
            </fieldset>	
		</div>
	</div>
</div>
</form>