<b>Setting kelas <?= $data_get['kelas']['kelas'] ?></b>
<hr>
<form id="app-tanggungan" action="Penerimaan/save_tanggungan_kelas">
	<input type="hidden" value="<?php echo $data_get['kelas']['id_kelas'] ?>" name="id_kelas">
	<table class="table table-framed table-bordered table-xxs">
		<thead>
			<tr>
				<th>No</th>
				<th>Jenis Tanggungan</th>
				<th>Nominal</th>
			</tr>
		</thead>
		<tbody>
			<?php $no = 0; ?>
			<?php foreach ($data_get['jenis_penerimaan'] as $key => $value): ?>
			<input type="hidden" value="<?php echo $value['id_jenis_penerimaan'] ?>" name="data[<?php echo $key ?>][id_jenis_penerimaan]">
			<tr>
				<td><?php echo (++$no) ?></td>
				<td><?php echo $value['nama'] ?></td>
				<td>
					<div class="input-group">
						<span class="input-group-addon">Rp.</span>
						<input type="number" class="form-control" required="" name="data[<?php echo $key ?>][jumlah]"></td>
					</div>
					
				</tr>
				<?php endforeach ?>
			</tbody>
		</table>
		<button style="margin-top: 2%" type="submit" class="btn btn-success"><i class="icon-floppy-disk"></i> Simpan Tanggungan</button>
	</form>