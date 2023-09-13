<table class="table table-framed table-bordered table-responsive table-xxs">
				<thead>
					<tr>
						<th width="1%">No</th>
						<th>Nama</th>
						<th>Kelas</th>
						<th>Tanggungan</th>
						<th>Total</th>
					</tr>
				</thead>
				<tbody>
					<?php $no=0; ?>
					<?php foreach ($data_get['siswa'] as $value): ?>
						<tr>
							<td><?= ++$no; ?></td>
							<td><?= $value['siswa']['nama'] ?></td>
							<td><?= $value['siswa']['kelas'] ?></td>
							<td>
								<?php if (!empty($value['tanggungan'])){ ?>
								<ul>
									<?php foreach ($value['tanggungan'] as $value_tanggungan): ?>
										<li><?= $value_tanggungan['nama'] ?> : 
											<?php if (($value_tanggungan['jumlah']-$value_tanggungan['pembayaran']) > 0){ ?>
												<b class="text-warning">Rp. <?= number_format(($value_tanggungan['jumlah']-$value_tanggungan['pembayaran']),0,'.','.'); ?></b>
											<?php }else{ ?>
												<b class="text-success">Lunas</b>
											<?php } ?>
										</li>
									<?php endforeach ?>
								</ul>
								<?php }else{ ?>
								<b class="text-danger">Tanggungan belum disetting</b>
								<?php } ?>
							</td>
							<td>
								<?php if (!empty($value['tanggungan'])){ ?>
								<b class="text-warning">Rp. <?= number_format($value['total_tanggungan'],0,'.','.'); ?></b>
								<?php }else{ ?>
								<b class="text-danger">#</b>
								<?php } ?>
								
							</td>
						</tr>

					<?php endforeach ?>
				</tbody>
			</table>