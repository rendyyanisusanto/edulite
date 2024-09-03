<script src="<?php echo base_url('include/template/dashboard/')?>js/plugins/forms/selects/select2.min.js"></script>

<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/simpan_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-6">
		<div class="panel panel-body">

			<center><h3><b>Halaman Tambah Partisipasi Lomba</b></h3></center>
			<fieldset>
	            
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Kode</label>
	              <div class="col-lg-4">
	              	<input type="text" class="form-control kode" required name="kode"  placeholder="Input here......">
	              </div>
	              <div class="col-lg-3">
	                  <button class="btn btn-xs btn-success" data-toggle="tooltip" onclick="reload_table('partisipasi_lomba','kode','kode');" data-placement="top" title="Reload Kode" type="button"><i class="icon-pencil7"></i></button>
	                  <button class="btn btn-xs btn-info" type="button" onclick="setting_table('partisipasi_lomba','kode');" data-toggle="tooltip" data-placement="top" title="Setting Kode" ><i class="icon-cog3"></i></button>
	               </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Tanggal</label>
	              <div class="col-lg-9">
	              	<input type="date" class="form-control" required name="tanggal" placeholder="Input here......">
	              </div>
	            </div>

				<div class="form-group">
	              <label class="col-lg-3 control-label">Lomba</label>
	              <div class="col-lg-9">
	              	<input type="text" class="form-control" required name="lomba" placeholder="Input here......">
	              </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Bidang</label>
	              <div class="col-lg-9">
	              	<input type="text" class="form-control" required name="bidang" placeholder="Input here......">
	              </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Penyelenggara</label>
	              <div class="col-lg-9">
	              	<input type="text" class="form-control" required name="penyelenggara" placeholder="Input here......">
	              </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Foto (Jika ada):</label>
	              <div class="col-lg-4">
	                <input type="file"  name="foto_brosur" class="form-control" >
	              	<br>
	              	<div class="alert alert-info"><b>Info : </b>Gunakan HP untuk mengambil gambar dengan kamera</div>
	              </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Proposal:</label>
	              <div class="col-lg-4">
	                <input type="file"  name="proposal" class="form-control" >
	              	<br>
	              	<div class="alert alert-info"><b>Info : </b>Gunakan HP untuk mengambil gambar dengan kamera</div>
	              </div>
	            </div>
	            <hr>
	            <button class="btn btn-primary btn-add" type="button" onclick="tambah_peserta();">Tambah Peserta</button>
	            <div class="peserta"></div>

	            <hr>
				<a href="<?php echo $data_get['param']['table'] ?>/get_data" class="app-item btn btn-danger"><i class="icon-arrow-left7"></i> Kembali</a>
	            <button class="btn btn-success" type="submit"><i class="icon-floppy-disk"></i> Simpan</button>
            </fieldset>	
		</div>
	</div>
</div>
</form>
