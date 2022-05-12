<div class="panel panel-body">
	<table class="table table-bordered table-framed">
		<thead>
			<tr>
				<th width="2%">No</th>
				<th>Guru</th>
				<th width="2%">PK</th>
				<th width="2%">Kum</th>
				<th width="2%">Pres</th>
				<th width="2%">Rekap</th>
			</tr>
		</thead>
		<tbody>
			<?php $no = 0; ?>
			<?php foreach ($data_get['persentase_guru'] as $key => $value): ?>
			<tr>
				<td><?php echo ++$no ?></td>
				<td><a href="Presensi_guru/history/<?php echo $value['guru']['id_guru'] ?>/<?php echo $data_get['bulan'] ?>/<?php echo $data_get['tahun'] ?>" class="app-item"><?php echo $value['guru']['nama'] ?></a></td>
				<td><?php echo (!empty($value['persentase'])) ? $value['persentase']['persentase'] : "";  ?>%</td>
				<td><?php echo $value['kumulatif'] ?></td>
				<td><?php echo $value['presensi_guru'] ?></td>
				<td>
					<?php if (isset($value['persentase']['persentase'])): ?>
						<?php echo ($value['rekap_persentase'] < $value['persentase']['persentase']) ? '<b class="text-danger">'.$value['rekap_persentase'].'</b>' : '<b class="text-success" >'.$value['rekap_persentase'].'</b>' ?>%
					<?php endif ?>
				</td>
			</tr>
			<?php endforeach ?>
		</tbody>
	</table>
</div>