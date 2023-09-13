<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body onload="print();">
	<style type="text/css">
		body{
			padding: 1%;
		}	
	table th,
	table td {
	  padding: .625em;
	  text-align: center;
	}

	table.border {
	  width: 100%;
	  border-collapse: collapse
	}

	table.border thead th, table.border tbody td {
	  border: thin solid #000;
	  padding: 2px
	}
	.title{
		text-align: center;
		font-weight: bold;
		margin-bottom: 2%;
	}
</style>
	<h3 class="title">
		Cetak Data Pemasukan Lain (tanggal : <?= date('d-M-Y') ?>)
	</h3>
	<table class="border">
		<thead>
			<tr>
				<th width="1%">No</th>
				<th>Tanggal</th>
				<th>Kode</th>
				<th>Keterangan</th>
				<th>Total</th>

			</tr>
		</thead>
		<tbody>
			<?php 
			$no = 0;
			foreach ($pemasukan_lain as $value): ?>
				<tr>
					<td><?= ++$no ?></td>
					<td><?= date_format(date_create($value['tanggal']), 'd-M-Y') ?></td>
					<td><?= $value['trans_code'] ?></td>
					<td><?= $value['keterangan'] ?></td>
					<td>Rp. <?= number_format($value['total']) ?></td>
				</tr>
			<?php endforeach ?>
		</tbody>
	</table>
</body>
</html>