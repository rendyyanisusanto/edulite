<div class="row">
	<div class="col-md-6">
		<div class="panel panel-body">
			<button class="btn btn-primary btn-add" 
			data-idkelas_fk="<?php echo $data_get['guru_mapel']['idkelas_fk'] ?>"
			data-idmatapelajaran_fk="<?php echo $data_get['guru_mapel']['idmapel_fk'] ?>"
			data-idtahunajaran_fk="<?php echo $data_get['guru_mapel']['idtahunajaran_fk'] ?>" 
			data-idguru_fk="<?php echo $data_get['guru_mapel']['idguru_fk'] ?>" 
			type="button"><i class="icon-plus3"></i>Tambah Penilaian</button>
			<hr>
			<table class="table table-xxs table-framed">
				<thead>
					<tr>
						<th>Kode</th>
						<th>Keterangan</th>
						<th>#</th>
					</tr>
				</thead>
				<tbody>
					<?php foreach ($data_get['kd_get'] as $key => $value): ?>
						<tr>
							<td><?php echo $value['kode'] ?></td>
							<td><?php echo $value['keterangan'] ?></td>
							<td></td>
						</tr>
					<?php endforeach ?>
				</tbody>
			</table>
		</div>
		
	</div>
</div>
