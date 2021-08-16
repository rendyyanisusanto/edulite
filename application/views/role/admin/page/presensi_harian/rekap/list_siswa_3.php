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
					font-size: 10px;
				}
</style>
<div class="panel panel-body">
	<center><h3>Presensi Siswa <?php echo ' Kelas '.$data_get['kelas']['kelas'] ?> Periode <?= $data_get['bulan'] ?></h3></center>
	
	<div class="table-responsive">
	<table class="" style="overflow: scroll;width: 100%;">
		<thead>
			<tr>
				<th class='text-table text-center' width="10%">NIS</th>
				<th class='text-table text-center' style="width: 20% !important;">Nama</th>
				<?php for ($i=1; $i <= $data_get['all_day'] ; $i++) { 
					echo "<th class='text-table text-center' width='25px'>".$i."</th>";
				} ?>
			</tr>
		</thead>
		<tbody>
			<?php foreach ($data_get['siswa'] as $key => $value): ?>
			<tr>
				<td class="text-table"><?php echo $value['siswa']['nis'] ?></td>
				<td class="text-table" ><?php echo $value['siswa']['nama'] ?></td>
				<?php for ($i=1; $i <= $data_get['all_day'] ; $i++) { 

					if ((isset($value['presensi'][$i]['presensi']))) {
						if ($value['presensi'][$i]['presensi'] == "M") {
								echo "<td width='25px' class='text-table text-center'><b class='text-success'>√</b></td>";
						}elseif ($value['presensi'][$i]['presensi'] == "A") {
								echo "<td width='25px' class='text-table text-center'><b class='text-danger'>X</b></td>";
						}else{
								echo "<td width='25px' class='text-table text-center'><b class='text-info'>".$value['presensi'][$i]['presensi']."</b></td>";
						}	
					}else{
						echo "<td width='25px' class='text-table'></td>";
					}

				} ?>
			</tr>
			<?php endforeach ?>
		</tbody>
	</table>
</div>
</div>