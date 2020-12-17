<script src="<?php echo base_url('include/template/limitless/')?>/global_assets/js/plugins/forms/selects/select2.min.js"></script>

<form class="form-horizontal" action="buku_pemanggilan_siswa/simpan_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">
			<fieldset>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Kode : </label>
	              <div class="col-lg-4">
	              	<input type="text" class="form-control" required name="kode_pemanggilan" value="BK-<?php echo rand(0,999999).rand(0,999999) ?>" placeholder="Input here......">
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Tanggal</label>
	              <div class="col-lg-4">
	              	<input type="date" class="form-control" name="tanggal" required placeholder="Input here......">
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Siswa</label>
	              <div class="col-lg-4">
	              	<select data-placeholder="Pilih Siswa" name="idsiswa_fk" class="select siswa">
                     
                    </select>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Masalah</label>
	              <div class="col-lg-4">
	              	<textarea class="form-control" name="masalah" placeholder="Input here......"></textarea>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Pemecahan</label>
	              <div class="col-lg-4">
	              	<textarea class="form-control" name="pemecahan" placeholder="Input here......"></textarea>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Tindak lanjut</label>
	              <div class="col-lg-4">
	              	<textarea class="form-control" name="tindak_lanjut" placeholder="Input here......"></textarea>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Keterangan</label>
	              <div class="col-lg-4">
	              	<textarea class="form-control" name="keterangan" placeholder="Input here......"></textarea>
	              </div>
	            </div>


	            

	            <button class="btn btn-success" type="submit">Simpan</button>
            </fieldset>	
		</div>
	</div>
</div>
</form>