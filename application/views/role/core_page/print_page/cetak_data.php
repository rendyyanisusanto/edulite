<!DOCTYPE html>
<html>
<head>
	<title></title>
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