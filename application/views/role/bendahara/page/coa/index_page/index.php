<div class="row">
	<div class="col-md-6">
		<div class="panel panel-body">
			<center>
				<h3>Kategori Akun</h3>
			</center>
			
			<table class="table table-framed table-xxs">
				<thead>
					<tr>
						<th>No</th>
						<th>Akun</th>
						<th width="1%">#</th>
					</tr>
				</thead>
				<tbody>
					<?php $no = 0; ?>
					<?php foreach ($data_get['induk_akun'] as $value): ?>
						<tr>
							<td><?= (++$no); ?></td>
							<td><?= '('.$value['no_akun'].') '.$value['nama'] ?></td>
							<td><button data-id="<?= $value['id_induk_akun'] ?>" class="btn btn-process btn-success btn-xs"><i class="icon-arrow-right7"></i></button></td>
						</tr>
					<?php endforeach ?>
				</tbody>
			</table>
		</div>
	</div>
	<div class="col-md-6">
		<div class="panel-process"></div>
	</div>
</div>