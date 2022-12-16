<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/simpan_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">

			<center><h3><b>Halaman Tambah Lowongan</b></h3></center>
			<fieldset>
	            
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Judul</label>
	              <div class="col-lg-4">
	              	<input type="text" class="form-control" name="judul" required placeholder="Input here......">
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">DU/DI</label>
	              <div class="col-lg-4">
	              	<select class="form-control" required="" name="iddudi_fk">
	              		<option value=""> -- Pilih --</option>
	              		<?php foreach ($data_get['dudi'] as $value): ?>
	              			<option value="<?= $value['id_dudi'] ?>"><?= $value['nama'] ?></option>
	              		<?php endforeach ?>
	              	</select>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Gaji</label>
	              <div class="col-lg-4">
	              	<input type="number" class="form-control" name="rentang_gaji" required placeholder="Input here......">
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Keterangan</label>
	              <div class="col-lg-4">
	              	<textarea class="form-control" name="keterangan" placeholder="Input here......"></textarea>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Deadline:</label>
	              <div class="col-lg-4">
	                <input type="date" name="deadline" class="form-control" required >
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">File Berkas (Jika ada):</label>
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