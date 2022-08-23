<center><h2><b>Kelas Asal <?= $data_get['kelas']['kelas'] ?></b></h2></center>
<?php if (!empty($data_get['siswa'])){ ?>

<button data-kelas="<?= $data_get['kelas']['kelas'] ?>" class="btn btn-success btn-all" type="button">Luluskan 1 Kelas</button>
<hr>
<?php } ?>
<table class="table table-framed table-xxs">
	<thead>
		<tr>
			<th>No</th>
			<th>NISN</th>
			<th>Siswa</th>
			<th>#</th>
		</tr>
	</thead>
	<tbody>
		<?php if (!empty($data_get['siswa'])){ ?>
			<?php $no = 0; ?>
			<?php foreach ($data_get['siswa'] as $value): ?>
				<tr>
					<td><?= ++$no ?></td>
					<td><?= $value['nisn'] ?></td>
					<td><?= $value['nama'] ?></td>
					<td><button type="button" class="btn btn-xs btn-success btn-proc" data-kelas="<?= $data_get['kelas']['kelas'] ?>" data-nama="<?= $value['nama'] ?>" data-id="<?= $value['id_siswa'] ?>"><i class="icon-circle-right2"></i></button></td>
				</tr>
			<?php endforeach ?>
		<?php }else{ ?>
		<tr>
			<td colspan="4"><center><b>Tidak ada data</b></center></td>
		</tr>
		<?php } ?>
	</tbody>
</table>