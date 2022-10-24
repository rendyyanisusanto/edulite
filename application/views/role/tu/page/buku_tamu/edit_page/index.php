<script type="text/javascript" src="<?php echo base_url('include/ckeditor/ckeditor.js'); ?>"></script>

<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/update_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">

			<center><h3><b>Halaman Edit Buku Tamu</b></h3></center>
			<fieldset>
	            <div class="form-group">
	            	<input type="hidden" value="<?php echo $data_get['buku_tamu']['id_buku_tamu'] ?>" name="id_buku_tamu">
	              <label class="col-lg-3 control-label">Tanggal:</label>
	              <div class="col-lg-9">
	                <input type="date" name="tanggal" class="form-control" value="<?php echo $data_get['buku_tamu']['tanggal'] ?>" required placeholder="Input here......">
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Nama:</label>
	              <div class="col-lg-9">
	                <input type="text" name="nama" class="form-control" value="<?php echo $data_get['buku_tamu']['nama'] ?>" required placeholder="Input here......">
	              </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Alamat:</label>
	              <div class="col-lg-9">
	                <input type="text" name="alamat" class="form-control" value="<?php echo $data_get['buku_tamu']['alamat'] ?>"  required="" placeholder="Input here......">
	              </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Jabatan:</label>
	              <div class="col-lg-9">
	              	<input type="text" name="jabatan" class="form-control" value="<?php echo $data_get['buku_tamu']['jabatan'] ?>"  required="" placeholder="Input here......">
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Keperluan:</label>
	              <div class="col-lg-9">
	              	<textarea name="keperluan" class="form-control" required="" id="keperluan" ><?php echo $data_get['buku_tamu']['keperluan'] ?></textarea>
	                
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Saran:</label>
	              <div class="col-lg-9">
	              	<textarea name="saran" id="saran" class="form-control" ><?php echo $data_get['buku_tamu']['saran'] ?></textarea>
	                
	              </div>
	            </div>
	            
	            <button class="btn btn-success" type="submit">Simpan</button>
            </fieldset>	
		</div>
	</div>
</div>
</form>