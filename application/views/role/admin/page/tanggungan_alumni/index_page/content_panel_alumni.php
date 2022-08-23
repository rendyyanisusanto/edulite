<hr>
<form action="Tanggungan_alumni/simpan_data" id="app-submit-tanggungan" method="POST">
<b>Tanggungan Alumni</b>
<br>
Akun : 
<br>

<select class="form-control input-xxs" name="idjenispenerimaan_fk">
	<?php foreach ($data_get['jenis_penerimaan'] as $value): ?>
		<option value="<?= $value['id_jenis_penerimaan'] ?>"><?= $value['nama'] ?></option>
	<?php endforeach ?>
</select>
<table style="margin-top: 2%;" class="table table-xxs table-framed table-bordered">
	<thead>
		<tr>
			<th width="1%">#</th>
			<th>Nama</th>
			<th>Jumlah</th>
		</tr>
	</thead>
	<tbody>
		<?php foreach ($data_get['tanggungan_alumni'] as $value): ?>
			<tr>
				<td></td>
				<td><?= $value['keterangan'] ?></td>
				<td><?= $value['jumlah'] ?></td>
			</tr>
		<?php endforeach ?>
		<tr>
				<input type="hidden" class="id_alumni" name="id_alumni" value="<?= $data_get['alumni']['id_alumni'] ?>">
				<td><button class="btn btn-xs btn-success" type="submit"><i class="icon-check"></i></button></td>
				<td><input type="text" class="form-control" required="" name="keterangan"></td>
				<td><input type="number" class="form-control" required="" name="jumlah"></td>
			
		</tr>
	</tbody>
</table>
</form>
</div>