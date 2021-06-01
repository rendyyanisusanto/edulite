<!DOCTYPE html>
<html>
	<head>
		<title></title>
	</head>
	<body onload="print();">
		<style type="text/css">
			table, th, td {
				border: 1px solid black;
				border-collapse: collapse;
				}
		</style>

		<style type="text/css" media="print">
		  @page { size: portrait; }
		</style>

		<center><h3><u>Penilaian Kinerja Guru Periode <?php echo date_format(date_create($data_get['periode']), 'm/Y') ?> Tahun Ajaran <?php echo $data_get['tahun_ajaran']['tahun_ajaran'] ?></u></h3></center>
		<table style="border:0; width: 50%;">
			<tr>
				<th style="border:0;text-align: left;padding-left: 50px;">Kode Guru</th>
				<th style="border:0;">:</th>				
				<th style="border:0;text-align: left;padding-left: 50px;"><?php echo $data_get['guru']['nip'] ?></th>
			</tr>
			<tr>
				<th style="border:0;text-align: left;padding-left: 50px;">Nama</th>		
				<th style="border:0;">:</th>		
				<th style="border:0;text-align: left;padding-left: 50px;"><?php echo $data_get['guru']['nama'] ?></th>
			</tr>
			<tr>
				<th style="border:0;text-align: left;padding-left: 50px;">Jabatan</th>		
				<th style="border:0;">:</th>		
				<th style="border:0;text-align: left;padding-left: 50px;"><?php echo $data_get['guru']['jabatan'] ?></th>
			</tr>
			
		</table>
		<table border="1" style="width:100%;margin-top: 1%;">
			<thead>
				<tr class="bg-info">
					<th>No</th>
					<th>Indikator/SubIndikator</th>
					<th>Nilai</th>
				</tr>
			</thead>
			<tbody>
				<?php $cNo = 'A'; ?>
				<?php $vno = 0; ?>
				<?php foreach ($data_get['indikator_pkg'] as $key => $value): ?>
				<?php $no = 0; ?>
				<tr>
					<td colspan="3" style="padding-left: 10px;"><b><?php echo ($cNo++).'. '.$value['kompetensi_pkg']['kompetensi'] ?></b></td>
				</tr>
				<?php foreach ($value['subkompetensi_pkg'] as $key_sub => $value_sub): ?>
				<tr>
					<td style="text-align: center;" class="bg-info"><?php echo ++$no; ?></td>
					<td style="padding-left: 10px;"><?php echo $value_sub['subkompetensi'] ?></td>
					<td style="text-align: center;"><?= $value_sub['nilai'] ?></td>
				</tr>
				<?php $vno ++; ?>
				<?php endforeach ?>
				<?php endforeach ?>
			</tbody>
		</table>
	</body>
</html>