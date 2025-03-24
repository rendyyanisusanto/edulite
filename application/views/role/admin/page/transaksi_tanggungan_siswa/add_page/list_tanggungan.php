<style type="text/css">
	table {
		font-family: "arial";
		font-size: 11px;
	}
	table th{
		font-weight: bold;
	}
</style>
	<div class="panel panel-body" style="">
		<center><h4><b>Daftar Tanggungan</b></h4></center>
		<br>
		<?php if (!empty($data_get['tanggungan'])){ ?>
		<table class="table table-bordered table-framed table-xxs">
			<thead>
				<tr>
					<th width="1%">No</th>
					<th width="10%">TGN</th>
					<th>Jumlah</th>
					<th>Terbayar</th>
					<th>Sisa</th>
				</tr>
			</thead>
			<tbody>
				
				<?php $no = 0; ?>
				<?php foreach ($data_get['tanggungan'] as $value): ?>
				<tr>
					<td><?= (++$no) ?></td>
					<td><?= $value['nama'] ?></td>
					<td>Rp. <?= number_format($value['jumlah'],0,'.','.'); ?></td>
					<td>Rp. <?= number_format($value['pembayaran'],0,'.','.'); ?></td>
					<td><b class="text-danger">Rp. <?= number_format(($value['jumlah']-$value['pembayaran']),0,'.','.'); ?></b></td>
				</tr>
				<?php endforeach ?>
				
			</tbody>
		</table>
		<hr>
		<b>Histori Transaksi</b>
		<table class="table table-framed table-bordered table-xxs">
			<thead>
				<tr>
					<th>No</th>
					<th>Tgl</th>
					<th>Jenis</th>
					<th>Jumlah</th>
					<th>Diskon</th>
				</tr>
			</thead>
			<tbody>
				<?php $no = 0; ?>
				<?php foreach ($data_get['histori_pembayaran'] as $value): ?>
					<tr>
						<td><?= (++$no) ?></td>
						<td><?= date_format(date_create($value['tanggal']),'d-M-y') ?></td>
						<td><?= $value['nama'] ?></td>
						<td><b>Rp. <?= number_format($value['jumlah'],0,'.','.') ?></b></td>
						<td><b>Rp. <?= number_format($value['diskon_penerimaan'], 0, '.','.') ?></b></td>
					</tr>
				<?php endforeach ?>
			</tbody>
		</table>
		<?php }else{ ?>
		<b class="text-danger">Tanggungan siswa belum di setting, silahkan atur terlebih dahulu</b>
		<?php } ?>
	</div>