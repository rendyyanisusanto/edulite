<div class="panel panel-body">
	<table class="table table-framed table-bordered">
		<thead>
			<tr>
				<th>Nama</th>
				<th>File</th>
				<th>Lulus</th>
				<th>Aktif</th>
				<th width="1%">Upl. File</th>
				<th width="1%">Ubah</th>
			</tr>
		</thead>
		<tbody>
			<?php foreach ($data_get['siswa'] as $key => $value): ?>
			<tr>
				<td><?php echo $value['siswa']['nama'] ?></td>
				<td><?php echo (!empty($value['file_get']['file_oas'])) ? $value['file_get']['file_oas'] :'<span class="label label-danger">Belum ada file</span>'; ?></td>
				<td><?php echo (($value['file_get']['status']) == 1) ? '<span class="label label-success">Lulus</span>' :'<span class="label label-danger">Tidak Lulus</span>'; ?></td>
				<td><?php echo (($value['file_get']['is_active']) == 1) ? '<span class="label label-success">Lunas</span>' :'<span class="label label-danger">Belum Lunas</span>'; ?></td>
				<td><button class="btn btn-sm btn-upload btn-primary" data-idsiswa="<?php echo $value['siswa']['id_siswa']  ?>" type="button"><i class="icon icon-file-upload"></i></button></td>
				<td><button class="btn btn-sm btn-ubh-status btn-warning" data-status="<?php echo $value['file_get']['status']  ?>" data-active="<?php echo $value['file_get']['is_active']  ?>" data-idoas="<?php echo $value['file_get']['id_file_oas'];  ?>" type="button"><i class="icon icon-spinner"></i></button></td>
			</tr>
			<?php endforeach ?>
		</tbody>
	</table>
</div>