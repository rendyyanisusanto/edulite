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
					font-weight: bold;
				}
				.text-td {
					padding: 5px;
					border: 1px solid gray;
					font-family: Consolas,monaco,monospace;
					font-size: 13px;
					font-weight: bold;
				}

			@media print {
    			.tx-dg {
    				background: red;
    			}

    			.tx-wn {
    				background: orange;
    			}

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
					font-weight: bold;
				}
				.text-td {
					padding: 5px;
					border: 1px solid gray;
					font-family: Consolas,monaco,monospace;
					font-size: 13px;
					font-weight: bold;
				}
				.text-center {
					text-align: center;
				}
				.tx-sc {
					color: green;
				}
  			}
</style>
<div class="panel panel-body">
	<center><h3>Presensi Siswa <?php echo ' Kelas '.$data_get['kelas']['kelas'] ?> Tanggal <?= $data_get['bulan'] ?></h3></center>
	
	<div class="table-responsive">
	<table class="" style="overflow: scroll;width: 100%;">
		<thead>
			<tr>
				<th class='text-table text-center' style="font-weight: bold;" rowspan="2" width="10%">NIS</th>
				<th class='text-table text-center' style="font-weight: bold;" rowspan="2" style="width: 30% !important;">Nama</th>
				<th class='text-table text-center' style="font-weight: bold;" colspan="<?php echo count($data_get['mapel_hari_ini']); ?>">Jam Ke</th>
			</tr>
			<tr>
				<?php foreach ($data_get['mapel_hari_ini'] as $key => $value): ?>
					<th style="font-weight: bold;" class='text-table text-center' style="width: 5% !important;"><?php echo $value['nama'].'-('.$value['nip'].')'.$value['kode_pelajaran'] ?></th>
				<?php endforeach ?>
			</tr>
		</thead>
		<tbody>
			<?php foreach ($data_get['siswa'] as $key => $value): ?>
			<tr>
				<td class="text-table"><?php echo $value['siswa']['nis'] ?></td>
				<td class="text-table" ><?php echo $value['siswa']['nama'] ?></td>
				<?php foreach ($data_get['mapel_hari_ini'] as $key_mapel => $value_mapel): ?>
					<?php 
					if ((isset($value['presensi'][$key_mapel]['presensi']))) {
						if ($value['presensi'][$key_mapel]['presensi'] == "M") {
								echo "<td  class='text-td text-center'><b class='text-success tx-sc'>√</b></td>";
						}elseif ($value['presensi'][$key_mapel]['presensi'] == "A") {
								echo "<td  class='text-td text-center tx-dg bg-danger'><b style='color:white;'>X</b></td>";
						}else{
								echo "<td  class='text-td text-center tx-wn bg-warning'><b style='color:white;'>".$value['presensi'][$key_mapel]['presensi']."</b></td>";
						}	
					}else{
						echo "<td  class='text-td'></td>";
					}
					 ?>
				<?php endforeach ?>
				
			</tr>
			<?php endforeach ?>
		</tbody>
	</table>
</div>
</div>