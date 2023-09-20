<table class="table table-bordered table-xxs table-framed">
	<input type="hidden" name="id_jadwal_lab" value="<?= $data_get['jadwal_lab']['id_jadwal_lab'] ?>">
	<tr>
		<td>Kode</td>
		<td>:</td>
		<td><?= $data_get['jadwal_lab']['kode'] ?></td>
	</tr>
	<tr>
		<td>Tanggal</td>
		<td>:</td>
		<td><?= $data_get['jadwal_lab']['tanggal'] ?></td>
	</tr>
	<tr>
		<td>Guru</td>
		<td>:</td>
		<td><?= $data_get['guru']['nama'] ?></td>
	</tr>
	<tr>
		<td>Kelas</td>
		<td>:</td>
		<td><?= $data_get['kelas']['kelas'] ?></td>
	</tr>
	<tr>
		<td>Mapel</td>
		<td>:</td>
		<td><?= $data_get['mata_pelajaran']['mata_pelajaran'] ?></td>
	</tr>
	<tr>
		<td>Keterangan</td>
		<td>:</td>
		<td><?= $data_get['jadwal_lab']['keterangan'] ?></td>
	</tr>
	<tr>
		<td>Jam ke</td>
		<td>:</td>
		<td>
			<ul>
				<?php foreach ($data_get['detail'] as $value): ?>
					<li><?= $value['nama'].' ('.$value['jam_mulai'].' / '.$value['jam_selesai'].')' ?></li>
				<?php endforeach ?>
			</ul>
		</td>
	</tr>

	<tr>
		<td>Status</td>
		<td>:</td>
		<td>
			<select class="form-control" name="status">
				<option <?= ($data_get['jadwal_lab']['status'] == 0 ) ? "selected" : ''; ?> value="0">Belum dikonfirmasi</option>
				<option <?= ($data_get['jadwal_lab']['status'] == 1 ) ? "selected" : ''; ?> value="1">Diterima</option>
				<option <?= ($data_get['jadwal_lab']['status'] == 2 ) ? "selected" : ''; ?> value="2">Ditolak</option>
			</select>
		</td>
	</tr>
</table>