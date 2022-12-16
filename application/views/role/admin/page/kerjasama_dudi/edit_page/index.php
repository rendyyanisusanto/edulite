<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/update_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">
			<fieldset>
	            
			<center><h3><b>Halaman Edit Surat Keluar</b></h3></center>
                <input type="hidden"  name="id_kerjasama_dudi" value="<?php echo $data_get['kerjasama_dudi']['id_kerjasama_dudi'] ?>">
	            
	           <div class="form-group">
	              <label class="col-lg-3 control-label">DU/DI</label>
	              <div class="col-lg-4">
	              	<select class="form-control" required="" name="iddudi_fk">
	              		<option value="">Pilih DUDI</option>
	              		<?php foreach ($data_get['dudi'] as $value): ?>
	              			<option value="<?= $value['id_dudi'] ?>" <?= (($data_get['kerjasama_dudi']['iddudi_fk'] == $value['id_dudi']) ? "selected" :""); ?>><?= $value['nama'] ?></option>
	              		<?php endforeach ?>
	              	</select>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Jenis Kerjasama</label>
	              <div class="col-lg-4">
	              	<select class="form-control" required="" name="idjeniskerjasama_fk">
	              		<option value="">Pilih Jenis Kerjasama</option>
	              		<?php foreach ($data_get['jenis_kerjasama'] as $value): ?>
	              			<option <?= (($data_get['kerjasama_dudi']['idjeniskerjasama_fk'] == $value['id_jenis_kerjasama']) ? "selected" :""); ?> value="<?= $value['id_jenis_kerjasama'] ?>"><?= $value['jenis_kerjasama'] ?></option>
	              		<?php endforeach ?>
	              	</select>
	              </div>
	            </div>


	            <div class="form-group">
	              <label class="col-lg-3 control-label">Keterangan</label>
	              <div class="col-lg-4">
	              	<textarea class="form-control" name="keterangan"   placeholder="Input here......"><?php echo $data_get['kerjasama_dudi']['keterangan'] ?></textarea>
	              </div>
	            </div>
	            
	            <div class="form-group">
	              <label class="col-lg-3 control-label">File Arsip (Jika ada):</label>
	              <div class="col-lg-4">
	                <input type="file"  capture="user" accept="image/*" name="file_arsip" class="form-control" >
	                <input type="hidden"  name="file_arsip_before" value="<?php echo $data_get['kerjasama_dudi']['berkas'] ?>">
	                <br>
	              	<div class="alert alert-info"><b>Info : </b>Gunakan HP untuk mengambil gambar dengan kamera</div>
	              </div>
	              <div class="col-lg-4"><?php if (!empty($data_get['kerjasama_dudi']['berkas'])): ?>
	              	<a target="__blank" href="<?php echo base_url('include/media/arsip_kerjasama_dudi/'.$data_get['kerjasama_dudi']['berkas']) ?>">Download File Arsip</a>
	              <?php endif ?></div>
	            </div>
				<a href="<?php echo $data_get['param']['table'] ?>/get_data" class="app-item btn btn-danger"><i class="icon-arrow-left7"></i> Kembali</a>
	            <button class="btn btn-success" type="submit"><i class="icon-floppy-disk"></i> Simpan</button>
            </fieldset>	
		</div>
	</div>
</div>
</form>