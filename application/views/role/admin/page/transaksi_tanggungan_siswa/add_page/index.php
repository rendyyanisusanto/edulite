<script src="<?php echo base_url('include/template/dashboard/')?>js/plugins/forms/selects/select2.min.js"></script>
<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/simpan_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-8">
		<div class="panel panel-body">
			
			<div class="form-group">
              <label class="col-lg-3 control-label">Kode:</label>
              <div class="col-lg-4">
                <input type="text" name="invoice" value="P<?php echo rand(0,9999999) ?>" class="form-control" required placeholder="Input here......">
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-3 control-label">Tanggal:</label>
              <div class="col-lg-4">
                <input type="date" name="tanggal" value="P<?php echo rand(0,9999999) ?>" class="form-control" required placeholder="Input here......">
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-3 control-label">Keterangan:</label>
              <div class="col-lg-9">
                <input type="text" name="catatan" class="form-control" required placeholder="Input here......">
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-3 control-label">Siswa:</label>
              <div class="col-lg-9">
                <select data-placeholder="Pilih Siswa" name="idsiswa_fk" class="select siswa">
				</select>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-3 control-label">Metode Pembayaran:</label>
              <div class="col-lg-4">
                <select name="metode_pembayaran" class="form-control">
                	<option value="TUNAI">Tunai</option>
                	<option value="TRANSFER">Transfer</option>
				</select>
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
						<th width="10%">Total</th>
						<th width="10%">Sisa</th>
						<th width="15%">Jumlah(Rp.)</th>
					</tr>
				</thead>
				<tbody>
					<tr class="empty-data">
						<td colspan="5"><center><b>Data masih kosong</b></center></td>
					</tr>
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
							<a href="Transaksi_tanggungan_siswa/get_data" class="app-item btn btn-danger"><i class="icon-arrow-left7"></i> Kembali</a>
							<button type="submit" class="btn btn-success"><i class="icon-floppy-disk"></i> Simpan</button>
						</div>
					</div>
		</div>
	</div>
</div>

</form>