<div id="modal_add_tanggungan" class="modal" tabindex="-1">
	<form class="form-horizontal" action="Tanggungan_alumni/simpan_data" id="app-submit-modal" method="POST">
	<div class="modal-dialog  modal-md">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h5 class="modal-title">Tambah Tanggungan</h5>
			</div>
			<div class="modal-body">
				<input type="hidden" class="id_alumni" name="id_alumni" value="<?= $data_get['alumni']['id_alumni'] ?>">
				<label>Keterangan</label>
				<input type="text" class="form-control" required="" name="keterangan">
				<br>
				<label>Jumlah</label>
				<input type="number" class="form-control" required="" name="jumlah">
				<br>
				<b>Akun Jurnal Tanggungan :</b>
				<br>
				<div class="form-group">
	              <label class="col-lg-3 control-label">Kas</label>
	              <div class="col-lg-8">
	              	<select class="form-control" name="kas">
	              	<?php foreach ($data_get['kas'] as $key => $value): ?>
	              		<option value="<?php echo $value['id_akun'] ?>"><?php echo $value['nama'] ?></option>
	              	<?php endforeach ?>
	              	</select>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Pendapatan</label>
	              <div class="col-lg-8">

	              	<select class="form-control" name="pendapatan">
	              	<?php foreach ($data_get['pendapatan'] as $key => $value): ?>
	              		<option value="<?php echo $value['id_akun'] ?>"><?php echo $value['nama'] ?></option>
	              	<?php endforeach ?>
	              	</select>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Diskon</label>
	              <div class="col-lg-8">

	              	<select class="form-control" name="diskon">
	              	<?php foreach ($data_get['diskon'] as $key => $value): ?>
	              		<option value="<?php echo $value['id_akun'] ?>"><?php echo $value['nama'] ?></option>
	              	<?php endforeach ?>
	              	</select>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Piutang</label>
	              <div class="col-lg-8">

	              	<select class="form-control" name="piutang">
	              	<?php foreach ($data_get['piutang'] as $key => $value): ?>
	              		<option value="<?php echo $value['id_akun'] ?>"><?php echo $value['nama'] ?></option>
	              	<?php endforeach ?>
	              	</select>
	              </div>
	            </div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
				<button type="submit" class="btn btn-primary">Save changes</button>
			</div>
		</div>
	</div>
	</form>
</div>


<div id="modal_edit_tanggungan" class="modal" tabindex="-1">
	<form class="form-horizontal" action="Tanggungan_alumni/update_data" id="app-submit-update" method="POST">
	<div class="modal-dialog  modal-md">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h5 class="modal-title">Edit Tanggungan</h5>
			</div>
			<div class="modal-body">
				<input type="hidden" name="id" class="id_tanggungan_alumni">
				<input type="hidden" class="id_alumni" name="id_alumni" value="<?= $data_get['alumni']['id_alumni'] ?>">
				<label>Keterangan</label>
				<input type="text" class="form-control keterangan" required="" name="keterangan">
				<br>
				<label>Jumlah</label>
				<input type="number" class="form-control jumlah" required="" name="jumlah">
				<br>
				<b>Akun Jurnal Tanggungan :</b>
				<br>
				<div class="form-group">
	              <label class="col-lg-3 control-label">Kas</label>
	              <div class="col-lg-8">
	              	<select class="form-control kas" name="kas">
	              	<?php foreach ($data_get['kas'] as $key => $value): ?>
	              		<option value="<?php echo $value['id_akun'] ?>"><?php echo $value['nama'] ?></option>
	              	<?php endforeach ?>
	              	</select>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Pendapatan</label>
	              <div class="col-lg-8">

	              	<select class="form-control pendapatan" name="pendapatan">
	              	<?php foreach ($data_get['pendapatan'] as $key => $value): ?>
	              		<option value="<?php echo $value['id_akun'] ?>"><?php echo $value['nama'] ?></option>
	              	<?php endforeach ?>
	              	</select>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Diskon</label>
	              <div class="col-lg-8">

	              	<select class="form-control diskon" name="diskon">
	              	<?php foreach ($data_get['diskon'] as $key => $value): ?>
	              		<option value="<?php echo $value['id_akun'] ?>"><?php echo $value['nama'] ?></option>
	              	<?php endforeach ?>
	              	</select>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Piutang</label>
	              <div class="col-lg-8">

	              	<select class="form-control piutang" name="piutang">
	              	<?php foreach ($data_get['piutang'] as $key => $value): ?>
	              		<option value="<?php echo $value['id_akun'] ?>"><?php echo $value['nama'] ?></option>
	              	<?php endforeach ?>
	              	</select>
	              </div>
	            </div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
				<button type="submit" class="btn btn-primary">Save changes</button>
			</div>
		</div>
	</div>
	</form>
</div>


<script type="text/javascript">
	
</script>