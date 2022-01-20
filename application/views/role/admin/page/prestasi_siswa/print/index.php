<!DOCTYPE html>
<html>
	<head>
		<title></title>
	</head>
	<body onload="print();">
		<center><h2><b>Cetak Prestasi Siswa</b></h2></center>
		<br>
		<table border="1" width="100%">
			<thead>
				<tr>
					<th width="10%">id</th>
					<th width="20%">NIS</th>
					<th width="20%">Nama</th>
					<th>Prestasi</th>
					<th>Lomba</th>
					<th>Tahun</th>
					<th>Jenis</th>

				</tr>
			</thead>
			<tbody>
				<?php foreach ($prestasi_siswa as $key => $value): ?>
					<tr>
						<td><?php echo $value['id_prestasi_siswa'] ?></td>
						<td><?php echo $value['nis_siswa'] ?></td>
						<td><?php echo $value['nama_siswa'] ?></td>
						<td><?php echo $value['prestasi'] ?></td>
						<td><?php echo $value['lomba'] ?></td>
						<td><?php echo $value['tahun'] ?></td>
						<td><?php echo $value['jenis_perlombaan'] ?></td>
					</tr>
				<?php endforeach ?>
			</tbody>
			
		</table>
	</body>
</html>