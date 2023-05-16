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
<body>

	<table border="1" width="100%">
		<tr>
			<td>No</td>
			<?php foreach ($param['column'] as $key => $value): ?>
				<td><?php echo $value ?></td>
			<?php endforeach ?>
		</tr>
		<?php 
		$i=1;
		foreach ($data as $key => $value): ?>
			<tr>
				<td><?php echo $i ?></td>
				<?php foreach ($param['column'] as $key2 => $value2): ?>
					<td><?php echo $value[$value2]?></td>
				<?php endforeach ?>
			</tr>
		<?php 
		$i++;
		endforeach ?>
	</table>
</body>
</html>