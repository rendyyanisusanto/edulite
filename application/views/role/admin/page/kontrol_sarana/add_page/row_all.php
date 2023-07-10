<?php foreach ($data_get['sarana'] as $key => $value): ?>
	<tr id="tr<?php echo $key; ?>">
		<td width="1%"><button class="btn btn-xs btn-danger btn-dl-item" data-rowid="<?php echo $key ?>" type="button"><i class="icon-trash"></i></button></td>
		<td>
			<b><input type="hidden" value="<?php echo $value['id_sarana'] ?>" name="detail[<?php echo $key ?>][idsarana_fk]"><?php echo $value['no_inventaris'].' - '.$value['sarana'] ?></b>
		</td>
		<td><input type="number" readonly="" required="" value="<?php echo $value['jumlah'] ?>" name="detail[<?php echo $key ?>][jumlah_awal]" class="form-control jumlah_awal<?php echo $key ?> inp-jml" ></td>
		<td><input type="number" required="" value="<?php echo $value['jumlah'] ?>" name="detail[<?php echo $key ?>][jumlah_akhir]" class="form-control jumlah_akhir<?php echo $key ?> inp-jml" ></td>
		<td>
			<select name="detail[<?php echo $key ?>][idkondisisarana_fk]" data-row="<?php echo $key ?>" class="form-control select-kondisisarana<?php echo $key ?>">
				<?php foreach ($data_get['kondisi_sarana'] as $value_sarana_asd): ?>
					<option <?php echo ($value['idkondisisarana_fk'] == $value_sarana_asd['id_kondisi_sarana']) ? "selected" : "" ; ?> value="<?= $value_sarana_asd['id_kondisi_sarana'] ?>"><?= $value_sarana_asd['kondisi_sarana'] ?></option>
				<?php endforeach ?>
			</select>
		</td>

		<td width="10%"><input type="text" name="detail[<?php echo $key ?>][keterangan]" class="form-control" class="form-control"></td>
	</tr>
<?php endforeach ?>