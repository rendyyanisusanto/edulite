<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>

	<table border="1" width="100%">
		<?php foreach ($data as $key => $value): ?>
			<tr>
				<td><?php echo $value['nama_jadwal_kegiatan_sekolah'] ?></td>
				<td><?php echo $value['tanggal_mulai'] ?></td>
				<td><?php echo $value['tanggal_selesai'] ?></td>
				<td><?php echo $value['keterangan'] ?></td>
			</tr>
		<?php endforeach ?>
	</table>
</body>
</html>