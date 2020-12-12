<script src="<?php echo base_url('include/template/limitless/')?>/global_assets/js/plugins/forms/selects/select2.min.js"></script>
<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/simpan_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">
			<fieldset>
	            
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Tahun Ajaran</label>
	              <div class="col-lg-4">
	              	<select class="select" name="idtahunajaran_fk">
	              		<option value="">Pilih</option>
		              	<?php foreach ($data_get['tahun_ajaran'] as $key => $value): ?>
		              		<option <?php echo ($value['is_active'] == 1 ) ? 'selected':''; ?> value="<?php echo $value['id_tahun_ajaran'] ?>"><?php echo $value['tahun_ajaran'] ?></option>
		              	<?php endforeach ?>
	              	</select>
	              </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Tingkat</label>
	              <div class="col-lg-4">
	              	<select class="select" name="idtingkat_fk">
	              		<option value="">Pilih</option>
		              	<?php foreach ($data_get['tingkat'] as $key => $value): ?>
		              		<option value="<?php echo $value['id_tingkat'] ?>"><?php echo $value['tingkat'] ?></option>
		              	<?php endforeach ?>
	              	</select>
	              </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Jurusan</label>
	              <div class="col-lg-4">
	              	<select class="select" name="idjurusan_fk">
	              		<option value="">Pilih</option>
		              	<?php foreach ($data_get['jurusan'] as $key => $value): ?>
		              		<option value="<?php echo $value['id_jurusan'] ?>"><?php echo $value['jurusan'] ?></option>
		              	<?php endforeach ?>
	              	</select>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Nama Kelas:</label>
	              <div class="col-lg-9">
	                <input type="text" name="kelas" class="form-control" required placeholder="Input here......">
	              </div>
	            </div>
	            <button class="btn btn-success" type="submit">Simpan</button>
            </fieldset>	
		</div>
	</div>
</div>
</form>