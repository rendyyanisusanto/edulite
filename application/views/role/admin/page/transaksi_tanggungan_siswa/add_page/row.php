<tr id="tr<?php echo $data_get['rand']; ?>">
	<td width="1%"><button class="btn btn-xs btn-danger btn-dl-item" data-rowid="<?php echo $data_get['rand']; ?>" type="button"><i class="icon-trash"></i></button></td>
	<td>
		
		<select name="detail[<?php echo $data_get['rand']; ?>][idjenispenerimaan_fk]" data-row="<?php echo $data_get['rand']; ?>" class="form-control select-tanggungan" >
			<option value=""> -- Pilih --</option>
			<?php foreach ($data_get['tanggungan'] as $value): ?>
				<option data-jumlah="<?= number_format($value['jumlah'],0,'.','.'); ?>" data-bulanan="<?= $value['bulanan'];?>"  data-sisa="<?= number_format(($value['jumlah'] - $value['pembayaran']), 0, '.', '.'); ?>" value="<?= $value['id_jenis_penerimaan'] ?>"><?= $value['nama'] ?></option>
			<?php endforeach ?>
		</select>
		<br>
		<div class="periode<?php echo $data_get['rand']; ?>" style="display: none;">
			<b>Periode : </b>
			<input type="month" class="form-control" name="detail[<?php echo $data_get['rand']; ?>][periode]" >
		</div>
	</td>
	<td width="10%"><input type="text" disabled="" class="form-control total<?php echo $data_get['rand']; ?>"></td>
	<td width="10%"><input type="text" disabled="" class="form-control sisa<?php echo $data_get['rand']; ?>"></td>
	<td>
		<input type="number" required="" name="detail[<?php echo $data_get['rand']; ?>][jumlah]" class="form-control txtjml<?php echo $data_get['rand']; ?> inp-jml" >
		<input type="hidden" name="detail[<?php echo $data_get['rand']; ?>][bulanan]" class="bulanan<?php echo $data_get['rand']; ?> ">
	</td>
</tr>
