<table class="table table-xxs table-framed table-columned">
	<thead>
		<tr>
			<th></th>
			<th>Debit</th>
			<th>Kredit</th>
		</tr>
	</thead>
	<tbody>
		<?php $saldo_debit 		= 0; ?>
		<?php $saldo_kredit	 	= 0; ?>
		<?php foreach ($data_get['akun'] as $key => $value): ?>
		
			<tr>
				<td><b><?php echo $value['id_coa'] ?> - <?php echo $value['coa'] ?></b></td>
				<td></td>
				<td></td>
			</tr>
			<?php foreach ($value['induk'] as $key => $induk_akun): ?>
				<tr>
					<td>&nbsp&nbsp <b><?php echo $induk_akun['no_akun'] ?> - <?php echo $induk_akun['nama'] ?></b></td>
					<td></td>
					<td></td>
				</tr>
				<?php foreach ($induk_akun['akun'] as $key => $akun): ?>
				<?php $pos = $akun['saldo_normal'] ?>
				<?php  
					if ($pos == 'D') {
						$saldo_debit 	+= $akun['cash'];
					}else{
						$saldo_kredit 	+= $akun['cash'];
					}
				?>
					<tr>
						<td>&nbsp&nbsp&nbsp&nbsp <?php echo $akun['no_ref'] ?> - <?php echo $akun['nama'] ?></td>
						<td>
							<?php  
									if ($pos == 'D') {
										?>
										<b class="<?php echo ($akun['cash']>0)?'text-success':'text-danger' ?>">Rp. <?php echo number_format($akun['cash'],0,',','.') ?></b></td>
										<?php
									}else{
										?>
										<b class="">-</b></td>
										<?php
									}
							?>
							
						<td>
							<?php  
									if ($pos == 'K') {
										?>
										<b class="<?php echo ($akun['cash']>0)?'text-success':'text-danger' ?>">Rp. <?php echo number_format($akun['cash'],0,',','.') ?></b></td>
										<?php
									}else{
										?>
										<b class="">-</b></td>
										<?php
									}
							?>
						</td>
					</tr>

				<?php endforeach ?>
				
			<?php endforeach ?>
			
		<?php endforeach ?>
	</tbody>
	<tfoot>
		<tr>
			<td><b>Total (Sebelum Penyesuaian)</b></td>
			<td><b class="<?php echo (($saldo_debit)>0)?'text-success':'text-danger' ?>"><?php echo 'Rp. '.number_format(($saldo_debit),0,',','.'); ?></b></td>
			<td><b class="<?php echo (($saldo_kredit)>0)?'text-success':'text-danger' ?>"><?php echo 'Rp. '.number_format(($saldo_kredit),0,',','.'); ?></b></td>
		</tr>
	</tfoot>
</table>