<style type="text/css">

				* {
					    -webkit-print-color-adjust: exact !important;   /* Chrome, Safari, Edge */
					    color-adjust: exact !important;                 /*Firefox*/
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

	<div class="table-responsive">
	<table class="table table-xxs table-bordered table-framed" style="width: 50%;">
		<tr>
			<td class='text-table' width="30%">Jenis Laporan</td>
			<td class='text-table' style="font-weight: bold;">Harian (Masuk - Pulang)</td>
		</tr>
		<tr>
			<td class='text-table' >Kelas</td>
			<td class='text-table' style="font-weight: bold;"><?php echo $data_get['kelas']['kelas'] ?></td>
		</tr>
		<tr>
			<td class='text-table' >Tanggal</td>
			<td class='text-table' style="font-weight: bold;"><?php echo date_format(date_create($data_get['bulan']), "d/m/Y") ?></td>
		</tr>
		
	</table>
	<hr>

	<table class="" style="overflow: scroll;width: 100%;">
		<thead>
			<tr>
				<th class='text-table text-center' style="font-weight: bold;" width="10%">NIS</th>
				<th class='text-table text-center' style="font-weight: bold;" style="width: 30% !important;">Nama</th>
				<th class='text-table text-center' style="font-weight: bold;">Masuk</th>
				<th class='text-table text-center' style="font-weight: bold;">Pulang</th>
				<th class='text-table text-center' style="font-weight: bold;">Keterangan</th>
			</tr>
			
		</thead>
		<tbody>
			<?php foreach ($data_get['siswa'] as $key => $value): ?>
			<tr>
				<td class="text-table"><?php echo $value['siswa']['nis'] ?></td>
				<td class="text-table" ><?php echo $value['siswa']['nama'] ?></td>
				<?php  

				if (isset($value['presensi']['presensi_masuk'])) {
						if ($value['presensi']['presensi_masuk'] == "M") {
								echo "<td width='25px' class='text-table text-center'><b class='text-success'>√</b></td>";
						}elseif ($value['presensi']['presensi_masuk'] == "A") {
								echo "<td width='25px' class='text-table text-center'><b class='text-danger'>X</b></td>";
						}else{
								echo "<td width='25px' class='text-table text-center'><b class='text-info'>".$value['presensi']['presensi_masuk']."</b></td>";
						}	
					}else{
						echo "<td width='25px' class='text-table'></td>";
					}

				?>
				<?php  

				if (isset($value['presensi']['presensi_pulang'])) {
						if ($value['presensi']['presensi_pulang'] == "M") {
								echo "<td width='25px' class='text-table text-center'><b class='text-success'>√</b></td>";
						}elseif ($value['presensi']['presensi_pulang'] == "A") {
								echo "<td width='25px' class='text-table text-center'><b class='text-danger'>X</b></td>";
						}else{
								echo "<td width='25px' class='text-table text-center'><b class='text-info'>".$value['presensi']['presensi_pulang']."</b></td>";
						}	
					}else{
						echo "<td width='25px' class='text-table'></td>";
					}

				?>
				<td class="text-table" ><?php echo $value['presensi']['keterangan'] ?></td>
				
				
			</tr>
			<?php endforeach ?>
		</tbody>
	</table>
</div>
</div>