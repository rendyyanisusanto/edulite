<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/simpan_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-6">
		<div class="panel panel-body">

			<center><h3><b>Halaman Tambah Surat Keluar</b></h3></center>
			<fieldset>
	            
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Kode Arsip</label>
	              <div class="col-lg-4">
	              	<input type="text" class="form-control kode_arsip" required name="kode_arsip" value="<?php echo rand(0,999999) ?>" placeholder="Input here......">
	              </div>
	              <div class="col-lg-3">
	              	<button class="btn btn-xs btn-success" data-toggle="tooltip" onclick="reload_table('surat_keluar','kode_arsip','kode_arsip');" data-placement="top" title="Reload Kode" type="button"><i class="icon-pencil7"></i></button>
	              	<button class="btn btn-xs btn-info" type="button" onclick="setting_table('surat_keluar','kode_arsip');" data-toggle="tooltip" data-placement="top" title="Setting Kode" ><i class="icon-cog3"></i></button>
	              </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Nomor Surat</label>
	              <div class="col-lg-4">
	              	<input type="text" class="form-control no_surat" required name="no_surat" placeholder="Input here......">
	              </div>
	              <div class="col-lg-3">
	              	<button class="btn btn-xs btn-success" data-toggle="tooltip" onclick="reload_table('surat_keluar','no_surat','no_surat');" data-placement="top" title="Reload Kode" type="button"><i class="icon-pencil7"></i></button>
	              	<button class="btn btn-xs btn-info" type="button" onclick="setting_table('surat_keluar','no_surat');" data-toggle="tooltip" data-placement="top" title="Setting Kode" ><i class="icon-cog3"></i></button>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Tujuan</label>
	              <div class="col-lg-9">
	              	<input type="text" class="form-control" name="tujuan" required placeholder="Input here......">
	              </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Perihal</label>
	              <div class="col-lg-9">
	              	<textarea class="form-control" name="perihal" placeholder="Input here......"></textarea>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Tanggal:</label>
	              <div class="col-lg-4">
	                <input type="date" name="tanggal_surat" class="form-control" required >
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">File Arsip (Jika ada):</label>
	              <div class="col-lg-4">
	                <input type="file"  capture="user"  name="file_arsip" class="form-control" >
	              	<br>
	              	<div class="alert alert-info"><b>Info : </b>Gunakan HP untuk mengambil gambar dengan kamera</div>
	              </div>
	            </div>
				<a href="<?php echo $data_get['param']['table'] ?>/get_data" class="app-item btn btn-danger"><i class="icon-arrow-left7"></i> Kembali</a>
	            <button class="btn btn-success" type="submit"><i class="icon-floppy-disk"></i> Simpan</button>
            </fieldset>	
		</div>
	</div>
</div>
</form>