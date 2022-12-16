<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/simpan_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-6">
		<div class="panel panel-body">

			<center><h3><b>Halaman Tambah Prasarana</b></h3></center>
			<fieldset>
	            
	            <div class="form-group">
	              <label class="col-lg-3 control-label">No. Inventaris</label>
	              <div class="col-lg-4">
	              	<input type="text" class="form-control no_inventaris" required name="no_inventaris"  placeholder="Input here......">
	              </div>
	              <div class="col-lg-3">
	                  <button class="btn btn-xs btn-success" data-toggle="tooltip" onclick="reload_table('prasarana','no_inventaris','no_inventaris');" data-placement="top" title="Reload Kode" type="button"><i class="icon-pencil7"></i></button>
	                  <button class="btn btn-xs btn-info" type="button" onclick="setting_table('prasarana','no_inventaris');" data-toggle="tooltip" data-placement="top" title="Setting Kode" ><i class="icon-cog3"></i></button>
	               </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Nama prasarana</label>
	              <div class="col-lg-9">
	              	<input type="text" class="form-control" required name="prasarana" placeholder="Input here......">
	              </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Spesifikasi</label>
	              <div class="col-lg-9">
	              	<textarea class="form-control" name="spesifikasi" placeholder="Input here......"></textarea>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Kondisi prasarana:</label>
	              <div class="col-lg-4">
	              	<select class="form-control" required="" name="idkondisiprasarana_fk">
	              		<?php foreach ($data_get['kondisi_prasarana'] as $value): ?>
	              			<option value="<?= $value['id_kondisi_prasarana'] ?>" style="color:<?= $value['warna'] ?>; font-weight: bold;"><?= $value['kondisi_prasarana'] ?></option>
	              		<?php endforeach ?>
	              	</select>
	              </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Kelompok prasarana:</label>
	              <div class="col-lg-4">
	              	<select class="form-control" required="" name="idkelompokprasarana_fk">
	              		<?php foreach ($data_get['kelompok_prasarana'] as $value): ?>
	              			<option value="<?= $value['id_kelompok_prasarana'] ?>" ><?= $value['kelompok_prasarana'] ?></option>
	              		<?php endforeach ?>
	              	</select>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Foto (Jika ada):</label>
	              <div class="col-lg-4">
	                <input type="file"  capture="user"  name="foto" class="form-control" >
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
