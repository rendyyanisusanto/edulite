<tr id="tr<?php echo $data_get['rand']; ?>">
	<td width="1%"><button class="btn btn-xs btn-danger btn-dl-item" data-rowid="<?php echo $data_get['rand']; ?>" type="button"><i class="icon-trash"></i></button></td>
	<td>
		<select name="detail[<?php echo $data_get['rand']; ?>][idsarana_fk]" data-row="<?php echo $data_get['rand']; ?>" onchange="get_item(<?php echo $data_get['rand']; ?>);" class="form-control select-sarana<?php echo $data_get['rand']; ?>">
			<?php foreach ($data_get['sarana'] as $value): ?>
				<option value="<?= $value['id_sarana'] ?>"><?= $value['no_inventaris'].' - '.$value['sarana'] ?></option>
			<?php endforeach ?>
		</select>
	</td>
	<td><input type="number" readonly="" required="" name="detail[<?php echo $data_get['rand']; ?>][jumlah_awal]" class="form-control jumlah_awal<?php echo $data_get['rand']; ?> inp-jml" ></td>
	<td><input type="number" required="" name="detail[<?php echo $data_get['rand']; ?>][jumlah_akhir]" class="form-control jumlah_akhir<?php echo $data_get['rand']; ?> inp-jml" ></td>
	<td>
		<select name="detail[<?php echo $data_get['rand']; ?>][idkondisisarana_fk]" data-row="<?php echo $data_get['rand']; ?>" class="form-control select-kondisisarana<?php echo $data_get['rand']; ?>">
			<?php foreach ($data_get['kondisi_sarana'] as $value): ?>
				<option value="<?= $value['id_kondisi_sarana'] ?>"><?= $value['kondisi_sarana'] ?></option>
			<?php endforeach ?>
		</select>
	</td>

	<td width="10%"><input type="text" required="" name="detail[<?php echo $data_get['rand']; ?>][keterangan]" class="form-control" class="form-control"></td>
</tr>