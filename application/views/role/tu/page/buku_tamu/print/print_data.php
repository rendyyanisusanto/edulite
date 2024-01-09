<!DOCTYPE html>
<html>
	<head>
		<title></title>
		<style type="text/css">
			table tr td{
				padding-left: 2%;
			}
		</style>
	</head>
	<body onload="print();">
		<center><h2><b><?= $template_buku_tamu['title'] ?></b></h2></center>
		<br>
		<?= $template_buku_tamu['header'] ?>
		<br>
		<table border="0" width="80%" >
			<tr>
				<td width="40%">Tanggal</td>
				<td width="4%">:</td>
				<td><?= $buku_tamu['tanggal'] ?></td>
			</tr>
			<tr>
				<td>Nama</td>
				<td width="4%">:</td>
				<td><?= $buku_tamu['nama'] ?></td>
			</tr>
			<tr>
				<td>Alamat</td>

				<td width="4%">:</td>
				<td><?= $buku_tamu['alamat'] ?></td>
			</tr>
			<tr>
				<td>Instansi/Organisasi/Jabatan</td>
				
				<td width="4%">:</td>
				<td><?= $buku_tamu['jabatan'] ?></td>
			</tr>
			<tr>
				<td>Keperluan</td>
				
				<td width="4%">:</td>
				<td><?= $buku_tamu['keperluan'] ?></td>
			</tr>
			<tr>
				<td>Saran</td>
				
				<td width="4%">:</td>
				<td><?= $buku_tamu['saran'] ?></td>
			</tr>
		</table>

		<?= $template_buku_tamu['footer'] ?>
	</body>
</html>