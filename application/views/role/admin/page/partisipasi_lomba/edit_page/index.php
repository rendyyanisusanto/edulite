<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/update_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-6">
		<div class="panel panel-body">
			<fieldset>
	            
			<center><h3><b>Halaman Edit</b></h3></center>
                <input type="hidden"  name="id_prasarana" value="<?php echo $data_get['prasarana']['id_prasarana'] ?>">
	            <div class="form-group">
	              <label class="col-lg-3 control-label">No. Inventaris</label>
	              <div class="col-lg-4">
	              	<input type="text" class="form-control no_inventaris" required name="no_inventaris" value="<?php echo $data_get['prasarana']['no_inventaris'] ?>" placeholder="Input here......">
	              </div>
	              <div class="col-lg-3">
	                  <button class="btn btn-xs btn-success" data-toggle="tooltip" onclick="reload_table('prasarana','no_inventaris','no_inventaris');" data-placement="top" title="Reload Kode" type="button"><i class="icon-pencil7"></i></button>
	                  <button class="btn btn-xs btn-info" type="button" onclick="setting_table('prasarana','no_inventaris');" data-toggle="tooltip" data-placement="top" title="Setting Kode" ><i class="icon-cog3"></i></button>
	               </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Nama prasarana</label>
	              <div class="col-lg-9">
	              	<input type="text" class="form-control" required name="prasarana" value="<?php echo $data_get['prasarana']['prasarana'] ?>"  placeholder="Input here......">
	              </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Spesifikasi</label>
	              <div class="col-lg-9">
	              	<textarea class="form-control" name="spesifikasi" placeholder="Input here......"><?php echo $data_get['prasarana']['spesifikasi'] ?></textarea>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Kondisi prasarana:</label>
	              <div class="col-lg-4">
	              	<select class="form-control" required="" name="idkondisiprasarana_fk">
	              		<?php foreach ($data_get['kondisi_prasarana'] as $value): ?>
	              			<option <?= ($value['id_kondisi_prasarana'] == $data_get['prasarana']['idkondisiprasarana_fk']) ? "selected" : ""; ?> value="<?= $value['id_kondisi_prasarana'] ?>" style="color:<?= $value['warna'] ?>; font-weight: bold;"><?= $value['kondisi_prasarana'] ?></option>
	              		<?php endforeach ?>
	              	</select>
	              </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Kelompok prasarana:</label>
	              <div class="col-lg-4">
	              	<select class="form-control" required="" name="idkelompokprasarana_fk">
	              		<?php foreach ($data_get['kelompok_prasarana'] as $value): ?>
	              			<option <?= ($value['id_kelompok_prasarana'] == $data_get['prasarana']['idkelompokprasarana_fk']) ? "selected" : ""; ?>  value="<?= $value['id_kelompok_prasarana'] ?>" ><?= $value['kelompok_prasarana'] ?></option>
	              		<?php endforeach ?>
	              	</select>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">File Arsip (Jika ada):</label>
	              <div class="col-lg-4">
	                <input type="file"  capture="user" accept="image/*" name="file_arsip" class="form-control" >
	                <input type="hidden"  name="file_arsip_before" value="<?php echo $data_get['prasarana']['foto'] ?>">
	                <br>
	              	<div class="alert alert-info"><b>Info : </b>Gunakan HP untuk mengambil gambar dengan kamera</div>
	              </div>
	              <div class="col-lg-4"><?php if (!empty($data_get['prasarana']['foto'])): ?>
	              	<a target="__blank" href="<?php echo base_url('include/media/prasarana/'.$data_get['prasarana']['foto']) ?>">Download File Arsip</a>
	              <?php endif ?></div>
	            </div>
				<a href="<?php echo $data_get['param']['table'] ?>/get_data" class="app-item btn btn-danger"><i class="icon-arrow-left7"></i> Kembali</a>
	            <button class="btn btn-success" type="submit"><i class="icon-floppy-disk"></i> Simpan</button>
            </fieldset>	
		</div>
	</div>
</div>
</form>