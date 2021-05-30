<div class="panel panel-body panel-subindikator">
	<center><b><u>Sub Indikator PKG - <?php echo $data_get['indikator_pkg']['kompetensi'] ?></u></b></center>

	<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/save_subindikator" id="app-subindikator" method="POST">
		<div class="form-group">
			<label class="col-lg-4 control-label">Indikator/Kompetensi</label>
			<div class="col-lg-8">
				<input type="text" required="" class="form-control" name="subkompetensi">
				<input type="hidden" class="form-control" name="idkompetensipkg_fk" value="<?php echo $data_get['indikator_pkg']['id_kompetensi_pkg']  ?>">
			</div>
		</div>
		<button type="submit" class="btn btn-warning"><i class="icon icon-plus3"></i> Tambah SubIndikator</button>
	</form>

	<hr>
	<table class="table table-framed table-indikator">
		<thead>
			<tr>
				<th width="5%">No</th>
				<th>Sub Indikator</th>
			</tr>
		</thead>
		<tbody>
			<?php $no = 0; ?>
			<?php foreach ($data_get['subindikator'] as $key => $value): ?>
				<tr>
					<td><button class="btn btn-danger btn-del btn-sm" data-id="<?php echo $value['id_subkompetensi_pkg'] ?>"><i class="icon-trash"></i></button></td>
					<td><?php echo $value['subkompetensi'] ?></td>
				</tr>
			<?php endforeach ?>
		</tbody>
	</table>
</div>
</div>