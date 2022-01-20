<div class="panel panel-body">
	<center><h3>Rekap Presensi Siswa Mingguan <?php echo ' Kelas '.$data_get['kelas']['kelas'] ?> Periode <?= $data_get['bulan'] ?></h3></center>
	
	<div class="table-responsive" >
	<table class="table table-framed table-bordered table-xxs" style="overflow: scroll;width: 100%;">
		<thead>
			<tr>
				<th class='text-table text-center' rowspan="3" width="10%">NIS</th>
				<th class='text-table text-center' rowspan="3" style="width: 20% !important;">Nama</th>
				<th class='text-table text-center' colspan="<?php echo ($data_get['rng']*2) ?>">Minggu Ke-</th>
			</tr>
			<tr>
				<?php for ($i=1; $i <= $data_get['rng'] ; $i++) { ?>
					<th class='text-table text-center' colspan="2"><?php echo $i ?></th>
				<?php } ?>
			</tr>
			<tr>
				<?php for ($i=1; $i <= $data_get['rng'] ; $i++) { ?>
					<th>M</th>
					<th>TM</th>
				<?php } ?>
			</tr>
		</thead>
		<tbody>
			<?php foreach ($data_get['siswa'] as $key => $value): ?>
			<tr>
				<td class="text-table"><?php echo $value['siswa']['nis'] ?></td>
				<td class="text-table" ><?php echo $value['siswa']['nama'] ?></td>
				<?php for ($i=1; $i <= $data_get['rng'] ; $i++) { ?>
					<td width="1%">
						<?php echo (!empty($value['presensi'][$i]['M'])) ? "<b class='text-success'>".$value['presensi'][$i]['M']."</b>": "-"; ?>
					</td>
					<td width="1%">
						<?php echo (!empty($value['presensi'][$i]['TM'])) ? "<b class='text-danger'>".$value['presensi'][$i]['TM']."</b>": "-"; ?>
					</td>
				<?php } ?>
			</tr>
			<?php endforeach ?>
		</tbody>
	</table>
</div>
</div>