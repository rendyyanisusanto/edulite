<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/simpan_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-6">
		<div class="panel panel-body">

			<center><h3><b>Halaman Tambah Hari Libur</b></h3></center>
			<fieldset>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Tanggal</label>
	              <div class="col-lg-9">
	              	<input type="date" class="form-control" required name="tanggal" placeholder="Input here......">
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Keterangan</label>
	              <div class="col-lg-9">
	              	<input type="text" class="form-control" name="keterangan" required placeholder="Input here......">
	              </div>
	            </div>
	            <div class="form-group">
					<label class="col-lg-3 control-label">Pengecualian (Guru) :</label>
					<div class="col-lg-9">
						<button class="btn btn-default" type="button" onclick="add_guru();"><i class="icon-plus3"></i></button>
					</div>
				</div>
				<div class="content-guru"></div>
                
				<a href="<?php echo $data_get['param']['table'] ?>/get_data" class="app-item btn btn-danger"><i class="icon-arrow-left7"></i> Kembali</a>
	            <button class="btn btn-success" type="submit"><i class="icon-floppy-disk"></i> Simpan</button>
            </fieldset>	
		</div>
	</div>
</div>
</form>