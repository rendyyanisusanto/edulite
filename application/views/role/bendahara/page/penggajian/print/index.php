<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/paper-css/0.3.0/paper.css">
		<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@500&display=swap" rel="stylesheet">
		<style>@page { size: A5 landscape; }</style>
	</head>
	<body class="A5 landscape" );">
		<style type="text/css">
			.text-green {
				/*color: #218c74;*/
				font-family: 'Roboto', sans-serif;
			}
		.table-nota {
			border-collapse: collapse;
		}
		.table-nota tr {
			border-bottom: 1px solid green;
			border-collapse: collapse;
			/*font-weight: bold;*/
			font-family: 'Roboto', sans-serif;
			font-size: 15px;
			/*color: #3d3d3d;*/
		}
		.bg{
			background-image: url("<?= base_url('include/media/logo_new.png');?>"); /* The image used */
		  /*background-color: #cccccc;  Used if the image is unavailable */
		  background-position: center; /* Center the image */
		  background-repeat: no-repeat; /* Do not repeat the image */
		  background-size: 60%;   
		  /*opacity: .5;*/
		}
		@media print {
		.table-nota {
		height: 100%;
		width: 100%;
		}
		}
		</style>
		<section class="sheet padding-10mm ">
			<center>
			<h4 class="text-green"><b>Kwitansi/Slip HR Bulan <?= $bulan ?>/<?= $tahun ?></b></h4>
			</center>
			<?php $total = 0; ?>
			<table width="100%" style="margin-bottom: 1%">
				<tr>
					<td width="20%" class="text-green">Kode</td>
					<td width="1%">:</td>
					<td class="text-green"><?= $guru['kode_pegawai'] ?></td>
				</tr>
				<tr>
					<td  class="text-green" width="20%">Nama</td>
					<td width="1%">:</td>
					<td class="text-green" ><?= $guru['nama'] ?></td>
				</tr>
			</table>

			<b class="text-green" >HR :</b>
			<table width="100%" class="table-nota" style="margin-top: 1%;margin-bottom: 1%;">
				<?php foreach ($detail_komponen_penggajian_deb as $value): ?>
					<tr>
						<td><?= $value['komponen_penggajian'] ?></td>
						<td>Rp. <?= number_format($value['jumlah'], 0, '.', '.') ?></td>
						<td>X</td>
						<td><?= $value['sum'] ?></td>
						<td>=</td>
						<td>Rp. <?= number_format($value['jumlah']*$value['sum'], 0, '.', '.') ?></td>
					</tr>
				<?php 
				$total += ($value['jumlah']*$value['sum']);
				endforeach ?>
				<?php foreach ($detail_tambahan_penggajian_deb as $value): ?>
					<tr>
						<td><?= $value['nama'] ?></td>
						<td colspan="4"><?= $value['keterangan'] ?></td>
						<td>Rp. <?= number_format($value['jumlah'], 0, '.', '.') ?></td>
					</tr>
				<?php 
				$total += ($value['jumlah']);
				endforeach ?>
				
			</table>
			<b class="text-green" >Potongan :</b>
			<table width="100%" class="table-nota"  style="margin-top: 1%;margin-bottom: 1%;">
				<?php foreach ($detail_komponen_penggajian_kred as $value): ?>
					<tr>
						<td width="70%"><?= $value['komponen_penggajian'] ?></td>
						<td></td>
						<td>Rp. <?= number_format($value['jumlah']*$value['sum'], 0, '.', '.') ?></td>
					</tr>


				<?php 
				$total -= $value['jumlah']*$value['sum'];
				endforeach ?>
				<?php foreach ($detail_tambahan_penggajian_kred as $value): ?>
					<tr>
						<td><?= $value['nama'] ?></td>
						<td><?= $value['keterangan'] ?></td>
						<td>Rp. <?= number_format($value['jumlah'], 0, '.', '.') ?></td>
					</tr>
				<?php 
				$total -= ($value['jumlah']);
				endforeach ?>
			</table>

			<table width="100%" style="margin-bottom: 1%">
				<tr>
					<td width="80%" class="text-green"><b class="text-green">Jumlah HR yang diterima</b></td>
					<td style="background: #3ae374"><b class="text-green">Rp. <?= number_format($total, 0,'.','.') ?></b></td>
				</tr>
			</table>
		</div>
	</body>
</section>
</html>