<!DOCTYPE html>
<html>
<head>
	<title>Cetak COA</title>
</head>
<body onload="print();">
	<style type="text/css">
		/*table, th, td {
			  border: 1px solid black;
			  border-collapse: collapse;
			}*/
	</style>
	<table style="width: 100%;">
		<?php foreach ($akun as $value): ?>
			<tr>
				<td><?= $value['no_ref']." - ".$value['nama'] ?></td>
			</tr>
		<?php endforeach ?>
	</table>
</body>
</html>