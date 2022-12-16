<div class="panel panel-body">
	<div class="row">
		<div class="col-md-4">
			<table class="table table-bordered table-xs">
				<tr>
					<td class="bg-primary-800">No. Peminjaman</td>
					<td colspan="2"  class="bg-primary"><?= $data_get['peminjaman_sarana']['no_peminjaman_sarana'] ?></td>
				</tr>
				<tr>
					<td class="bg-primary-800">Nama</td>
					<td colspan="2"  class="bg-primary"><?= $data_get['table_pemohon']['nama'] ?></td>
				</tr>
				<tr>
					<td class="bg-primary-800">Tanggal Peminjaman</td>
					<td colspan="2"  class="bg-primary"><?= date_format(date_create($data_get['peminjaman_sarana']['tanggal_mulai']), "d-M-y").' s/d '.date_format(date_create($data_get['peminjaman_sarana']['tanggal_selesai']), "d-M-y") ?></td>
				</tr>
				<tr>
					<td class="bg-primary-800">No. Pengembalian</td>
					<td class="bg-primary"><input type="text" value="<?= rand(0,9999999); ?>" name="no_pengembalian_sarana" class="form-control no_pengembalian_sarana">
					<td>
						<button class="btn btn-xs btn-success" data-toggle="tooltip" onclick="reload_table('pengembalian_sarana','trans_code','no_pengembalian_sarana');" data-placement="top" title="Reload Kode" type="button"><i class="icon-pencil7"></i></button>
	              		<button class="btn btn-xs btn-info" type="button" onclick="setting_table('pengembalian_sarana','trans_code');" data-toggle="tooltip" data-placement="top" title="Setting Kode" ><i class="icon-cog3"></i></button>
					</td>
	              	
	              
					</td>
				</tr>
				<tr>
					<td class="bg-primary-800">Tanggal Kembali</td>
					<td colspan="2"  class="bg-primary"><input type="date" value="<?= date('Y-m-d'); ?>" name="tanggal_kembali" class="form-control"></td>
				</tr>
				<tr>
					<td class="bg-primary-800">Kelengkapan</td>
					<td  colspan="2" class="bg-primary">
						<select class="form-control" required="" name="is_complete">
							<option value="">-- Pilih --</option>
							<option value="1">Lengkap</option>
							<option value="0">Tidak Lengkap</option>
						</select>
					</td>
				</tr>
			</table>

			
		</div>	
		<div class="col-md-12">
			<hr>

			<table class="table table-bordered table-framed table-xxs tbl-cart" style="width: 100%;">
				<thead>
					<tr>
						<th width="1%">#</th>
						<th width="10%">Sarana</th>
						<th width="10%">Jumlah Kembali</th>
						<th width="10%">Kondisi Awal</th>
						<th width="10%">Kondisi Kembali</th>
						<th width="30%">Keterangan</th>
					</tr>
				</thead>
				<tbody>
					<?php 
					$no = 0;
					foreach ($data_get['sarana'] as $value): 
					$rand = rand(0,99999);
					?>
						<tr>
							<td><?= ++$no; ?></td>
							<td><?= $value['sarana']['sarana'] ?><input class="form-control" type="hidden" value="<?= $value['sarana']['id_sarana'] ?>" required name="detail[<?php echo $rand; ?>][idsarana_fk]"></td>
							<td><input class="form-control" type="number" value="<?= $value['detail']['jumlah'] ?>" required name="detail[<?php echo $rand; ?>][jumlah]"></td>
							<td><?= $value['kondisi']['kondisi_sarana'] ?></td>
							<td>
								<select name="detail[<?php echo $rand; ?>][idkondisisarana_fk]" required="" class="form-control">
									<option value=""> -- Pilih --</option>
									<?php foreach ($data_get['kondisi_sarana'] as $value_kondisi): ?>
											<option style="color:<?= $value_kondisi['warna'] ?>;font-weight: bold;" <?= ($value_kondisi['id_kondisi_sarana'] == $value['kondisi']['id_kondisi_sarana']) ? "selected":""; ?> value="<?= $value_kondisi['id_kondisi_sarana'] ?>"><?= $value_kondisi['kondisi_sarana'] ?></option>
									<?php endforeach ?>
								</select>
							</td>
							<td><input type="text" class="form-control" name="detail[<?php echo $rand; ?>][keterangan]"></td>
						</tr>
					<?php endforeach ?>
				</tbody>
			</table>

			<br>
			<div class="alert alert-warning"><b>Info : </b>Kondisi sarana secara otomatis akan terupdate sesuai dengan kondisi terakhir dari pengembalian ini</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<hr>
			<a href="<?php echo $data_get['param']['table'] ?>/get_data" class="app-item btn btn-danger"><i class="icon-arrow-left7"></i> Kembali</a>
			<button class="btn btn-success btn-sm" type="submit"><i class="icon-floppy-disk"></i> Simpan Data</button>
		</div>
	</div>
</div>