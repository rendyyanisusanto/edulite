<center><h2><b>Kelas Tujuan <?= $data_get['kelas']['kelas'] ?></b></h2></center>
<table class="table table-framed table-xxs">
	<thead>
		<tr>
			<th width="1%">No</th>
			<th>NISN</th>
			<th>Siswa</th>
		</tr>
	</thead>
	<tbody>
		<?php $no = 0; ?>
		<?php foreach ($data_get['siswa'] as $value): ?>
			<tr>
				<td><?= ++$no ?></td>
				<td><?= $value['nisn'] ?></td>
				<td><?= $value['nama'] ?></td>
			</tr>
		<?php endforeach ?>
	</tbody>
</table>