<script type="text/javascript" src="<?php echo base_url('include/ckeditor/ckeditor.js'); ?>"></script>

<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/update_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-6">
		<div class="panel panel-body">

			<center><h3><b>Halaman Edit Kondisi Sarana</b></h3></center>
			<fieldset>

	            	<input type="hidden" value="<?php echo $data_get['kondisi_sarana']['id_kondisi_sarana'] ?>" name="id_kondisi_sarana">
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Kondisi:</label>
	              <div class="col-lg-9">
	                <input type="text" name="kondisi_sarana" value="<?php echo $data_get['kondisi_sarana']['kondisi_sarana'] ?>" class="form-control" required placeholder="Input here......">
	              </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Warna:</label>
	              <div class="col-lg-2">
	                <input type="color" name="warna" value="<?php echo $data_get['kondisi_sarana']['warna'] ?>" class="form-control"  required="" placeholder="Input here......">
	              </div>
	            </div>
	            
	            <button class="btn btn-success" type="submit">Simpan</button>
            </fieldset>	
		</div>
	</div>
</div>
</form>