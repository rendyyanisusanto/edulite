<script src="<?php echo base_url('include/template/dashboard/')?>js/plugins/forms/selects/select2.min.js"></script>
<div class="row">
	<div class="col-md-12">
		<center>
			<h4 style="font-weight: bold;">Kelulusan Kelas</h4>
		</center>
	</div>
	<div class="col-md-6">
		<div class="panel panel-body">
			<label>Tingkat</label>
			<select class="select select_class_tingkat" name="tingkat">
				<?php foreach ($data_get['tingkat'] as $value): ?>
					<option value="<?= $value['id_tingkat'] ?>"><?= $value['tingkat'] ?></option>
				<?php endforeach ?>
			</select>
			<br>
			<label>Jurusan</label>
			<select class="select select_class_jurusan" name="jurusan">
				<option value="">-- Pilih --</option>
				<?php foreach ($data_get['jurusan'] as $value): ?>
					<option value="<?= $value['id_jurusan'] ?>"><?= $value['jurusan'] ?></option>
				<?php endforeach ?>
			</select>
			<br>
			<label>Pilih Kelas Asal</label>
			<div class="select_kelas">
				<select class="select_class select" name="kelas">
					<option value="">-- Pilih --</option>
				</select>
			</div>
		</div>
	</div>
	<div class="col-md-6">
		<div class="alert alert-info">
			<b>Info !</b> Siswa yang telah diluluskan maka secara otomatis akan masuk ke data alumni. dan data tanggungan akan tetap dapat diproses pada halaman tanggungan alumni
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body kelas_asal">
			<div class="alert alert-info"><b>Info</b> : Pilih kelas asal</div>
		</div>
	</div>
</div>