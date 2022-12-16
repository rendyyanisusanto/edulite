<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/update_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">
			<fieldset>
	            
			<center><h3><b>Halaman Edit Surat Keluar</b></h3></center>
                <input type="hidden"  name="id_dudi" value="<?php echo $data_get['dudi']['id_dudi'] ?>">
	            
				<div class="form-group">
	              <label class="col-lg-3 control-label">Nama</label>
	              <div class="col-lg-4">
	              	<input type="text" class="form-control" name="nama" value="<?php echo $data_get['dudi']['nama'] ?>"  required placeholder="Input here......">
	              </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">No. HP</label>
	              <div class="col-lg-4">
	              	<input type="text" class="form-control" name="no_hp" value="<?php echo $data_get['dudi']['no_hp'] ?>"  required placeholder="Input here......">
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Alamat:</label>
	              <div class="col-lg-4">
	              	<input type="text" class="form-control" name="alamat" value="<?php echo $data_get['dudi']['alamat'] ?>"  required placeholder="Input here......">
	              </div>
	            </div>
				<a href="<?php echo $data_get['param']['table'] ?>/get_data" class="app-item btn btn-danger"><i class="icon-arrow-left7"></i> Kembali</a>
	            <button class="btn btn-success" type="submit"><i class="icon-floppy-disk"></i> Simpan</button>
            </fieldset>	
		</div>
	</div>
</div>
</form>