<b><?= $data_get['siswa']['nama'] ?> (<?= $data_get['siswa']['kelas'] ?>)</b>
<hr>
<form id="app-tanggungan" action="Penerimaan/save_tanggungan">
	<input type="hidden" value="<?php echo $data_get['siswa']['id_siswa'] ?>" name="idsiswa_fk">
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
			<input type="hidden" value="<?php echo $value['jenis_penerimaan']['id_jenis_penerimaan'] ?>" name="data[<?php echo $key ?>][id_jenis_penerimaan]">
			<tr>
				<td><?php echo (++$no) ?></td>
				<td><?php echo $value['jenis_penerimaan']['nama'] ?></td>
				<td>
					<div class="input-group">
						<span class="input-group-addon">Rp.</span>
						<input type="number" class="form-control" required="" value="<?= $value['tanggungan_siswa']['jumlah'] ?>" name="data[<?php echo $key ?>][jumlah]"></td>
					</div>
					
				</tr>
				<?php endforeach ?>
			</tbody>
		</table>
		<button style="margin-top: 2%" type="submit" class="btn btn-success"><i class="icon-floppy-disk"></i> Simpan Tanggungan</button>
	</form>