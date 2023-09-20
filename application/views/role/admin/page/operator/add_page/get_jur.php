<div class="form-group">
	              <label class="col-lg-3 control-label">Tingkat</label>
	              <div class="col-lg-4">
	              	<select class="form-control" required="" name="idtingkat_fk">
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
	              	<select class="form-control" required="" name="idjurusan_fk">
	              		<option value="">Pilih</option>
		              	<?php foreach ($data_get['jurusan'] as $key => $value): ?>
		              		<option value="<?php echo $value['id_jurusan'] ?>"><?php echo $value['jurusan'] ?></option>
		              	<?php endforeach ?>
	              	</select>
	              </div>
	            </div>
	            