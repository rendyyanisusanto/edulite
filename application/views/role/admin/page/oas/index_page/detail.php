
<script src="<?php echo base_url('include/template/limitless/')?>global_assets/js/plugins/forms/styling/uniform.min.js"></script>

<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/simpan_data" id="app-submit" method="POST">
<div class="row">

	<div class="col-md-8">
		<div class="panel panel-body">
			<div class="form-group">
              <label class="col-lg-3 control-label">Kode Ujian:</label>
              <div class="col-lg-9">
              	<input type="hidden" class="id_oas" value="<?php echo $data_get['oas']['id_oas'] ?>" name="id_oas">
                <input type="text" name="kode" class="form-control" value="<?php echo $data_get['oas']['kode'] ?>" required placeholder="Input here......">
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-3 control-label">Keterangan:</label>
              <div class="col-lg-9">
                <input type="text" name="keterangan" value="<?php echo $data_get['oas']['keterangan'] ?>" class="form-control" required placeholder="Input here......">
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-3 control-label">Mata Pelajaran:</label>
              <div class="col-lg-9">
              	<select class="form-control" name="idmapel_fk">
              		<?php foreach ($data_get['mata_pelajaran'] as $key => $value): ?>
              			<option value="<?php echo $value['id_mata_pelajaran'] ?>"><?php echo $value['mata_pelajaran'] ?></option>
              		<?php endforeach ?>
              	</select>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-3 control-label">Tanggal:</label>
              <div class="col-lg-4">
                <input type="date" name="tanggal_mulai" value="<?php echo $data_get['oas']['tanggal_mulai'] ?>" class="form-control" required placeholder="Input here......">
              </div>
              <label class="col-lg-1 control-label">s/d</label>
              <div class="col-lg-4">
                <input type="date" name="tanggal_selesai" value="<?php echo $data_get['oas']['tanggal_selesai'] ?>" class="form-control" required placeholder="Input here......">
              </div>
            </div>
		</div>
	</div>
	<div class="col-md-4">
		<div class="panel panel-head panel-body">
			<label>Pilih Kelas </label>
			<br>
			<?php foreach ($data_get['kelas_oas'] as $key => $value): ?>
			<div class="col-md-6">
				<div class="checkbox">
					<label>
						<input type="checkbox" <?php echo (!empty($value['id_oas_kelas'])) ? 'checked' :''; ?> value="<?php echo $value['id_kelas'] ?>" name="idkelas_fk[]" class="control-primary">
						<?php echo $value['kelas'] ?>
					</label>
				</div>
			</div>
			<?php endforeach ?>
		</div>
	</div>

</div>
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">
			<center><h3><b><u>Soal Ujian</u></b></h3></center>
			
			<br>
			<button class="btn btn-success btn-sm" type="button">1. Tambah Soal Manual</button>
			<button class="btn btn-warning btn-sm btn-bank-soal" type="button">2. Bank Soal</button>
			<button class="btn btn-primary btn-sm" type="button">3. Import Soal</button>
			<hr>

			<table class="table table-xxs table-bordered table-framed table-soal">
				<thead>
					<tr>
						<th width="1%">#</th>
						<th width="10%">Kode</th>
						<th>Soal</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">
			<button class="btn btn-success btn-submit" type="submit"><i class="icon-floppy-disk"></i> Update OAS</button>
		</div>
	</div>
</div>
</form>