<div class="panel panel-body">
	<b>Tanggungan <?= $data_get['alumni']['nama'] ?></b>

	<hr>

	<?php if (!empty($data_get['tanggungan_siswa'])): ?>
		
		
		<div class="alert alert-warning"><b>Info : </b> Tanggungan siswa tidak bisa diubah, jika ingin ada penambahan tanggungan maka tambahkan di bagian tanggungan alumni</div>

		<b>Tanggungan siswa</b>
		<br>
		<table class="table table-xxs table-framed table-bordered">
			<thead>
				<tr>
					<th width="1%">No</th>
					<th>Nama</th>
					<th>Jumlah</th>
					<th>Terbayar</th>
				</tr>
			</thead>
			<tbody>
				<?php $no = 0; ?>
				<?php foreach ($data_get['tanggungan_siswa'] as $value): ?>

					<tr>
						<td><?= ++$no; ?></td>
						<td><?= $value['nama'] ?></td>
						<td>Rp. <?= number_format($value['jumlah'],0,'.','.') ?></td>
						<td>Rp. <?= number_format($value['pembayaran'],0,'.','.') ?></td>
					</tr>
				<?php endforeach ?>
			</tbody>
		</table>
	<?php endif ?>
