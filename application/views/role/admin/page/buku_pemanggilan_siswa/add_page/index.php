<script src="<?php echo base_url('include/template/dashboard/')?>/js/plugins/forms/selects/select2.min.js"></script>

<form class="form-horizontal" action="buku_pemanggilan_siswa/simpan_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-6">
		<div class="panel panel-body">
			<fieldset>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Kode : </label>
	              <div class="col-lg-4">
	              	<input type="text" class="form-control kode_pemanggilan" required name="kode_pemanggilan"  placeholder="Input here......">
	              </div>
	              <div class="col-lg-3">
	              	<button class="btn btn-xs btn-success" data-toggle="tooltip" onclick="reload_table('buku_pemanggilan_siswa','kode_pemanggilan','kode_pemanggilan');" data-placement="top" title="Reload Kode" type="button"><i class="icon-pencil7"></i></button>
	              	<button class="btn btn-xs btn-info" type="button" onclick="setting_table('buku_pemanggilan_siswa','kode_pemanggilan');" data-toggle="tooltip" data-placement="top" title="Setting Kode" ><i class="icon-cog3"></i></button>
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
	              <div class="col-lg-9">
	              	<textarea class="form-control" required="" name="masalah" placeholder="Input here......"></textarea>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Pemecahan</label>
	              <div class="col-lg-9">
	              	<textarea class="form-control" required="" name="pemecahan" placeholder="Input here......"></textarea>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Tindak lanjut</label>
	              <div class="col-lg-9">
	              	<textarea class="form-control" required="" name="tindak_lanjut" placeholder="Input here......"></textarea>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Keterangan</label>
	              <div class="col-lg-9">
	              	<textarea class="form-control" required="" name="keterangan" placeholder="Input here......"></textarea>
	              </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Dokumen Tambahan</label>
	              <div class="col-lg-4">
	              	<input type="file" class="form-control" name="dokumen" required placeholder="Input here......">
	              </div>
	            </div>

				<a href="buku_pemanggilan_siswa/get_data" class="app-item btn btn-danger"><i class="icon-arrow-left7"></i> Kembali</a>
	            <button class="btn btn-success" type="submit"><i class="icon-floppy-disk"></i> Simpan</button>
            </fieldset>	
		</div>
	</div>
</div>
</form>