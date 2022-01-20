
<div class="col-md-6">
	<div class="panel panel-body">
		<center><h4><b>Daftar Tanggungan</b></h4></center>
		<br>
		<?php if (!empty($data_get['tanggungan'])){ ?>
		<table class="table table-framed table-xxs">
			<thead>
				<tr>
					<th width="1%">No</th>
					<th>Tanggungan</th>
					<th>Jumlah</th>
				</tr>
			</thead>
			<tbody>
				
				<?php $no = 0; ?>
				<?php foreach ($data_get['tanggungan'] as $value): ?>
				<tr>
					<td><?= (++$no) ?></td>
					<td><?= $value['nama'] ?></td>
					<td>Rp. <?= number_format($value['jumlah'],0,'.','.'); ?></td>
				</tr>
				<?php endforeach ?>
				
			</tbody>
		</table>
		<?php }else{ ?>
		<b class="text-danger">Tanggungan siswa belum di setting, silahkan atur terlebih dahulu</b>
		<?php } ?>
	</div>
</div>