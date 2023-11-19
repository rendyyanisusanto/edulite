<form class="form-horizontal" action="#" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-6">
		<div class="panel panel-body">
			<fieldset>
	            
			<center><h3><b>Halaman Detail Surat Keluar</b></h3></center>
                <!-- <input type="hidden"  name="id_surat_keluar" value="<?php echo $data_get['surat_keluar']['id_surat_keluar'] ?>"> -->
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Kode Arsip</label>
	              <div class="col-lg-4">
	              	<input type="text" class="form-control kode_arsip" required name="kode_arsip" value="<?php echo $data_get['surat_keluar']['kode_arsip'] ?>" placeholder="Input here......">
	              </div>
	              
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Nomor Surat</label>
	              <div class="col-lg-4">
	              	<input type="text" class="form-control no_surat" required name="no_surat" value="<?php echo $data_get['surat_keluar']['no_surat'] ?>"  placeholder="Input here......">
	              </div>
	              
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Tujuan</label>
	              <div class="col-lg-9">
	              	<input type="text" class="form-control" name="tujuan" value="<?php echo $data_get['surat_keluar']['tujuan'] ?>"  required placeholder="Input here......">
	              </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Perihal</label>
	              <div class="col-lg-9">
	              	<textarea class="form-control" name="perihal"   placeholder="Input here......"><?php echo $data_get['surat_keluar']['perihal'] ?></textarea>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Tanggal:</label>
	              <div class="col-lg-4">
	                <input type="date" name="tanggal_surat" value="<?php echo $data_get['surat_keluar']['tanggal_surat'] ?>"  class="form-control" required >
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">File Arsip (Jika ada):</label>
	              
	              <div class="col-lg-4"><?php if (!empty($data_get['surat_keluar']['file_arsip'])): ?>
	              	<a target="__blank" href="<?php echo base_url('include/media/arsip_surat_keluar/'.$data_get['surat_keluar']['file_arsip']) ?>">Download File Arsip</a>
	              <?php endif ?></div>
	            </div>
				<a href="<?php echo $data_get['param']['table'] ?>/get_data" class="app-item btn btn-danger"><i class="icon-arrow-left7"></i> Kembali</a>
	           
            </fieldset>	
		</div>
	</div>
</div>
</form>