<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/update_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">

			<center><h3><b>Halaman Edit Surat Masuk</b></h3></center>
			<fieldset>
	            
                <input type="hidden"  name="id_surat_masuk" value="<?php echo $data_get['surat_masuk']['id_surat_masuk'] ?>">
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Kode Arsip</label>
	              <div class="col-lg-4">
	              	<input type="text" class="form-control" required name="kode_arsip" value="<?php echo $data_get['surat_masuk']['kode_arsip'] ?>" placeholder="Input here......">
	              </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Nomor Surat</label>
	              <div class="col-lg-4">
	              	<input type="text" class="form-control" required name="no_surat" value="<?php echo $data_get['surat_masuk']['no_surat'] ?>" placeholder="Input here......">
	              </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Pengirim</label>
	              <div class="col-lg-4">
	              	<input type="text" class="form-control" name="pengirim" value="<?php echo $data_get['surat_masuk']['pengirim'] ?>" required placeholder="Input here......">
	              </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Perihal</label>
	              <div class="col-lg-4">
	              	<textarea class="form-control" name="perihal" placeholder="Input here......"><?php echo $data_get['surat_masuk']['perihal'] ?></textarea>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Tanggal:</label>
	              <div class="col-lg-4">
	                <input type="date" value="<?php echo $data_get['surat_masuk']['tanggal_surat'] ?>" name="tanggal_surat" class="form-control" required >
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">File Arsip (Jika ada):</label>
	              <div class="col-lg-4">
	                <input type="file" name="file_arsip" class="form-control" >
	                <input type="hidden"  name="file_arsip_before" value="<?php echo $data_get['surat_masuk']['file_arsip'] ?>">
	              </div>
	              <div class="col-lg-4"><?php if (!empty($data_get['surat_masuk']['file_arsip'])): ?>
	              	<a target="__blank" href="<?php echo base_url('include/media/arsip_surat_masuk/'.$data_get['surat_masuk']['file_arsip']) ?>">Download File Arsip</a>
	              <?php endif ?></div>
	            <button class="btn btn-success" type="submit">Simpan</button>
            </fieldset>	
		</div>
	</div>
</div>
</form>