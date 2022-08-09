<tr id="tr<?php echo $data_get['rand']; ?>">
	<td width="1%"><button class="btn btn-xs btn-danger btn-dl-item" data-rowid="<?php echo $data_get['rand']; ?>" type="button"><i class="icon-trash"></i></button></td>
	<td>
		<!--  -->
		<select name="detail[<?php echo $data_get['rand']; ?>][idjenispenerimaan_fk]" data-row="<?php echo $data_get['rand']; ?>" class="form-control select-tanggungan">
			<?php foreach ($data_get['tanggungan'] as $value): ?>
				<option data-jumlah="<?= number_format($value['jumlah'],0,'.','.'); ?>" data-sisa="<?= number_format(($value['jumlah'] - $value['pembayaran']), 0, '.', '.'); ?>" value="<?= $value['id_jenis_penerimaan'] ?>"><?= $value['nama'] ?></option>
			<?php endforeach ?>
		</select>
	</td>
	<td width="10%"><input type="text" disabled="" class="form-control total<?php echo $data_get['rand']; ?>"></td>
	<td width="10%"><input type="text" disabled="" class="form-control sisa<?php echo $data_get['rand']; ?>"></td>
	<td><input type="number" required="" name="detail[<?php echo $data_get['rand']; ?>][jumlah]" class="form-control txtjml<?php echo $data_get['rand']; ?> inp-jml" ></td>
</tr>