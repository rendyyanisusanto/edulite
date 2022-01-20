<table class="table table-bordered table-framed table-xxs">
	<thead>
		<tr>
			<th>Siswa</th>
			<th>Kelas</th>
			<th>Mapel</th>
			<th>Guru</th>
			<th>Uraian</th>
			<th>Tindakan</th>
		</tr>
	</thead>
	<tbody>
		<?php foreach ($data_get['catatan'] as $key => $value): ?>
			<tr>
				<td>
					<?php echo $value['nama'] ?>
				</td>
				<td>
					<?php echo $value['nama_kelas'] ?>
				</td>
				<td>
					<?php echo $value['mapel'] ?>
				</td>
				<td>
					<?php echo $value['nama_guru'] ?>
				</td>
				<td>
					<b><?php echo $value['uraian'] ?></b>
				</td>
				<td>
					<a href="Catatan_siswa/tindakan/<?php echo $value['id_catatan_siswa'] ?>" class="btn app-item btn-success btn-sm" >Tindakan</a>
				</td>
			</tr>
		<?php endforeach ?>
	</tbody>
</table>