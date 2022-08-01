<script src="<?php echo base_url('include/template/dashboard/')?>js/plugins/forms/selects/select2.min.js"></script>
<div class="row">
	<div class="col-md-12">
		<center>
			<h4 style="font-weight: bold;">Pindah Kelas</h4>
		</center>
	</div>
	<div class="col-md-8">
		<div class="panel panel-body">
			<label>Pilih Kelas Asal</label>
			<select class="select_class" name="kelas">
				<option value="">-- Pilih --</option>
				<?php foreach ($data_get['kelas'] as $value): ?>
					<option value="<?= $value['id_kelas'] ?>"><?= $value['kelas'] ?></option>
				<?php endforeach ?>
			</select>
		</div>
	</div>
	<div class="col-md-4">
		<div class="panel panel-body">
			<label>Pilih Kelas Tujuan</label>
			<select class="select_class_tujuan" name="kelas_tujuan">
				<option value="">-- Pilih --</option>
				<?php foreach ($data_get['kelas'] as $value): ?>
					<option value="<?= $value['id_kelas'] ?>"><?= $value['kelas'] ?></option>
				<?php endforeach ?>
			</select>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-8">
		<div class="panel panel-body kelas_asal">
			<div class="alert alert-info"><b>Info</b> : Pilih kelas asal</div>
		</div>
	</div>
	<div class="col-md-4">
		<div class="panel panel-body kelas_tujuan">
			<div class="alert alert-info"><b>Info</b> : Pilih kelas tujuan</div>
		</div>
	</div>
</div>