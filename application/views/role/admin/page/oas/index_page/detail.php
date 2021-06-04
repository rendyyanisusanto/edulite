<div class="row">
	<div class="col-md-6">
		<div class="panel panel-head panel-body">
			<label>Pilih Kelas</label>
			<br>

			<select class="form-control kelas_oas">
				<?php foreach ($data_get['kelas_oas'] as $key => $value): ?>
					<option value="<?php echo $value['idkelas_fk'] ?>"><?php echo $value['kelas'] ?></option>
				<?php endforeach ?>
			</select>
			<br>

			<button class="btn btn-success btn-proses" type="button">Proses</button>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-md-12">
		<div class="panel-proses">
			
		</div>
	</div>
</div>