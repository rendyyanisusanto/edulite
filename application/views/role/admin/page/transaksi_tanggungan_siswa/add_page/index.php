<script src="<?php echo base_url('include/template/dashboard/')?>js/plugins/forms/selects/select2.min.js"></script>

<script src="<?php echo base_url('include/template/dashboard/')?>/js/plugins/tables/handsontable/handsontable.min.js"></script>
<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/simpan_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-6">
		<div class="panel panel-body">
			<div class="form-group">
              <label class="col-lg-3 control-label">Siswa:</label>
              <div class="col-lg-9">
                <select data-placeholder="Pilih Siswa" name="idsiswa_fk" class="select siswa">
				</select>
              </div>
            </div>
			<div class="form-group">
              <label class="col-lg-3 control-label">Kode:</label>
              <div class="col-lg-4">
                <input type="text" name="invoice" class="form-control invoice" required placeholder="Input here......">
              </div>
              <div class="col-lg-3">
	              	<button class="btn btn-xs btn-success" data-toggle="tooltip" onclick="reload_table('Transaksi_tanggungan_siswa','invoice','invoice');" data-placement="top" title="Reload Kode" type="button"><i class="icon-pencil7"></i></button>
	              	<button class="btn btn-xs btn-info" type="button" onclick="setting_table('Transaksi_tanggungan_siswa','invoice');" data-toggle="tooltip" data-placement="top" title="Setting Kode" ><i class="icon-cog3"></i></button>
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
	<div class="col-lg-6" style="background-color: gray; padding: 1%;height: 320px; overflow-y: auto;">
		<div class="content-siswa" ></div>
	</div>
</div>
<div class="row">
	<div class="col-md-12">

		<div class="panel panel-body">
			<b style="font-weight: bold;">Detail Pembayaran</b>
			<hr>
			

		<div class="hot-container">
			<div id="hot_headers"></div>
		</div>
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

<style>
	.handsontable .htCore {
		border-collapse: separate;
		border-spacing: 0;
		border: 1px solid #ccc;
		border-radius: 1px;
		overflow: hidden;
	}
	.ht_master .handsontable td {
		font-size: 16px !important;
		padding: 10px !important;
	}

	/* Header juga diperbesar */
	.ht_master .handsontable th {
		font-size: 16px !important;
		padding: 10px !important;
		background-color: #f0f0f0;
	}

	/* Kolom Jumlah diberi background terang */
	.highlight-jumlah {
		background-color: #e0f7fa !important;
		font-weight: bold;
	}
</style>