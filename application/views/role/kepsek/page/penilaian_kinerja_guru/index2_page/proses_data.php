<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">
			<center><h3><u>Input Data Penilaian Kinerja Guru Periode <?= $data_get['bulan'].'/'.$data_get['tahun'] ?></u></h3></center>
			<!-- hidden item -->
				<input type="hidden" value="<?= $data_get['bulan'] ?>" name="bulan" class="hbulan">
				<input type="hidden" value="<?= $data_get['tahun'] ?>" name="tahun" class="htahun">
				<input type="hidden" value="<?= $data_get['tahun_ajaran'] ?>" name="tahun_ajaran" class="htahun_ajaran">
			<!-- /hidden -->
			<table class="table table-framed table-bordered">
				<thead>
					<tr>
						<th width="1%">No</th>
						<th width="5%">Kode</th>
						<th>Guru</th>
						<th width="10%">PKG</th>
					</tr>
				</thead>
				<tbody>
					<?php $no = 0; ?>
					<?php foreach ($data_get['all'] as $value): ?>
						<tr>
							<td><?= ++$no ?></td>
							<td><?= $value['guru']['nip'] ?></td>
							<td><?= $value['guru']['nama'] ?></td>
							<td><?= (!empty($value['pkg'])) ? "<button class='btn btn-success btn-sm btn-edit-pkg' data-idguru='".$value['guru']['id_guru']."'><i class='icon-pencil3'></i></button>" : "<button data-idguru='".$value['guru']['id_guru']."' class='btn btn-danger btn-sm btn-add-pkg'><i class='icon-pencil3'></i></button>" ?></td>
						</tr>
					<?php endforeach ?>
				</tbody>
			</table>
		</div>
	</div>
</div>