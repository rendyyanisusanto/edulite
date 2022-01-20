<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title></title>
<style type="text/css">
	.head h2 {
		text-align: center;
		font-weight: bold;
	}
	.body-text{
		padding-left: 10%;
		padding-right: 10%;
	}
	.foot b{
		float: right;
	}
</style>
</head>
<body onload="print();">
	<div class="head">
		<h2>Buku Pemanggilan Siswa</h2>
	</div>
	<div class="body-text">
		<table style="width:100%">
			
			<tr>
				<td width="19%">Kode Pemanggilan</td>
				<td width="1%">:</td>
				<td><?php echo $data_get['buku_pemanggilan_siswa']['kode_pemanggilan'] ?></td>
			</tr>
			<tr>
				<td>Tanggal Pemanggilan</td>
				<td width="1%">:</td>
				<td><?php echo $data_get['buku_pemanggilan_siswa']['tanggal'] ?></td>
			</tr>
		</table>

		<p>Berdasarkan pemanggilan pada tanggal <?php echo $data_get['buku_pemanggilan_siswa']['tanggal'] ?> oleh siswa a/n <?php echo $data_get['buku_pemanggilan_siswa']['nama'] ?>(<?php echo $data_get['buku_pemanggilan_siswa']['nis'] ?>) dijabarkan sebagai berikut :</p>
		
		<table style="width:100%;">
			<tr>
				<td width="19%">Masalah</td>
				<td width="1%">:</td>
				<td><?php echo $data_get['buku_pemanggilan_siswa']['masalah'] ?></td>
			</tr>
			<tr>
				<td>Pemecahan</td>
				<td width="1%">:</td>
				<td><?php echo $data_get['buku_pemanggilan_siswa']['pemecahan'] ?></td>
			</tr>
			<tr>
				<td>Tindak Lanjut</td>
				<td width="1%">:</td>
				<td><?php echo $data_get['buku_pemanggilan_siswa']['tindak_lanjut'] ?></td>
			</tr>
		</table>

	</div>
</body>
</html>