
<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/update_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-8">
		<div class="panel panel-body">
			<input type="hidden" name="id_pemasukan_lain" value="<?= $data_get['pemasukan_lain']['id_pemasukan_lain'] ?>">
			<div class="form-group">
              <label class="col-lg-3 control-label">Kode:</label>
              <div class="col-lg-4">
                <input type="text" name="trans_code" value="<?php echo $data_get['pemasukan_lain']['trans_code']; ?>" class="form-control trans_code" required placeholder="Input here......">
              </div>
              <div class="col-lg-3">
	              	<button class="btn btn-xs btn-success" data-toggle="tooltip" onclick="reload_table('pemasukan_lain','trans_code','trans_code');" data-placement="top" title="Reload Kode" type="button"><i class="icon-pencil7"></i></button>
	              	<button class="btn btn-xs btn-info" type="button" onclick="setting_table('pemasukan_lain','trans_code');" data-toggle="tooltip" data-placement="top" title="Setting Kode" ><i class="icon-cog3"></i></button>
	              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-3 control-label">Tanggal:</label>
              <div class="col-lg-4">
                <input type="date" name="tanggal" value="<?php echo $data_get['pemasukan_lain']['tanggal']; ?>" class="form-control" required placeholder="Input here......">
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-3 control-label">Akun Kas:</label>
              <div class="col-lg-4">
                <select class="form-control" name="akun_kas">
                	<?php foreach ($data_get['akun_kas'] as $value): ?>
                		<option <?= ($data_get['pemasukan_lain']['akun_kas'] == $value['id_akun']) ? "selected" : "" ; ?> value="<?= $value['id_akun'] ?>"><?= "[".$value['no_ref']."] ".$value['nama'] ?></option>
                	<?php endforeach ?>
                </select>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-3 control-label">Akun Beban:</label>
              <div class="col-lg-4">
                <select class="form-control" name="akun_beban">
                	<?php foreach ($data_get['akun_beban'] as $value): ?>
                		<option <?= ($data_get['pemasukan_lain']['akun_beban'] == $value['id_akun']) ? "selected" : "" ; ?> value="<?= $value['id_akun'] ?>"><?= "[".$value['no_ref']."] ".$value['nama'] ?></option>
                	<?php endforeach ?>
                </select>
              </div>
            </div>

            <div class="form-group">
              <label class="col-lg-3 control-label">Keterangan:</label>
              <div class="col-lg-9">
                <input type="text" name="keterangan" value="<?php echo $data_get['pemasukan_lain']['keterangan']; ?>" class="form-control" required placeholder="Input here......">
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
					<?php if (!empty($data_get['detail_pemasukan_lain'])){ ?>
						<?php foreach ($data_get['detail_pemasukan_lain'] as $value): ?>
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
							<a href="pemasukan_lain/get_data" class="app-item btn btn-danger"><i class="icon-arrow-left7"></i> Kembali</a>
							<button type="submit" class="btn btn-success"><i class="icon-floppy-disk"></i> Simpan</button>
						</div>
					</div>
		</div>
	</div>
</div>

</form>