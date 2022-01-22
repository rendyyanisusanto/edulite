<div class="col-md-6">
	<div class="panel panel-body">
		<table class="table table-framed table-xxs">
			<tr>
				<td>NIS</td>
				<td width="1%">:</td>
				<td><?= $data_get['siswa']['nis'] ?></td>
			</tr>
			<tr>
				<td>Nama</td>
				<td width="1%">:</td>
				<td><?= $data_get['siswa']['nama'] ?></td>
			</tr>
			<tr>
				<td>Jurusan</td>
				<td width="1%">:</td>
				<td><?= $data_get['siswa']['jurusan'] ?></td>
			</tr>
			<tr>
				<td>Kelas</td>
				<td width="1%">:</td>
				<td><?= $data_get['siswa']['kelas'] ?></td>
			</tr>
		</table>
		<hr>
		<form action="Penerimaan/save_transaksi" method="POST" id="app-submit">
		<input type="hidden" name="idsiswa_fk" value="<?= $data_get['siswa']['id_siswa'] ?>">
		<label>Jenis Pembayaran</label>
		<select class="form-control jenis_penerimaan" required  name="idjenispenerimaan_fk">
			<option value="">Pilih Jenis Pembayaran</option>
			<?php foreach ($data_get['jenis_penerimaan'] as $value): ?>
				<option value="<?= $value['id_jenis_penerimaan'] ?>"><?= $value['nama'] ?></option>
			<?php endforeach ?>
		</select>
		<br>
		<label>Invoice</label>
		<input type="text" class="form-control invoice" placeholder="Tambahkan invoice disini ..." name="invoice">
		<br>

		<label>Metode Pembayaran : </label>
		<input type="radio"  name="metode_pembayaran" value="Tunai" checked=""> Langsung[Tunai]
		<input type="radio"  name="metode_pembayaran"  value="Transfer"> Rekening[Transfer]
		<br>
		<label>Catatan</label>
		<input type="text" class="form-control" placeholder="Tambahkan catatan disini ..." name="catatan">
		<br>
		<label>Tanggal</label>
		<input type="date" name="tanggal"  required class="form-control">
		<br>
		<label>Jumlah Bayar</label>
		<div class="input-group">
			<span class="input-group-addon">Rp.</span>
			<input type="text" name="jumlah" required value="0" class="form-control jumlah">
		</div>
		
		<br>
		<label>Diskon</label>
		<div class="input-group">
			<span class="input-group-addon">Rp.</span>
			<input type="text" name="diskon" required value="0" class="form-control diskon">
		</div>
		
		<br>

		<button class="btn btn-success btn-submit" type="submit"><i class="icon-floppy-disk"></i> Simpan Transaksi</button>
		</form>
	</div>
</div>