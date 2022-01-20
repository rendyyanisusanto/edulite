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
				@media print {

    			.text-danger {
    				color: red;
    			}

    			.text-warning {
    				color: orange;
    			}

    			.text-success {
    				color: green;
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
	<center><h3>Presensi Siswa <?php echo ' Kelas '.$data_get['kelas']['kelas'] ?> Periode <?= $data_get['bulan'] ?></h3></center>


	<div class="table-responsive">
	<table class="table table-xxs table-bordered table-framed" style="width: 50%;">
		<tr>
			<td class='text-table' width="30%">Jenis Laporan</td>
			<td class='text-table' style="font-weight: bold;">Mingguan</td>
		</tr>
		<tr>
			<td class='text-table' >Kelas</td>
			<td class='text-table' style="font-weight: bold;"><?php echo $data_get['kelas']['kelas'] ?></td>
		</tr>
		<tr>
			<td class='text-table' >Bulan/Tahun</td>
			<td class='text-table' style="font-weight: bold;"><?php echo date_format(date_create($data_get['bulan']), "m/Y") ?></td>
		</tr>
		<tr>
			<td class='text-table' >Minggu</td>
			<td class='text-table' style="font-weight: bold;"><?php echo date_format(date_create($data_get['bulan']), "W") ?></td>
		</tr>
	</table>
	<hr>
	<table class="" style="overflow: scroll;width: 100%;">
		<thead>
			<tr>
				<th class='text-table text-center' rowspan="2" width="10%">NIS</th>
				<th class='text-table text-center' rowspan="2" style="width: 20% !important;">Nama</th>
				<th class="text-table text-center" colspan="<?php echo iterator_count($data_get['tg']) ?>">Tanggal</th>

				<th class='text-table text-center' rowspan="2" style="width: 3% !important;">M</th>
				<th class='text-table text-center' rowspan="2" style="width: 3% !important;">TM</th>
			</tr>
			<tr>
				<?php foreach ($data_get['tg'] as $key => $value) { 
					echo "<th class='text-table text-center' width='25px'>".$value->format("d")."</th>";
				} ?>
			</tr>
		</thead>
		<tbody>
			<?php foreach ($data_get['siswa'] as $key => $value){ ?>
			<tr>
				<td class="text-table"><?php echo $value['siswa']['nis'] ?></td>
				<td class="text-table" ><?php echo $value['siswa']['nama'] ?></td>
				<?php  foreach ($value['presensi'] as $key2 => $value2) { 
				// print_r($value2['presensi']);  
					if (isset($value2['presensi'])&&(!empty($value2['presensi']))) {
						if ($value2['presensi'] == "M") {
								echo "<td width='25px' class='text-table text-center'><b class='text-success'>√</b></td>";
						}elseif ($value2['presensi'] == "A") {
								echo "<td width='25px' class='text-table text-center'><b class='text-danger'>X</b></td>";
						}else{
								echo "<td width='25px' class='text-table text-center'><b class='text-info'>".$value2['presensi']."</b></td>";
						}	
					}else{
						echo "<td width='25px' class='text-table'></td>";
					}

				} ?>
				<td class="text-table text-center"><?php echo $value['m'] ?></td>
				<td class="text-table text-center"><?php echo $value['tm'] ?></td>
			</tr>
			<?php } ?>
		</tbody>
	</table>
</div>
</div>