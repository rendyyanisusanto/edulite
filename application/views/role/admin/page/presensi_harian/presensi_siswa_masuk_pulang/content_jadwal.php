<div class="panel panel-body">
					<center><b><u>Presensi Prakerin</u></b></center>

					<table class="table table-bordered table-xxs table-framed">
						<thead>
							<tr>
								<th width="1%">No</th>
								<th>Kelas</th>
								<th width="1%">Absen Masuk</th>
								<th width="1%">Absen Pulang</th>
							</tr>
						</thead>
						<tbody>
							<?php $no = 0; ?>
							<?php foreach ($data_get['kelas'] as $value): ?>
								<tr>
									<td><?= (++$no); ?></td>
									<td><?= '<b>'.$value['kelas']['kelas'].'</b>' ?></td>
									<td><a class="text-<?= ($value['p_masuk'] == 0) ? 'danger' : 'success' ?> app-item" style="font-weight: bold;" href="Presensi_harian/proses_presensi_masuk_pulang/<?= $value['kelas']['id_kelas'] ?>/M/<?php echo $data_get['tanggal'] ?>" ><?= ($value['p_masuk'] == 0) ? "Belum" : "Sudah" ?></a></td> 
									<td><a class="text-<?= ($value['p_pulang'] == 0) ? 'danger' : 'success' ?> app-item" style="font-weight: bold;" href="Presensi_harian/proses_presensi_masuk_pulang/<?= $value['kelas']['id_kelas'] ?>/P/<?php echo $data_get['tanggal'] ?>" ><?= ($value['p_pulang'] == 0) ? "Belum" : "Sudah" ?></a></td>
								</tr>
							<?php endforeach ?>
						</tbody>
					</table>
				</div>