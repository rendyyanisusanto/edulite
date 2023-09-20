<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/update_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-6">
		<div class="panel panel-body">
			<fieldset>
	            
			<center><h3><b>Halaman Edit Sarana</b></h3></center>
                <input type="hidden"  name="id_sarana" value="<?php echo $data_get['sarana']['id_sarana'] ?>">
	            <div class="form-group">
	              <label class="col-lg-3 control-label">No. Inventaris</label>
	              <div class="col-lg-4">
	              	<input type="text" class="form-control no_inventaris" required name="no_inventaris" value="<?php echo $data_get['sarana']['no_inventaris'] ?>" placeholder="Input here......">
	              </div>
	              <div class="col-lg-3">
	                  <button class="btn btn-xs btn-success" data-toggle="tooltip" onclick="reload_table('sarana','no_inventaris','no_inventaris');" data-placement="top" title="Reload Kode" type="button"><i class="icon-pencil7"></i></button>
	                  <button class="btn btn-xs btn-info" type="button" onclick="setting_table('sarana','no_inventaris');" data-toggle="tooltip" data-placement="top" title="Setting Kode" ><i class="icon-cog3"></i></button>
	               </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Nama Sarana</label>
	              <div class="col-lg-9">
	              	<input type="text" class="form-control" required name="sarana" value="<?php echo $data_get['sarana']['sarana'] ?>"  placeholder="Input here......">
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Lokasi/Tempat:</label>
	              <div class="col-lg-4">
	              	<select class="form-control" required="" name="idlokasi_fk">
	              		<?php foreach ($data_get['prasarana'] as $value): ?>
	              			<option <?= ($value['id_prasarana'] == $data_get['sarana']['idlokasi_fk']) ? "selected" : ""; ?> value="<?= $value['id_prasarana'] ?>" ><?= $value['no_inventaris'].' - '.$value['prasarana'] ?></option>
	              		<?php endforeach ?>
	              	</select>
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
	              <div class="col-lg-9">
	              	<textarea class="form-control" name="spesifikasi" placeholder="Input here......"><?php echo $data_get['sarana']['spesifikasi'] ?></textarea>
	              </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Tahun Pengadaan</label>
	              <div class="col-lg-4">
	              	<input type="number" value="<?= $data_get['sarana']['tahun_pengadaan'] ?>" class="form-control" name="tahun_pengadaan" required placeholder="Input here......">
	              </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Tanggal Pengadaan</label>
	              <div class="col-lg-4">
	              	<input type="date" class="form-control" value="<?= $data_get['sarana']['tanggal_pengadaan'] ?>" name="tanggal_pengadaan" required placeholder="Input here......">
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
	            <a href="<?php echo $data_get['param']['table'] ?>/get_data" class="app-item btn btn-danger"><i class="icon-arrow-left7"></i> Kembali</a>
	            <button class="btn btn-success" type="submit"><i class="icon-floppy-disk"></i> Simpan</button>
            </fieldset>	
		</div>
	</div>
</div>
</form>