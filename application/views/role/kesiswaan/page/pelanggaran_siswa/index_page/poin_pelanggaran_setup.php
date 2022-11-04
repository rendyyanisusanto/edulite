<script src="<?php echo base_url('include/template/limitless/')?>global_assets/js/plugins/tables/datatables/datatables.min.js"></script>

<div class="row">
	<form class="form-horizontal" action="pelanggaran_siswa/simpan_poin" id="app-submit" method="POST">
	<div class="col-md-4">
		<div class="panel panel-body">
				<h4 class="title-poin" style="font-weight: bold;text-align: center;">Tambah Poin Pelanggaran</h4>
				<hr>
				<fieldset>
					<input type="hidden" name="id" class="id">
		            <div class="form-group">
		              <label class="col-lg-3 control-label">Kode</label>
		              <div class="col-lg-9">
		              	<input type="text" class="form-control kode_pelanggaran" name="kode_pelanggaran" required placeholder="Input here......">
		              </div>
		            </div>
		            <div class="form-group">
		              <label class="col-lg-3 control-label">Nama</label>
		              <div class="col-lg-9">
		              	<input type="text" class="form-control nama_pelanggaran" name="nama_pelanggaran" required placeholder="Input here......">
		              </div>
		            </div>
		            <div class="form-group">
		              <label class="col-lg-3 control-label">Poin</label>
		              <div class="col-lg-9">
		              	<input type="number" class="form-control poin" name="poin" required placeholder="Input here......">
		              </div>
		            </div>
		           	<div class="form-group">
		              <label class="col-lg-3 control-label">Jenis</label>
		              <div class="col-lg-9">
		              	<select class="form-control idjenispelanggaran_fk" name="idjenispelanggaran_fk">
		              		<option value="">Pilih Jenis Pelanggaran</option>
		              		<?php foreach ($data_get['jenis_pelanggaran'] as $key => $value): ?>
		              			<option value="<?php echo $value['id_jenis_pelanggaran'] ?>"><?php echo $value['jenis_pelanggaran'] ?></option>
		              		<?php endforeach ?>
		              	</select>
		              </div>
		            </div>
		            <div class="form-group">
		              <label class="col-lg-3 control-label">Kategori</label>
		              <div class="col-lg-9">
		              	<input type="radio" name="kategori_pelanggaran" checked="" value="RINGAN"> RINGAN <br>
		              	<input type="radio" name="kategori_pelanggaran" value="SEDANG"> SEDANG <br>
		              	<input type="radio" name="kategori_pelanggaran" value="BERAT"> BERAT
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
	              <th>Kode</th>
	              <th>Nama</th>
	              <th>Pelanggaran</th>
	              <th width="1%">Poin</th>
	              <th width="10%">Kategori</th>
	              <th width="1%">#</th>
	              <th width="1%">#</th>
	            </tr>
	          </thead>
	        </table>
	        </div>
		</div>
	</div>
</div>