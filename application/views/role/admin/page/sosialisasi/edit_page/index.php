<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/update_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">
			<fieldset>
	            
			<center><h3><b>Halaman Edit Surat Keluar</b></h3></center>
                <input type="hidden"  name="id_sosialisasi" value="<?php echo $data_get['sosialisasi']['id_sosialisasi'] ?>">
	            
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Judul</label>
	              <div class="col-lg-4">
	              	<input type="text" class="form-control" name="judul" value="<?php echo $data_get['sosialisasi']['judul'] ?>"  required placeholder="Input here......">
	              </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Keterangan</label>
	              <div class="col-lg-4">
	              	<textarea class="form-control" name="keterangan"   placeholder="Input here......"><?php echo $data_get['sosialisasi']['keterangan'] ?></textarea>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Tanggal:</label>
	              <div class="col-lg-4">
	                <input type="date" name="tanggal" value="<?php echo $data_get['sosialisasi']['tanggal'] ?>"  class="form-control" required >
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">File Arsip (Jika ada):</label>
	              <div class="col-lg-4">
	                <input type="file"  capture="user" accept="image/*" name="file_arsip" class="form-control" >
	                <input type="hidden"  name="file_arsip_before" value="<?php echo $data_get['sosialisasi']['berkas'] ?>">
	                <br>
	              	<div class="alert alert-info"><b>Info : </b>Gunakan HP untuk mengambil gambar dengan kamera</div>
	              </div>
	              <div class="col-lg-4"><?php if (!empty($data_get['sosialisasi']['berkas'])): ?>
	              	<a target="__blank" href="<?php echo base_url('include/media/arsip_sosialisasi/'.$data_get['sosialisasi']['berkas']) ?>">Download File Arsip</a>
	              <?php endif ?></div>
	            </div>
	            <button class="btn btn-success" type="submit">Simpan</button>
            </fieldset>	
		</div>
	</div>
</div>
</form>