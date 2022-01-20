<!DOCTYPE html>
<html>
	<head>
		<title></title>
	</head>
	<body onload="print();">
		<center><h2><b>Cetak Surat Masuk</b></h2></center>
		<br>
		<table border="1" width="100%">
			<thead>
				<tr>
					<th width="10%">Kode Arsip</th>
					<th width="20%">Tanggal</th>
					<th width="20%">Pengirim</th>
					<th>Perihal</th>
					<th>No Surat</th>
				</tr>
			</thead>
			<tbody>
				<?php foreach ($surat_masuk as $key => $value): ?>
					<tr>
						<td><?php echo $value['kode_arsip'] ?></td>
						<td><?php echo date_format(date_create($value['tanggal_surat']),'d-m-Y') ?></td>
						<td><?php echo $value['pengirim'] ?></td>
						<td><?php echo $value['perihal'] ?></td>
						<td><?php echo $value['no_surat'] ?></td>
					</tr>
				<?php endforeach ?>
			</tbody>
			
		</table>
	</body>
</html>