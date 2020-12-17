<script src="<?php echo base_url('include/template/limitless/')?>global_assets/js/plugins/tables/datatables/datatables.min.js"></script>

<div class="row">
	<form class="form-horizontal" action="pelanggaran_siswa/simpan_poin" id="app-submit" method="POST">
	<div class="col-md-4">
		<div class="panel panel-body">
			
				<fieldset>
		            <div class="form-group">
		              <label class="col-lg-3 control-label">Kode</label>
		              <div class="col-lg-9">
		              	<input type="text" class="form-control" name="kode_pelanggaran" required placeholder="Input here......">
		              </div>
		            </div>
		            <div class="form-group">
		              <label class="col-lg-3 control-label">Nama</label>
		              <div class="col-lg-9">
		              	<input type="text" class="form-control" name="nama_pelanggaran" required placeholder="Input here......">
		              </div>
		            </div>
		            <div class="form-group">
		              <label class="col-lg-3 control-label">Poin</label>
		              <div class="col-lg-9">
		              	<input type="number" class="form-control" name="poin" required placeholder="Input here......">
		              </div>
		            </div>
		           	<div class="form-group">
		              <label class="col-lg-3 control-label">Jenis</label>
		              <div class="col-lg-9">
		              	<select class="form-control" name="idjenispelanggaran_fk">
		              		<?php foreach ($data_get['jenis_pelanggaran'] as $key => $value): ?>
		              			<option value="<?php echo $value['id_jenis_pelanggaran'] ?>"><?php echo $value['jenis_pelanggaran'] ?></option>
		              		<?php endforeach ?>
		              	</select>
		              </div>
		            </div>
		            <button class="btn btn-success" type="submit">Simpan</button>
		        </fieldset>
			
		</div>
	</div>
	</form>
	<div class="col-md-8">
		<div class="panel panel-body panel-pelanggaran">
			<div class="table-responsive">
	        <table class="table" width="100%" id="tabel-data">
	          <thead>
	            <tr>
	              <th width="1%">#</th>
	              <th>Tanggal</th>
	              <th>Nama</th>
	              <th>Pelanggaran</th>
	              <th>Poin</th>
	            </tr>
	          </thead>
	        </table>
	        </div>
		</div>
	</div>
</div>