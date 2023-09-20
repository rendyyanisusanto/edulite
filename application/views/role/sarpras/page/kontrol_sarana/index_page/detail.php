<table class="table table-framed table-xxs" >
	<tr>
		<td style="font-weight: bold;">No. Inv</td>
		<td><?= $data_get['kontrol_sarana']['no_kontrol_sarana'] ?></td>
	</tr>
	<tr>
		<td style="font-weight: bold;">Nama Penanggung Jawab</td>
		<td><?= $data_get['penanggung_jawab']['nama'] ?></td>
	</tr>
</table>
<hr>
<table class="table table-framed table-xxs">
	<thead>
		<tr>
			<th width="1%">No</th>
			<th>Sarana</th>
			<th>Jumlah Awal</th>
			<th>Jumlah Akhir</th>
			<th>Kondisi</th>
			<th>Keterangan</th>
		</tr>
	</thead>
	<tbody>
		<?php 
		$no = 0;
		foreach ($data_get['sarana'] as $value): ?>
			<tr>
				<td><?= ++$no ?></td>
				<td><?= $value['sarana']['no_inventaris'].'-'.$value['sarana']['sarana'] ?></td>
				<td><?= $value['detail']['jumlah_awal'] ?></td>
				<td><?= $value['detail']['jumlah_akhir'] ?></td>
				<td><b style="color:<?= $value['kondisi']['warna'] ?>"><?= $value['kondisi']['kondisi_sarana'] ?></b></td>
				<td><?= $value['detail']['keterangan'] ?></td>
			</tr>
		<?php endforeach ?>
	</tbody>
	
</table>