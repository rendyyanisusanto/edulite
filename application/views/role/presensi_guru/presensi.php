<table class="table table-framed table-bordered">
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
		<?php foreach ($presensi as $key => $value): ?>
			<tr>
				<td><?php echo ++$no ?></td>
				<td><?php echo $value['guru']['nama']; ?></td>
				<td class="text-center"><?php echo (!empty($value['presensi']['jam_masuk'])) ? (($value['presensi']['jam_masuk'] == '00:00:00') ? '<b class="icon-close2 text-danger"></b>': '<b class="text-success">'.$value['presensi']['jam_masuk'].'</b>') : '<b class="icon-close2 text-danger"></b>' ?></td>
				<td class="text-center"><?php echo (!empty($value['presensi']['jam_keluar'])) ? (($value['presensi']['jam_keluar'] == '00:00:00') ? '<b class="icon-close2 text-danger"></b>': '<b class="text-success">'.$value['presensi']['jam_keluar'].'</b>') : '<b class="icon-close2 text-danger"></b>' ?></td>
			</tr>
		<?php endforeach ?>
	</tbody>
</table>