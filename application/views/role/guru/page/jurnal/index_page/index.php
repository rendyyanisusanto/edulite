<div class="row">
	<div class="col-md-6">
		<div class="panel panel-body">
			<table class="table table-xxs table-framed table-bordered">
				<tr>
					<td class="bg-primary">Nama</td>
					<td class="bg-info"><?= $data_get['guru']['nama'] ?></td>
				</tr>
				<tr>
					<td class="bg-primary">Mapel</td>
					<td class="bg-info"><?= $data_get['mapel_hari_ini']['mata_pelajaran'] ?></td>
				</tr>
				<tr>
					<td class="bg-primary">Kelas</td>
					<td class="bg-info"><?= $data_get['mapel_hari_ini']['kelas'] ?></td>
				</tr>
				<tr>
					<td class="bg-primary">Jam Ke-</td>
					<td class="bg-info"><?= $data_get['mapel_hari_ini']['nama'] ?> (<?= $data_get['mapel_hari_ini']['jam_mulai'] ?> - <?= $data_get['mapel_hari_ini']['jam_selesai'] ?>)</td>
				</tr>
			</table>
		</div>
	</div>
</div>