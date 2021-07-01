<style type="text/css">
				.sticky {
					position: sticky;
					top:0;
					background: white;
				}
				.text-table {
					padding: 5px;
					border: 1px solid gray;
					font-family: Consolas,monaco,monospace;
					font-size: 13px;
				}
</style>
<div class="panel panel-body">
	<center><h3>Total Presensi Siswa Mapel <?php echo $data_get['mata_pelajaran']['mata_pelajaran'].' Kelas '.$data_get['kelas']['kelas'] ?> Periode <?= $data_get['bulan'] ?></h3></center>
	
	<div class="table-responsive">
	<table class="" style="overflow: scroll;width: 100%;">
		<thead>
			<tr>
				<th class='text-table text-center' width="8%">NIS</th>
				<th class='text-table text-center' style="width: 20% !important;">Nama</th>
				<th class='text-table text-center' width="1%">M</th>
				<th class='text-table text-center' width="1%">S</th>
				<th class='text-table text-center' width="1%">I</th>
				<th class='text-table text-center' width="1%">A</th>
			</tr>
		</thead>
		<tbody>
			<?php foreach ($data_get['siswa'] as $key => $value): ?>
			<tr>
				<td class="text-table"><?php echo $value['siswa']['nis'] ?></td>
				<td class="text-table" ><?php echo $value['siswa']['nama'] ?></td>
				<td class="text-table <?php echo ($value['m'] > 0) ? "bg-success" : "" ; ?> text-center" ><?php echo $value['m'] ?></td>
				<td class="text-table <?php echo ($value['s'] > 0) ? "bg-info" : "" ; ?> text-center" ><?php echo $value['s'] ?></td>
				<td class="text-table <?php echo ($value['i'] > 0) ? "bg-warning" : "" ; ?> text-center" ><?php echo $value['i'] ?></td>
				<td class="text-table <?php echo ($value['a'] > 0) ? "bg-danger" : "" ; ?> text-center" ><?php echo $value['a'] ?></td>
				
			</tr>
			<?php endforeach ?>
		</tbody>
	</table>
</div>
</div>