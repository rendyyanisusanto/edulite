<center><h2><b>Kelas Asal <?= $data_get['kelas']['kelas'] ?></b></h2></center>
<table class="table table-framed table-xxs">
	<thead>
		<tr>
			<th>No</th>
			<th>NISN</th>
			<th>Siswa</th>
			<th>Alasan</th>
			<th>#</th>
		</tr>
	</thead>
	<tbody>
		<?php $no = 0; ?>
		<?php foreach ($data_get['siswa'] as $value): ?>
			<tr>
				<td><?= ++$no ?></td>
				<td><?= $value['nisn'] ?></td>
				<td><?= $value['nama'] ?></td>
				<td><input type="text" class="form-control alasan<?= $value['id_siswa'] ?>" name=""></td>
				<td><button type="button" class="btn btn-xs btn-success btn-proc" data-kelas="<?= $data_get['kelas']['kelas'] ?>" data-nama="<?= $value['nama'] ?>" data-id="<?= $value['id_siswa'] ?>"><i class="icon-circle-right2"></i></button></td>
			</tr>
		<?php endforeach ?>
	</tbody>
</table>