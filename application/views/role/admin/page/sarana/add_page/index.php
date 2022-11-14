<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/simpan_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">

			<center><h3><b>Halaman Tambah Surat Keluar</b></h3></center>
			<fieldset>
	            
	            <div class="form-group">
	              <label class="col-lg-3 control-label">No. Inventaris</label>
	              <div class="col-lg-4">
	              	<input type="text" class="form-control" required name="no_inventaris" value="<?php echo rand(0,999999) ?>" placeholder="Input here......">
	              </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Nama Sarana</label>
	              <div class="col-lg-4">
	              	<input type="text" class="form-control" required name="sarana" placeholder="Input here......">
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Jumlah</label>
	              <div class="col-lg-4">
	              	<input type="number" class="form-control" name="jumlah" required placeholder="Input here......">
	              </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Spesifikasi</label>
	              <div class="col-lg-4">
	              	<textarea class="form-control" name="spesifikasi" placeholder="Input here......"></textarea>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Kondisi Sarana:</label>
	              <div class="col-lg-4">
	              	<select class="form-control" required="" name="idkondisisarana_fk">
	              		<?php foreach ($data_get['kondisi_sarana'] as $value): ?>
	              			<option value="<?= $value['id_kondisi_sarana'] ?>" style="color:<?= $value['warna'] ?>; font-weight: bold;"><?= $value['kondisi_sarana'] ?></option>
	              		<?php endforeach ?>
	              	</select>
	              </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Kelompok Sarana:</label>
	              <div class="col-lg-4">
	              	<select class="form-control" required="" name="idkelompoksarana_fk">
	              		<?php foreach ($data_get['kelompok_sarana'] as $value): ?>
	              			<option value="<?= $value['id_kelompok_sarana'] ?>" ><?= $value['kelompok_sarana'] ?></option>
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
	            <button class="btn btn-success" type="submit">Simpan</button>
            </fieldset>	
		</div>
	</div>
</div>
</form>
