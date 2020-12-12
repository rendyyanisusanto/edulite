<div class="row">
	<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/simpan_data" id="app-submit" method="POST">
		<div class="panel panel-body">
			<fieldset>
				<div class="form-group">
					<label class="col-lg-3 control-label">Nama:</label>
					<div class="col-lg-9">
						<input type="text" name="nama" value="<?php echo $data_get['guru']['nama'] ?>" class="form-control" required placeholder="Input here......">
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-3 control-label">NIP:</label>
					<div class="col-lg-9">
						<input type="text" name="nip" value="<?php echo $data_get['guru']['nip'] ?>" class="form-control" required placeholder="Input here......">
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-3 control-label">Alamat:</label>
					<div class="col-lg-9">
						<input type="text" name="alamat" value="<?php echo $data_get['guru']['alamat'] ?>" class="form-control" required placeholder="Input here......">
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-3 control-label">Agama:</label>
					<div class="col-lg-9">
						<select class="form-control" name="agama">
							<option value="">-- Pilih Agama --</option>
							<option value="Islam">Islam</option>
							<option value="Kristen">Kristen</option>
							<option value="Hindu">Hindu</option>
						</select>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-lg-3 control-label">Pendidikan Terakhir:</label>
					<div class="col-lg-9">
						<select class="form-control" name="pendidikan_terakhir">
							<option value="">-- Pilih Pendidikan Terakhir --</option>
							<option <?php echo $data_get['guru']['pendidikan_terakhir'] == 'SD' ?> value="SD">SD</option>
							<option <?php echo $data_get['guru']['pendidikan_terakhir'] == 'SMP' ?> value="SMP">SMP</option>
							<option <?php echo $data_get['guru']['pendidikan_terakhir'] == 'SMA/SMK' ?> value="SMA/SMK">SMA/SMK</option>
							<option <?php echo $data_get['guru']['pendidikan_terakhir'] == 'D' ?> value="D">D1/D2/D3 - Diploma</option>
							<option <?php echo $data_get['guru']['pendidikan_terakhir'] == 'S1' ?> value="S1">S1 - Sarjana</option>
							<option <?php echo $data_get['guru']['pendidikan_terakhir'] == 'S2' ?> value="S2">S2 - Magister</option>
							<option <?php echo $data_get['guru']['pendidikan_terakhir'] == 'S3' ?> value="S3">S3 - Doktor</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-3 control-label">Instansi Pendidikan:</label>
					<div class="col-lg-9">
						<input type="text" value="<?php echo $data_get['guru']['instansi'] ?>" name="instansi" class="form-control" required placeholder="Input here......">
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-3 control-label">Facebook:</label>
					<div class="col-lg-9">
						<input type="text" value="<?php echo $data_get['guru']['fb'] ?>" name="fb" class="form-control" required placeholder="Input here......">
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-3 control-label">Instagram:</label>
					<div class="col-lg-9">
						<input type="text" value="<?php echo $data_get['guru']['ig'] ?>" name="ig" class="form-control" required placeholder="Input here......">
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-3 control-label">Youtube:</label>
					<div class="col-lg-9">
						<input type="text" value="<?php echo $data_get['guru']['youtube'] ?>" name="youtube" class="form-control" required placeholder="Input here......">
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-3 control-label">Twitter:</label>
					<div class="col-lg-9">
						<input type="text" value="<?php echo $data_get['guru']['twitter'] ?>" name="twitter" class="form-control" required placeholder="Input here......">
					</div>
				</div>
			</fieldset>

			<br>
			<button class="btn btn-success" type="submit"><i></i> Simpan</button>
		</div>
	</form>
</div>