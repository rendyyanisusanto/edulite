
<table class="table table-bordered table-xxs table-framed">
	<thead>
		<tr>
			<th width="1%">No</th>
			<th>Nama</th>
			<th>Kelas</th>
			<th>Keterangan</th>
		</tr>
	</thead>
	<tbody>
		<?php 
		$no = 0;
		if (!empty($data_get['ijin'])) {
			// code...
		foreach ($data_get['ijin'] as $key => $value): ?>
			<tr>
				<td><?php echo (++$no) ?></td>
				<td><?php echo $value['nama'] ?></td>
				<td><?php echo $value['kelas'] ?></td>
				<td><b style="color:<?php echo $value['color'] ?>"><?php echo $value['jenis_ijin'] ?></b></td>
			</tr>
		<?php endforeach ?>
			<?php 
				}else{
					echo "<tr><td colspan='4'><center><b style='text-align:center;'>Tidak Ada Data</b></center></td></tr>";
				}
			 ?>

	</tbody>
</table>