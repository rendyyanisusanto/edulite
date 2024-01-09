<div class="row">
	<div class="col-md-8">
		<div class="panel panel-body">
		<center><h4><b>Halaman Kwitansi HR</b></h4></center>
			<div class="table-responsive" style="background: gray; padding: 1%;">
				<div class="panel panel-body">
					
					<table class="table table-bordered table-framed table-xxs">
						<thead>
							<tr>
								<th width="1%">No</th>
								<th>Bulan/Tahun</th>
								<th width="15%">Total</th>
								<th width="2%">Status</th>
								<th width="1%">Print</th>
							</tr>
						</thead>
						<tbody>
							<?php 
							$no = 0;
							foreach ($data_get['penggajian'] as $value): ?>
								<?php if ($value['shared'] == 1): ?>
									<tr>
										<td><?= ++$no; ?></td>
										<td><?= $value['bulan'] ?>/<?= $value['tahun'] ?></td>
										<td>Rp. <?= number_format($value['total'], 0, '.','.') ?></td>
										<th><span class="label label-success">Terkonfirmasi</span></th>
										<th>
											<a class="btn btn-xs btn-success" target="__blank" href="<?= base_url('guru/penggajian/print_nota/'.$value['idguru_fk'].'/'.$value['bulan'].'/'.$value['tahun']); ?>"><i class=" icon-printer"></i></a>
										</th>
									</tr>
								<?php endif ?>
							<?php endforeach ?>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>