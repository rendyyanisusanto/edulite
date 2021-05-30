<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/simpan_data" id="app-submit" method="POST">
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">
			<table class="table table-framed">
				<thead>
					<tr>
						<th width="2%">No</th>
						<th>Guru</th>
						<th width="30%">Persentase</th>
					</tr>
				</thead>
				<tbody>
					<?php $no = 0; ?>
					<?php foreach ($data_get['persentase_guru'] as $key => $value): ?>
						<tr>
							<td><?php echo ++$no ?></td>
							<td><?php echo $value['guru']['nama'] ?></td>
							<input type="hidden" value="<?php echo $value['guru']['id_guru'] ?>" name="data[<?php echo $key ?>][id_guru]">
							<td><input type="number" class="form-control" value="<?php echo (!empty($value['persentase'])) ? $value['persentase']['persentase'] : "";  ?>" name="data[<?php echo $key ?>][persentase]"></td>
						</tr>
					<?php endforeach ?>
				</tbody>
			</table>

			<hr>
			<button class="btn btn-success"><i class="icon-floppy-disk"></i> Simpan Data</button>
			
		</div>
	</div>
</div>
</form>