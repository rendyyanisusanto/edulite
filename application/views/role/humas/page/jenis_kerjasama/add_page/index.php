<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/simpan_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">

			<center><h3><b>Halaman Tambah Jenis Kerjasama</b></h3></center>
			<fieldset>
	            
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Nama</label>
	              <div class="col-lg-4">
	              	<input type="text" class="form-control" name="jenis_kerjasama" required placeholder="Input here......">
	              </div>
	            </div>

	            
	            <button class="btn btn-success" type="submit"><i class="icon-floppy-disk"></i> Simpan</button>
            </fieldset>	
		</div>
	</div>
</div>
</form>