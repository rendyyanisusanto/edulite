<table class="table table-framed table-xxs" >
	<tr>
		<td style="font-weight: bold;">No. Peminjaman</td>
		<td><?= $data_get['peminjaman_sarana']['no_peminjaman_sarana'] ?></td>
	</tr>
	<tr>
		<td style="font-weight: bold;">No. Pengembalian</td>
		<td><?= $data_get['pengembalian_sarana']['no_pengembalian_sarana'] ?></td>
	</tr>
	<tr>
		<td style="font-weight: bold;">Nama</td>
		<td><?= $data_get['profil_peminjam']['nama'] ?></td>
	</tr>
	<tr>
		<td style="font-weight: bold;">Status</td>
		<td><?= ($data_get['peminjaman_sarana']['status'] == 0) ? '<span class="label label-danger">Belum Dikembalikan</span>' :'<span class="label label-success">Sudah Dikembalikan</span>'; ?></td>
	</tr>
	<tr>
		<td style="font-weight: bold;">Status Kelengkapan</td>
		<td><?= ($data_get['pengembalian_sarana']['is_complete'] == 0) ? '<span class="label label-danger">Tidak Lengkap</span>' :'<span class="label label-success">Lengkap</span>'; ?></td>
	</tr>
</table>
<hr>
<table class="table table-framed table-xxs">
	<thead>
		<tr>
			<th width="1%">No</th>
			<th>Sarana</th>
			<th>Jumlah</th>
			<th>Kondisi Awal</th>
			<th>Kondisi Kembali</th>
		</tr>
	</thead>
	<tbody>
		<?php 
		$no = 0;
		foreach ($data_get['sarana'] as $value): ?>
			<tr>
				<td><?= ++$no ?></td>
				<td><?= $value['sarana']['sarana'] ?></td>
				<td><?= $value['detail']['jumlah'] ?></td>
				<td><b style="color:<?= $value['kondisi_awal']['warna'] ?>"><?= $value['kondisi_awal']['kondisi_sarana'] ?></b></td>
				<td><b style="color:<?= $value['kondisi']['warna'] ?>"><?= $value['kondisi']['kondisi_sarana'] ?></b></td>
			</tr>
		<?php endforeach ?>
	</tbody>
	
</table>