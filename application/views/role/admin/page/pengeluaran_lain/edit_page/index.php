
<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/update_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-8">
		<div class="panel panel-body">
			<div class="form-group">
              <label class="col-lg-3 control-label">Kode:</label>
              <div class="col-lg-4">
              	<input type="hidden" name="id_pengeluaran_lain" value="<?= $data_get['pengeluaran_lain']['id_pengeluaran_lain'] ?>">
                <input type="text" name="trans_code" value="<?= $data_get['pengeluaran_lain']['trans_code'] ?>" class="form-control" required placeholder="Input here......">
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-3 control-label">Tanggal:</label>
              <div class="col-lg-4">
                <input type="date" name="tanggal" value="<?= $data_get['pengeluaran_lain']['tanggal'] ?>" class="form-control" required placeholder="Input here......">
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-3 control-label">Akun Kas:</label>
              <div class="col-lg-4">
                <select class="form-control" name="jenis_kas">
                	<?php foreach ($data_get['akun_kas'] as $value): ?>
                		<option <?= ($data_get['pengeluaran_lain']['jenis_kas'] == $value['id_akun']) ? "selected" : "" ; ?> value="<?= $value['id_akun'] ?>"><?= "[".$value['no_ref']."] ".$value['nama'] ?></option>
                	<?php endforeach ?>
                </select>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-3 control-label">Jenis Pengeluaran:</label>
              <div class="col-lg-4">
                <select class="form-control" name="jenis">
                	<?php foreach ($data_get['akun_beban'] as $value): ?>
                		<option <?= ($data_get['pengeluaran_lain']['jenis'] == $value['id_akun']) ? "selected" : "" ; ?> value="<?= $value['id_akun'] ?>"><?= "[".$value['no_ref']."] ".$value['nama'] ?></option>
                	<?php endforeach ?>
                </select>

              </div>
              <b class="col-lg-5 text-danger">*(Pilihan jenis akan berpengaruh ke akun keuangan)</b>
            </div>
            
            <div class="form-group">
              <label class="col-lg-3 control-label">Keperluan:</label>
              <div class="col-lg-9">
                <input type="text" name="keterangan" value="<?= $data_get['pengeluaran_lain']['keterangan'] ?>" class="form-control" required placeholder="Input here......">
              </div>
            </div>

		</div>
	</div>
	<div class="col-lg-4">
		
	</div>
</div>
<div class="row">
	<div class="col-md-12">

		<div class="panel panel-body">
			<button class="btn btn-primary btn-add" type="button" style="margin-bottom: 1%;"><i class="icon-plus3"></i> Tambah data</button>
			<table class="table table-framed tbl-cart">
				<thead>
					<tr>
						<th width="2%">#</th>
						<th width="30%">Keterangan</th>
						<th width="15%">Jumlah(Rp.)</th>
					</tr>
				</thead>
				<tbody>
					<?php if (!empty($data_get['detail_pengeluaran_lain'])){ ?>
						<?php foreach ($data_get['detail_pengeluaran_lain'] as $value): ?>
							<?php $no = rand(0,99999); ?>
							<tr id="tr<?= $no ?>">
								<td><button class="btn btn-xs btn-danger btn-dl-item" data-rowid="<?= $no ?>" type="button"><i class="icon-trash"></i></button></td>
								<td><input type="text" name="detail[<?= $no ?>][keterangan]" value="<?= $value['keterangan'] ?>" class="form-control"></td>
								<td><input type="number" name="detail[<?= $no ?>][jumlah]" value="<?= (int)$value['jumlah'] ?>"  class="form-control inp-jml" ></td>
							</tr>
						<?php endforeach ?>
						
					<?php }else{ ?>
					<tr class="empty-data">
						<td colspan="3"><center><b>Data masih kosong</b></center></td>
					</tr>
					<?php } ?>
				</tbody>
			</table>
			<br>
			<input type="hidden" name="total" class="total">
			<b class="text-danger text-total" style="font-size: 20px;">Total : Rp.0</b>
			<hr style="border-top: 1.4px dashed  red;">
					<div class="col-md-3">
						<b>Key Map</b>
						<ul>
							<li><b>SHIFT</b> : Pencarian Produk</li>
							<li><b>F10</b> : Simpan Transaksi</li>
						</ul>
					</div>
					<div class="col-md-9" >
						<div style="float: right;">
							<a href="Kartu_stok/get_data" class="app-item btn btn-danger"><i class="icon-arrow-left7"></i> Kembali</a>
							<button type="submit" class="btn btn-success"><i class="icon-floppy-disk"></i> Simpan</button>
						</div>
					</div>
		</div>
	</div>
</div>

</form>