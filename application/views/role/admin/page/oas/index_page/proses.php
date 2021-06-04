<div class="panel panel-body">
	<table class="table table-framed table-bordered">
		<thead>
			<tr>
				<th>Nama</th>
				<th>File</th>
				<th width="10%">#</th>
			</tr>
		</thead>
		<tbody>
			<?php foreach ($data_get['siswa'] as $key => $value): ?>
			<tr>
				<td><?php echo $value['siswa']['nama'] ?></td>
				<td><?php echo (!empty($value['file_get']['file_oas'])) ? $value['file_get']['file_oas'] :'<span class="label label-danger">Belum ada file</span>'; ?></td>
				<td><button class="btn btn-sm btn-upload btn-success" data-idsiswa="<?php echo $value['siswa']['id_siswa']  ?>" type="button"><i class="icon icon-file-upload"></i> Upload</button></td>
			</tr>
			<?php endforeach ?>
		</tbody>
	</table>
</div>