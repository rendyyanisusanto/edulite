<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
	<h1><center><b>KARTU KENDALI SISWA</b></center></h1>
	<br>
	<br>
	<table border="0" width="100%" style="text-align: left;">
		<tr>
			<th width="10%">Nama</th>
			<th width="2%">:</th>
			<th><?php echo $data_get['siswa']['nama'] ?></th>
		</tr>
		<tr>
			<th width="10%">Kelas</th>
			<th width="2%">:</th>
			<th><?php echo $data_get['siswa']['kelas'] ?></th>
		</tr>
		<tr>
			<th width="10%">Jurusan</th>
			<th width="2%">:</th>
			<th><?php echo $data_get['siswa']['jurusan'] ?></th>
		</tr>
	</table>

	<br>
	<?php foreach ($data_get['pelanggaran'] as $key => $value): ?>
		<?php echo $value['jenis_pelanggaran']['jenis_pelanggaran'] ?>
		<br>
		<table width="100%" style="border: 1px solid black;border-collapse: collapse;">
			<thead>
				<tr >
					<th style="border: 1px solid black;border-collapse: collapse;">No</th>
					<th style="border: 1px solid black;border-collapse: collapse;">Tanggal</th>
					<th style="border: 1px solid black;border-collapse: collapse;">Uraian</th>
					<th style="border: 1px solid black;border-collapse: collapse;">Kode Pelanggaran</th>
					<th style="border: 1px solid black;border-collapse: collapse;">Poin</th>
				</tr>
			</thead>
			<tbody>
				<?php $no = 0; ?>
				<?php foreach ($value['data_pelanggaran_siswa'] as $key => $value2): ?>
					<tr>
						<td style="border: 1px solid black;border-collapse: collapse;padding-left: 5px; "><?php echo (++$no) ?></td>
						<td style="border: 1px solid black;border-collapse: collapse;padding-left: 5px; "><?php echo $value2['tanggal'] ?></td>
						<td style="border: 1px solid black;border-collapse: collapse;padding-left: 5px; "><?php echo $value2['uraian_pelanggaran'] ?></td>
						<td style="border: 1px solid black;border-collapse: collapse;padding-left: 5px; "><?php echo $value2['kode_pelanggaran'] ?></td>
						<td style="border: 1px solid black;border-collapse: collapse;padding-left: 5px; "><?php echo $value2['poin'] ?></td>
					</tr>
				<?php endforeach ?>
			</tbody>
		</table>
		<br>
	<?php endforeach ?>
</body>
</html>