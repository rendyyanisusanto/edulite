<script src="<?php echo base_url('include/template/limitless/')?>global_assets/js/plugins/tables/datatables/datatables.min.js"></script>

<div class="row">
	<form class="form-horizontal" action="pelanggaran_siswa/simpan_jenis_pelanggaran" id="app-submit" method="POST">
	<div class="col-md-4">
		<div class="panel panel-body">
				<h4 class="title-poin" style="font-weight: bold;text-align: center;">Tambah Jenis Pelanggaran</h4>
				<hr>
				<fieldset>
					<input type="hidden" name="id" class="id">
		            <div class="form-group">
		              <label class="col-lg-3 control-label">Nama</label>
		              <div class="col-lg-9">
		              	<input type="text" class="form-control jenis_pelanggaran" name="jenis_pelanggaran" required placeholder="Input here......">
		              </div>
		            </div>
		            
		            <button class="btn btn-submit btn-success" type="submit"><i class="icon-floppy-disk"></i> Simpan</button>
		            <button class="btn btn-batal btn-danger" type="button" style="display: none;"><i class="icon-close2"></i> Batal</button>
		        </fieldset>
			
		</div>
	</div>
	</form>
	<div class="col-md-8">
		<div class="panel panel-body panel-pelanggaran">
			<b>Data Poin : </b>
			<hr>
			<div class="table-responsive">
	        <table class="table table-xxs table-framed" width="100%" id="tabel-data">
	          <thead>
	            <tr>
	              <th width="1%">#</th>
	              <th>Jenis Pelanggaran</th>
	              <th width="1%">#</th>
	              <th width="1%">#</th>
	            </tr>
	          </thead>
	        </table>
	        </div>
		</div>
	</div>
</div>