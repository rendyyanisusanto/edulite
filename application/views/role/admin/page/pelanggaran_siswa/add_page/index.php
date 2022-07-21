<script src="<?php echo base_url('include/template/dashboard/')?>js/plugins/forms/selects/select2.min.js"></script>

<form class="form-horizontal" action="pelanggaran_siswa/simpan_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">
			<fieldset>
	            
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
	              <label class="col-lg-3 control-label">Uraian pelanggaran</label>
	              <div class="col-lg-4">
	              	<textarea class="form-control" name="uraian_pelanggaran" placeholder="Input here......"></textarea>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Poin</label>
	              <div class="col-lg-4">
	              	<select data-placeholder="Pilih Poin Pelanggaran" name="idpoinpelanggaran_fk" class="select poinpelanggaran">
                     
                    </select>
	              </div>
	            </div>
	            <button class="btn btn-success" type="submit">Simpan</button>
            </fieldset>	
		</div>
	</div>
</div>
</form>