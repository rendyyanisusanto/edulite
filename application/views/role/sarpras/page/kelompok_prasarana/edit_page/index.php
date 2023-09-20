<script type="text/javascript" src="<?php echo base_url('include/ckeditor/ckeditor.js'); ?>"></script>

<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/update_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-6">
		<div class="panel panel-body">

			<center><h3><b>Halaman Edit Kelompok Prasarana</b></h3></center>
			<fieldset>

	            	<input type="hidden" value="<?php echo $data_get['kelompok_prasarana']['id_kelompok_prasarana'] ?>" name="id_kelompok_prasarana">
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Kelompok:</label>
	              <div class="col-lg-9">
	                <input type="text" name="kelompok_prasarana" value="<?php echo $data_get['kelompok_prasarana']['kelompok_prasarana'] ?>" class="form-control" required placeholder="Input here......">
	              </div>
	            </div>

				<a href="<?php echo $data_get['param']['table'] ?>/get_data" class="app-item btn btn-danger"><i class="icon-arrow-left7"></i> Kembali</a>
	            <button class="btn btn-success" type="submit"><i class="icon-floppy-disk"></i> Simpan</button>
            </fieldset>	
		</div>
	</div>
</div>
</form>