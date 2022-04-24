<?php foreach ($data_get['akun'] as $key => $value): ?>

	<div class="panel">
		<div class="panel-body">
			<b>Nama Akun : <?php echo $value['nama'] ?></b><b><p class="text-right">Kode Akun : <?php echo $value['no_ref'] ?></p></b>
			<table class="table table-xxs table-framed table-bordered table-columned">
				<thead>
					<tr>
						<th rowspan="2" colspan="2">Tgl</th>
						<th rowspan="2">Keterangan</th>
						<th rowspan="2">Debit</th>
						<th rowspan="2">Kredit</th>
						<th colspan="2">Saldo</th>
					</tr>
					<tr>
						<th>Debit</th>
						<th>Kredit</th>
					</tr>
				</thead>
				<tbody>
					<?php if (count($value['jurnal_umum'])>0){ ?>
					<?php $i=0; ?>
					<?php $saldo = 0; ?>
					<?php foreach ($value['jurnal_umum'] as $key => $jurnal): ?>
					<?php $pos = $value['saldo_normal'] ?>
						<!-- Perhitungan -->
							<?php  
								if ($pos == 'D') {
									$saldo += $jurnal['debit'];
									$saldo -= $jurnal['kredit'];
								}else{
									$saldo -= $jurnal['debit'];
									$saldo += $jurnal['kredit'];
								}
							?>
						<!-- /PERHITUNGAN -->
						<tr>
							<?php if ($i==0){ ?>
								<td rowspan="<?php echo count($jurnal); ?>" ><?php echo date('Y', strtotime($jurnal['create_at'])) ?> <br> <?php echo date('M', strtotime($jurnal['create_at'])) ?></td>
							<?php }?>
							<td><?php echo date('d', strtotime($jurnal['create_at'])) ?></td>
							<td><?php echo $jurnal['keterangan'] ?></td>
							<td>Rp. <?php echo number_format($jurnal['debit'],0,',','.') ?></td>
							<td>Rp. <?php echo number_format($jurnal['kredit'],0,',','.') ?></td>
							<td>
								<?php  
									if ($pos == 'D') {
										echo "Rp.".number_format($saldo,0,',','.');
									}
								?>
							</td>
							<td>
								<?php  
									if ($pos == 'K') {
										echo "Rp.".number_format($saldo,0,',','.');
									}
								?>
							</td>
						</tr>
					<?php $i++; ?>
					<?php endforeach ?>
					<?php }else{ ?>
						<tr>
							<td colspan="7"><center><b>Tidak ditemukan transaksi</b></center></td>
						</tr>
					<?php } ?>
				</tbody>
			</table>
		</div>
	</div>
	
	<br>
<?php endforeach ?>
