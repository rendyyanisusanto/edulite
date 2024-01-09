<div class="row">
	<div class="col-md-4">
		<div class="panel panel-body">
			<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/bulk_proses" id="app-submit-proses" method="POST">
				<div class="form-group">
	              <label class="col-lg-3 control-label">Table:</label>
	              <div class="col-lg-9">
	                <select class="form-control table" name="table">
	                  <option value="">Pilih</option>
	                  <option value="siswa">Siswa</option>
	                  <option value="guru">Guru</option>
	                  <option value="operator">Operator</option>
	                </select>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Hak Akses:</label>
	              <div class="col-lg-9">
	                <select class="form-control" required="" name="hak_akses">
	                  <option value="">Pilih Hak Akses</option>
	                  <?php foreach ($data_get['groups'] as $key => $value): ?>
	                    <option value="<?php echo $value['id'] ?>"><?php echo ucfirst($value['name']) ?></option>
	                  <?php endforeach ?>
	                </select>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Kelas:</label>
	              <div class="col-lg-9">
	                <select class="form-control" required="" name="idkelas_fk">
	                  <option value="">Pilih Kelas</option>
	                  <?php foreach ($data_get['kelas'] as $key => $value): ?>
	                    <option value="<?php echo $value['id_kelas'] ?>"><?php echo ucfirst($value['kelas']) ?></option>
	                  <?php endforeach ?>
	                </select>
	              </div>

	            </div>
	            <button type="submit" class="btn btn-block btn-success legitRipple">Proses<i class="icon-floppy-disk position-right"></i></button>
			</form>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/save_bulk_proses" id="app-submit" method="POST">
		<div class="content-proses"></div>
		</form>
	</div>
</div>