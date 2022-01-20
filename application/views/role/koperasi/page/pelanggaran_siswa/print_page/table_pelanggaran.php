<div class="panel panel-body panel-option" >
      <button class="btn btn-primary btn-prt" type="button"><i class="icon-printer"></i> Cetak</button>
    </div>

 
<div class="panel panel-body " id="proses-pelanggaran">
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
					font-size: 15px;
					font-weight: bold;
				}
				.text-td {
					padding: 5px;
					border: 1px solid gray;
					font-family: Consolas,monaco,monospace;
					font-size: 15px;
					font-weight: bold;
				}
  	@media print {
  		* {
					    -webkit-print-color-adjust: exact !important;   /* Chrome, Safari, Edge */
					    color-adjust: exact !important;                 /*Firefox*/
					}

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
  </style>
  	<center><h3><b>Data Pelanggaran Siswa Periode <?php echo $data_get['periode'] ?></b></h3></center>
	<table class="table table-framed table-bordered" width="100%">
		<thead>
			<tr>
				<th class='text-table text-center'>Tanggal</th>
				<th class='text-table text-center'>Siswa</th>
				<th class='text-table text-center'>Pelanggaran</th>
			</tr>
		</thead>
		<tbody>
			<?php foreach ($data_get['pelanggaran'] as $key => $value): ?>
				<tr>
					<td class="text-table"><?php echo $value['tanggal'] ?></td>
					<td class="text-table"><?php echo $value['nama_siswa'] ?></td>
					<td class="text-table"><?php echo $value['uraian_pelanggaran'] ?></td>
				</tr>
			<?php endforeach ?>
		</tbody>
	</table>
</div>