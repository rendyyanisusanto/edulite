<table class="table table-framed table-bordered table-responsive table-xxs">
				<thead>
					<tr>
						<th width="1%">No</th>
						<th>Nama</th>
						<th>Kelas</th>
						<th>Setting</th>
						<th width="2%">#</th>
					</tr>
				</thead>
				<tbody>
					<?php $no=0; ?>
					<?php foreach ($data_get['tanggungan'] as $value): ?>
						<tr>
							<td><?= ++$no; ?></td>
							<td><?= $value['siswa']['nama'] ?></td>
							<td><?= $value['siswa']['kelas'] ?></td>
							<td><?= ($value['tanggungan_count'] > 0) ? "<b class='text-success'>Tersetting</b>":"<b class='text-danger'>Belum Tersetting</b>" ; ?></td>
							<td><button type="button" onclick="get_tanggungan_siswa(<?= $value['siswa']['id_siswa'] ?>)" class="btn btn-sm btn-<?= ($value['tanggungan_count'] > 0) ? "success":"danger" ; ?>"><i class="icon-pencil3"></i></button></td>
						</tr>
					<?php endforeach ?>
				</tbody>
			</table>