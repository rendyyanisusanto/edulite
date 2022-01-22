<table class="table table-xxs table-columned">
	<thead>
		<tr>
			<th colspan="2"></th>
		</tr>
	</thead>
	<tbody>
		<?php $pendapatan 		= 0; ?>
		<?php $beban		 	= 0; ?>
		<?php foreach ($data_get['akun'] as $key => $value): ?>
			<tr>
				<td><b><?php echo $value['id_coa'] ?> - <?php echo $value['coa'] ?></b></td>
				<td></td>
			</tr>
			<?php foreach ($value['induk'] as $key => $induk_akun): ?>
				<tr>
					<td>&nbsp&nbsp <b><?php echo $induk_akun['no_akun'] ?> - <?php echo $induk_akun['nama'] ?></b></td>
					<td></td>
				</tr>
				<?php foreach ($induk_akun['akun'] as $key => $akun): ?>
					<tr>
						<td>&nbsp&nbsp&nbsp&nbsp <?php echo $akun['no_ref'] ?> - <?php echo $akun['nama'] ?></td>
						<td><b class="<?php echo ($akun['cash']>0)?'text-success':'text-danger' ?>">Rp. <?php echo number_format($akun['cash'],0,',','.') ?></b></td>
					</tr>
				<?php if($value['id_coa'] == 4){
					$pendapatan+=$akun['cash'];
				}else{
					$beban+=$akun['cash'];
				} ?>
				<?php endforeach ?>
				
			<?php endforeach ?>
			<tr>
					<td colspan="3"><hr style="height:1px;border:none;color:#333;background-color:#333;"></td>
			</tr>
			<tr>
					<td><b>Total </b></td>
					<td><b>
						<?php if($value['id_coa'] == 4){
							echo 'Rp. '.number_format($pendapatan,0,',','.');
						}else{
							echo 'Rp. '.number_format($beban,0,',','.');
						} ?>
					</b></td>
			</tr>
			<tr>
					<td colspan="3"><hr style="height:1px;border:none;color:#333;background-color:#333;"></td>
			</tr>
		<?php endforeach ?>
	</tbody>
	<tfoot>
		<tr>
			<td><b>Laba/Rugi Kotor (Sebelum Pajak)</b></td>
			<td><b class="<?php echo (($pendapatan-$beban)>0)?'text-success':'text-danger' ?>"><?php echo 'Rp. '.number_format(($pendapatan-$beban),0,',','.'); ?></b></td>
		</tr>
	</tfoot>
</table>