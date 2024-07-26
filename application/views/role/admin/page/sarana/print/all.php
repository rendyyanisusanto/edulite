
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/paper-css/0.3.0/paper.css">
		
	</head>
	<body onload="print()" >
		<style type="text/css">
		.table-nota {
			border: 1px solid black;
			border-collapse: collapse;
			padding: 10px;
			margin-top: 1%;
		}
		.table-nota thead tr th {
			padding: 10px;
			text-align: center;
			border: 1px solid black;
			border-collapse: collapse;
			font-weight: bold;
			font-size: 16px;
		}
		.table-nota tbody tr td {
			border-left: 1px solid black;
/*			border-bottom: 1px solid black;*/
			padding-left: 1%;
			font-size: 16px;
		}
		@media print {
		.table-nota {
		height: 100%;
		max-width: 100%;
		}
		}
		</style>
		<section class="sheet padding-10mm">
			<center><h2><b>Inventaris Barang</b></h2></center>
		<br>
		<table class="table-nota " width="100%">
			<thead>
				<tr>
					<th rowspan="2" width="2%">No</th>
					<th rowspan="2" width="10%">Kode</th>
					<th rowspan="2" width="20%">Nama</th>
					<th rowspan="2" width="10%">Jumlah</th>
					<th rowspan="2" width="10%">Tahun Pengadaan</th>
					<!-- <th rowspan="2" width="20%">Ruangan</th> -->
					<th colspan="2">Kondisi</th>
				</tr>
				<tr>
					<?php foreach ($kondisi_sarana as $key => $value): ?>
						<td width="10%" style="border: 1px solid black;font-weight: bold;text-align:center !important;"><?php echo ucfirst($value['kondisi_sarana']) ?></td>
					<?php endforeach ?>
				</tr>
			</thead>
			<tbody>
				<?php 
				$no = 0;
				foreach ($sarana as $key => $value): ?>
					<tr>
						<td><?php echo ++$no; ?></td>
						<td><?php echo $value['no_inventaris'] ?></td>
						<td><?php echo strtoupper($value['sarana']) ?></td>
						<td style="text-align:center;"><?php echo $value['jumlah'] ?></td>
						<td style="text-align:center;"><?php echo $value['tahun_pengadaan'] ?></td>
						<!-- <td style="text-align:center;"><?php echo $value['ruang'] ?></td> -->
						<?php foreach ($kondisi_sarana as $key => $value_sarana): ?>
							<td style="text-align:center !important;"><?php echo ($value['idkondisisarana_fk']==$value_sarana['id_kondisi_sarana']) ? "√" : "" ?></td>
						<?php endforeach ?>
					</tr>
				<?php endforeach ?>
			</tbody>
			
		</table>
</section>
	</body>
</html>