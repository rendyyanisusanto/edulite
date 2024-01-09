<!DOCTYPE html>
<html>
	<head>
		<title></title>
		<style type="text/css">
			table {
			  border-collapse: collapse;
			  /*font-family: consolas;*/
			  font-size: 10px;
			}
			table tbody tr td{
				padding-left: 10px;
			}
			table thead{
				text-align: center;
			}
		</style>
	</head>
	<body onload="print();">
		<center><h2><b><?= $template_buku_tamu['title'] ?></b></h2></center>
		<br>
		<?= $template_buku_tamu['header'] ?>
		<br>
		<table border="1" width="100%">
			<thead>
				<tr>
					<th>No</th>
					<th>Nama</th>
					<th>Alamat</th>
					<th>Keperluan</th>
					<th>Tanggal</th>
					<th>Organisasi/Lembaga/Jabatan</th>
					<th>Saran/Keterangan</th>
					<th>Create</th>

				</tr>
			</thead>
			<tbody>
				<?php $no = 0; ?>
				<?php foreach ($buku_tamu as $key => $value): ?>
					<tr>
						<th><?= ++$no ?></th>
						<td><?php echo $value['nama'] ?></td>
						<td><?php echo $value['alamat'] ?></td>
						<td><?php echo $value['keperluan'] ?></td>
						<td><?php echo $value['tanggal'] ?></td>
						<td><?php echo $value['jabatan'] ?></td>
						<td><?php echo $value['saran'] ?></td>
						<td><?php echo $value['create_at'] ?></td>
					</tr>
				<?php endforeach ?>
			</tbody>
			
		</table>

		<?= $template_buku_tamu['footer'] ?>
	</body>
</html>