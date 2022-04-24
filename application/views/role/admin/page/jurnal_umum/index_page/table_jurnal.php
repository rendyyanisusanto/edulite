<style type="text/css">
	tr.noBorder td {
	  border: 0;
	}
	table {
		font-size: 11px !important;
		font-family: "consolas";
	}
</style>
<table class="table table-bordered table-framed table-xxs">
	<thead>
		<tr>
			<th>Kode Ref</th>
			<th>Keterangan</th>
			<th>Akun</th>
			<th width="12%">Debit</th>
			<th width="12%">Kredit</th>
		</tr>
	</thead>
	<tbody>
		<?php if (!empty($data_get['find'])){ ?>
			<?php $tmp_ref = '' ?>
			<?php $debit = 0; ?>
			<?php $kredit = 0; ?>
			<?php foreach ($data_get['find'] as $key => $value): ?>
				<tr>
					<?php $debit 	+= $value['data']['debit'] ?>
					<?php $kredit 	+= $value['data']['kredit'] ?>
					<?php if ($tmp_ref !== $value['data']['ref'] ): ?>
					<td rowspan="<?php echo $value['count'] ?>"><?php echo $value['data']['ref'] ?></td>
					<td rowspan="<?php echo $value['count'] ?>"><?php echo $value['data']['keterangan'] ?></td>
					<?php endif ?>
					<td><?php echo $value['akun']['no_ref'].' - '.$value['akun']['nama'] ?></td>
					<td><?php echo ($value['data']['debit'] > 0)?'<b class="text-success">Rp. '.number_format($value['data']['debit'],0,',','.').'</b>':'<b class="text-danger">Rp. 0</b>'; ?></td>
					<td><?php echo ($value['data']['kredit'] > 0)?'<b class="text-success">Rp. '.number_format($value['data']['kredit'],0,',','.').'</b>':'<b class="text-danger">Rp. 0</b>'; ?></td>
					<?php $tmp_ref = $value['data']['ref'] ?>
				</tr>
			<?php endforeach ?>
			<tr>
				<td colspan="2"></td>
				<td><?php echo ($debit == $kredit)?'<b class="text-success">(Balanced)</b>':'<b class="text-danger">(Not Balanced)</b>'; ?></td>
				<td><b>Total = <?php echo 'Rp. '.number_format($debit,0,',','.'); ?></b></td>
				<td><b>Total = <?php echo 'Rp. '.number_format($kredit,0,',','.'); ?></b></td>
			</tr>
		<?php }else{
			echo "<tr><td colspan='5'><center><b class='text-danger'>Tidak ada data</b></center></td></tr>";
		} ?>
		
	</tbody>
</table>