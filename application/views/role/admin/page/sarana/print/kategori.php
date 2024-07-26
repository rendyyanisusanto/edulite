
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
			<center><h2><b>Inventaris Barang (Per Kategori)</b></h2></center>
		<br>
		<table class="table-nota " width="100%">
			<thead>
				<tr>
					<th rowspan="2" width="2%">No</th>
					<th rowspan="2" width="20%">Nama</th>
					<th rowspan="2" width="10%">Jumlah</th>
				</tr>
			</thead>
			<tbody>
				<?php 
				$no = 0;
				foreach ($sarana as $key => $value): ?>
					<tr>
						<td><?php echo ++$no; ?></td>
						<td><?php echo strtoupper($value['kelompok_sarana']) ?></td>
						<td style="text-align:center;"><?php echo (!empty($value['jumlah'])) ? $value['jumlah'] : 0 ?></td>
					</tr>
				<?php endforeach ?>
			</tbody>
			
		</table>
</section>
	</body>
</html>