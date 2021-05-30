<div class="panel panel-body panel-indikator">
	<center><u><b>Data Indikator PKG TA <?php echo $data_get['tahun_ajaran_get']['tahun_ajaran'] ?></b></u></center>
	<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/save_indikator" id="app-indikator" method="POST">
		<div class="form-group">
			<label class="col-lg-4 control-label">Indikator/Kompetensi</label>
			<div class="col-lg-8">
				<input type="text" class="form-control" name="kompetensi">
				<input type="hidden" class="form-control" name="idtahunajaran_fk" value="<?php echo $data_get['tahun_ajaran_get']['id_tahun_ajaran']  ?>">
			</div>
		</div>
		<button type="submit" class="btn btn-success"><i class="icon icon-plus3"></i> Tambah Indikator</button>
	</form>

	<hr>
	<table class="table table-framed table-indikator">
		<thead>
			<tr>
				<th width="5%">No</th>
				<th>Kompetensi</th>
				<th width="5%"></th>
			</tr>
		</thead>
		<tbody>
			<?php $no = 0; ?>
			<?php foreach ($data_get['indikator_pkg'] as $key => $value): ?>
				<tr>
					<td><button class="btn btn-danger btn-del btn-sm" data-id="<?php echo $value['id_kompetensi_pkg'] ?>"><i class="icon-trash"></i></button></td>
					<td><?php echo $value['kompetensi'] ?></td>
					<td><button class="btn btn-success btn-sub btn-sm" data-id="<?php echo $value['id_kompetensi_pkg'] ?>"><i class="icon-circle-right2"></i></button></td>
				</tr>
			<?php endforeach ?>
		</tbody>
	</table>
</div>