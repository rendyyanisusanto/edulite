<table class="table table-framed">
	<thead>
		<tr>
			<th>No</th>
			<th>Guru</th>
			<th>Check In</th>
			<th>Check Out</th>
		</tr>
	</thead>
	<tbody>
		<?php $no = 0; ?>
		<?php foreach ($data_get['presensi'] as $key => $value): ?>
			<tr>
				<td><?php echo ++$no ?></td>
				<td><?php echo $value['guru']['nama']; ?></td>
				<td><?php echo (!empty($value['presensi']['jam_masuk'])) ? (($value['presensi']['jam_masuk'] == '00:00:00') ? '<b class="icon-close2 text-danger"></b>': '<b class="text-success">'.$value['presensi']['jam_masuk'].'</b>') : '<b class="icon-close2 text-danger"></b>' ?></td>
				<td><?php echo (!empty($value['presensi']['jam_keluar'])) ? (($value['presensi']['jam_keluar'] == '00:00:00') ? '<b class="icon-close2 text-danger"></b>': '<b class="text-success">'.$value['presensi']['jam_keluar'].'</b>') : '<b class="icon-close2 text-danger"></b>' ?></td>
			</tr>
		<?php endforeach ?>
	</tbody>
</table>