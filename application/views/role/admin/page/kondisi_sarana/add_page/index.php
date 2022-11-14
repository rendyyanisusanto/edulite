<script type="text/javascript" src="<?php echo base_url('include/ckeditor/ckeditor.js'); ?>"></script>

<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/simpan_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-6">
		<div class="panel panel-body">

			<center><h3><b>Halaman Tambah Kondisi Sarana</b></h3></center>
			<fieldset>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Kondisi:</label>
	              <div class="col-lg-9">
	                <input type="text" name="kondisi_sarana" class="form-control" required placeholder="Input here......">
	              </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Warna:</label>
	              <div class="col-lg-2">
	                <input type="color" name="warna" class="form-control"  required="" placeholder="Input here......">
	              </div>
	            </div>

	            <button class="btn btn-success" type="submit"><i class="icon-floppy-disk"></i> Simpan</button>
            </fieldset>	
		</div>
	</div>
</div>
</form>