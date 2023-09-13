<div class="panel panel-body">
	<center>
		
		<h4 style="font-weight: bold">Penggajian Periode <?= $data_get['bulan'].'/'.$data_get['tahun'] ?></h4>
	</center>

	<div class="table-responsive">
		<table class="table table-framed table-bordered table-xxs">
			<thead>
				<tr>
					<td width="5%">Kode</td>
					<td>Nama</td>
					<td width="5%">Status Payroll</td>
					<td width="2%">Proses</td>
					<td width="2%">Print</td>
				</tr>
			</thead>
			<tbody>
				<?php foreach ($data_get['guru'] as $value): ?>
					<tr>
						<td><?= $value['kode_pegawai'] ?></td>
						<td><?= $value['nama'] ?></td>
						<td><?= ($value['status_penggajian'] == 0) ? "<span class='label label-danger'>Belum diproses</span>":"<span class='label label-success'>Selesai</label>" ?></td>
						<td>

							<?php if ($value['status_penggajian'] == 0){ ?>
								
								<button class="btn btn-xs btn-primary" type="button" onclick="call_proses(<?= $value['id_guru'] ?>, <?= $data_get['bulan'] ?>, <?= $data_get['tahun']?>);"><i class=" icon-file-text"></i></button>
							<?php }else{ ?>
								<button class="btn btn-xs btn-danger" type="button" onclick="batal(<?= $value['id_guru'] ?>, <?= $data_get['bulan'] ?>, <?= $data_get['tahun']?>);"><i class=" icon-close2"></i></button>

							<?php } ?>
						</td>
						<td>
							<?php if ($value['status_penggajian'] == 0){ ?>
								
								<button class="btn btn-xs btn-default" type="button" disabled><i class=" icon-printer"></i></button>
							<?php }else{ ?>
								<a class="btn btn-xs btn-success" target="__blank" href="<?= base_url('admin/penggajian/print_nota/'.$value['id_guru'].'/'.$data_get['bulan'].'/'.$data_get['tahun']); ?>"><i class=" icon-printer"></i></a>

							<?php } ?>
						</td>
					</tr>
				<?php endforeach ?>
			</tbody>
		</table>
	</div>
</div>