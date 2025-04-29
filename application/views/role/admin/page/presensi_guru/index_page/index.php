
<div class="row">
	<div class="col-md-4">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-body">
					<form class="form-horizontal" action="Presensi_guru/simpan_data" id="app-submit" method="POST">
						<div class="form-group">
			              <label class="col-lg-3 control-label">Guru</label>
			              <div class="col-lg-9">
			              	<select class="form-control" name="idguru_fk">
			              		<?php foreach ($data_get['guru'] as $key => $value): ?>
			              			<option value="<?php echo $value['id_guru'] ?>"><?php echo $value['nama'] ?></option>
			              		<?php endforeach ?>
			              	</select>
			              </div>
			            </div>

						<div class="form-group">
			              <label class="col-lg-3 control-label">Tanggal</label>
			              <div class="col-lg-9">
			              	<input type="date" class="form-control" value="<?php echo date('Y-m-d') ?>" name="tanggal" required placeholder="Input here......">
			              </div>
			            </div>

			            <div class="form-group">
			              <label class="col-lg-3 control-label">Pukul</label>
			              <div class="col-lg-9">
			              	<input type="time" class="form-control" name="pukul" required placeholder="Input here......">
			              </div>
			            </div>

			            <div class="form-group">
			              <label class="col-lg-3 control-label">Status</label>
			              <div class="col-lg-9">
			              	<select class="form-control" name="status">
			              		<option value="0">Masuk</option>
			              		<option value="1">Pulang</option>
			              	</select>
			              </div>
			            </div>
			            <hr>
			            <button type="submit" class="btn btn-success"><i class="icon-floppy-disk"></i> Simpan Data</button>

					</form>
				</div>
			</div>
		</div>
		
	</div>
	<div class="col-md-8">
		<div class="panel panel-body ">
			<div class="panel-guru"></div>
		</div>
	</div>
</div>