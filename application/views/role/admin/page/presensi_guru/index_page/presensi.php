<table class="table table-framed">
	<thead>
		<tr>
			<th>No</th>
			<th>Guru</th>
			<th>Check In</th>
			<th>Check Out</th>
			<th>Status Hari</th>
		</tr>
	</thead>
	<tbody>
		<?php $no = 0; ?>
		<?php foreach ($data_get['presensi'] as $key => $value): ?>
			<tr>
				<td><?= ++$no ?></td>
				<td><?= $value['guru']['nama']; ?></td>
				<td>
					<?= (!empty($value['presensi']['jam_masuk']) && $value['presensi']['jam_masuk'] != '00:00:00') 
						? '<b class="text-success">' . $value['presensi']['jam_masuk'] . '</b>' 
						: '<b class="icon-close2 text-danger"></b>' ?>
				</td>
				<td>
					<?= (!empty($value['presensi']['jam_keluar']) && $value['presensi']['jam_keluar'] != '00:00:00') 
						? '<b class="text-success">' . $value['presensi']['jam_keluar'] . '</b>' 
						: '<b class="icon-close2 text-danger"></b>' ?>
				</td>
				<td>
					<?php
						$status_hari = $value['status_hari'] ?? '-';
						if (strpos($status_hari, 'Libur') !== false) {
							echo '<span class="badge badge-warning">' . $status_hari . '</span>';
						} else {
							echo '<span class="badge badge-success">' . $status_hari . '</span>';
						}
					?>
				</td>
			</tr>
		<?php endforeach ?>
	</tbody>
</table>
