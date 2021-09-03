<div class="panel panel-body">
	<table class="table table-framed table-bordered">
		<thead>
			<tr>
				<th>Tanggal</th>
				<th>Siswa</th>
				<th>Pelanggaran</th>
			</tr>
		</thead>
		<tbody>
			<?php foreach ($data_get['pelanggaran'] as $key => $value): ?>
				<tr>
					<td><?php echo $value['tanggal'] ?></td>
					<td><?php echo $value['nama_siswa'] ?></td>
					<td><?php echo $value['uraian_pelanggaran'] ?></td>
				</tr>
			<?php endforeach ?>
		</tbody>
	</table>
</div>