<script src="<?php echo base_url('include/template/limitless/')?>/global_assets/js/plugins/forms/selects/select2.min.js"></script>

<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/simpan_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">

			<center><h3><b>Halaman Tambah Prestasi Siswa</b></h3></center>
			<fieldset>
	            

	           	<div class="form-group">
	              <label class="col-lg-3 control-label">Siswa</label>
	              <div class="col-lg-4">
	              	<select data-placeholder="Pilih Siswa" name="idsiswa_fk" class="select siswa">
                     
                    </select>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Prestasi</label>
	              <div class="col-lg-4">
	              	<input type="text" class="form-control" name="prestasi" required placeholder="Input here......">
	              </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Lomba</label>
	              <div class="col-lg-4">
	              	<textarea class="form-control" required="" name="lomba"></textarea>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Tahun:</label>
	              <div class="col-lg-4">
	                <input type="number" name="tahun" class="form-control" required >
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Jenis Perlombaan:</label>
	              <div class="col-lg-4">
	                <select class="form-control" name="jenis_perlombaan">
	                	<option value="Individu">Individu</option>
	                	<option value="Kelompok">Kelompok</option>
	                </select>
	              </div>
	            </div>
	            <!-- 
	            <div class="form-group">
	              <label class="col-lg-3 control-label">File Arsip (Jika ada):</label>
	              <div class="col-lg-4">
	                <input type="file" name="file_arsip" class="form-control" >
	              </div>
	            </div> -->
	            <button class="btn btn-success" type="submit">Simpan</button>
            </fieldset>	
		</div>
	</div>
</div>
</form>