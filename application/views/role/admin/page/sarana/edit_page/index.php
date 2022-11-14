<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/update_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">
			<fieldset>
	            
			<center><h3><b>Halaman Edit</b></h3></center>
                <input type="hidden"  name="id_sarana" value="<?php echo $data_get['sarana']['id_sarana'] ?>">
	            <div class="form-group">
	              <label class="col-lg-3 control-label">No. Inventaris</label>
	              <div class="col-lg-4">
	              	<input type="text" class="form-control" required name="no_inventaris" value="<?php echo $data_get['sarana']['no_inventaris'] ?>" placeholder="Input here......">
	              </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Nama Sarana</label>
	              <div class="col-lg-4">
	              	<input type="text" class="form-control" required name="sarana" value="<?php echo $data_get['sarana']['sarana'] ?>"  placeholder="Input here......">
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Jumlah</label>
	              <div class="col-lg-4">
	              	<input type="number" class="form-control" name="jumlah" required value="<?php echo $data_get['sarana']['jumlah'] ?>"  placeholder="Input here......">
	              </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Spesifikasi</label>
	              <div class="col-lg-4">
	              	<textarea class="form-control" name="spesifikasi" placeholder="Input here......"><?php echo $data_get['sarana']['spesifikasi'] ?></textarea>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Kondisi Sarana:</label>
	              <div class="col-lg-4">
	              	<select class="form-control" required="" name="idkondisisarana_fk">
	              		<?php foreach ($data_get['kondisi_sarana'] as $value): ?>
	              			<option <?= ($value['id_kondisi_sarana'] == $data_get['sarana']['idkondisisarana_fk']) ? "selected" : ""; ?> value="<?= $value['id_kondisi_sarana'] ?>" style="color:<?= $value['warna'] ?>; font-weight: bold;"><?= $value['kondisi_sarana'] ?></option>
	              		<?php endforeach ?>
	              	</select>
	              </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Kelompok Sarana:</label>
	              <div class="col-lg-4">
	              	<select class="form-control" required="" name="idkelompoksarana_fk">
	              		<?php foreach ($data_get['kelompok_sarana'] as $value): ?>
	              			<option <?= ($value['id_kelompok_sarana'] == $data_get['sarana']['idkelompoksarana_fk']) ? "selected" : ""; ?>  value="<?= $value['id_kelompok_sarana'] ?>" ><?= $value['kelompok_sarana'] ?></option>
	              		<?php endforeach ?>
	              	</select>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">File Arsip (Jika ada):</label>
	              <div class="col-lg-4">
	                <input type="file"  capture="user" accept="image/*" name="file_arsip" class="form-control" >
	                <input type="hidden"  name="file_arsip_before" value="<?php echo $data_get['sarana']['foto'] ?>">
	                <br>
	              	<div class="alert alert-info"><b>Info : </b>Gunakan HP untuk mengambil gambar dengan kamera</div>
	              </div>
	              <div class="col-lg-4"><?php if (!empty($data_get['sarana']['foto'])): ?>
	              	<a target="__blank" href="<?php echo base_url('include/media/sarana/'.$data_get['sarana']['foto']) ?>">Download File Arsip</a>
	              <?php endif ?></div>
	            </div>
	            <button class="btn btn-success" type="submit">Simpan</button>
            </fieldset>	
		</div>
	</div>
</div>
</form>