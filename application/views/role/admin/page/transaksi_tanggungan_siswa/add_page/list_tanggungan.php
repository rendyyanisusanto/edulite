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
					<td><b class="text-<?= (($value['jumlah']-$value['pembayaran']) <= 0) ? 'success' : 'danger' ?>"><?= (($value['jumlah']-$value['pembayaran']) <= 0) ? 'LUNAS' : 'Rp.'.number_format(($value['jumlah']-$value['pembayaran']),0,'.','.') ?></b></td>
				</tr>
				<?php endforeach ?>
				
			</tbody>
		</table>
		<hr>
		<b>Tanggungan SPP</b>
		<table class="table table-framed table-bordered table-xxs">
			<thead>
				<tr>
					<th width="1%">No</th>
					<th>Periode</th>
					<th>Bayar</th>
					<th>Status</th>
				</tr>
			</thead>
			<tbody>
				<?php $no = 0; ?>
				<?php foreach ($data_get['tanggungan_spp'] as $key=>$value): ?>
					<tr>
						<td><?= (++$no) ?></td>
						<td><?= $key?></td>
						<td><b>Rp. <?= number_format($value['jumlah']['jumlah'],0,'.','.') ?></b></td>
						<td><b class="text-<?= (($value['jumlah']['jumlah']) > 0) ? 'success' : 'danger' ?>"><?= (($value['jumlah']['jumlah']) > 0) ? 'LUNAS' : 'BELUM LUNAS';?></b></td>
					</tr>
				<?php endforeach ?>
			</tbody>
		</table>
		<?php }else{ ?>
		<b class="text-danger">Tanggungan siswa belum di setting, silahkan atur terlebih dahulu</b>
		<?php } ?>
	</div>