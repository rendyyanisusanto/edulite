<div class="row">
	<div class="col-md-4">
		<div class="panel panel-white">
			<div class="panel-heading">
				<h6 class="panel-title"><i class="icon-search4 position-left"></i> Cari Siswa</h6>
			</div>
			
			<div class="panel-body">
				<label>Nama/Nis/Nisn</label>
				<input type="text" name="find" id="find" class="form-control" placeholder="input here...">
				<button style="margin-top: 10px;" class="btn btn-success btn-find" type="button"><i class="icon-search4"></i> Cari</button>
			</div>
		</div>
		<div class="panel-result">
			
		</div>
		<!--  -->
	</div>
	<div class="col-md-8">
		<div class="col-md-12">
			<div class="panel panel-success panel-bordered">
				<div class="panel-heading">
					<h6 class="panel-title">Pembayaran SPP Bulanan</h6>
					<div class="heading-elements">
						<ul class="icons-list">
							<li><a data-action="collapse"></a></li>
							<li><a data-action="reload"></a></li>
							<li><a data-action="close"></a></li>
						</ul>
					</div>
				</div>
				<div class="panel-body">
					<div class="col-md-12">
						<div class="panel-data-siswa"></div>
					</div>
					<div class="col-md-12">
						<hr>
						<div class="panel panel-body">
							<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/simpan_data" id="app-submit" method="POST">
								<input type="hidden" class="id_siswa" name="idsiswa_fk">
				                <div class="form-group">
				                  <label class="col-lg-3 control-label">SPP Bulan/Tahun:</label>
				                  <div class="col-lg-3">
				                    <input type="number" name="bulan" class="form-control" required="" placeholder="Bulan......">
				                  </div>
				                  <div class="col-lg-3">
				                    <input type="number" name="tahun" class="form-control"  required="" placeholder="Tahun......">
				                  </div>
				                </div>

				                <div class="form-group">
				                  <label class="col-lg-3 control-label">Jumlah:</label>
				                  <div class="col-lg-6">
				                    <input type="number" name="jumlah_bayar" class="form-control"  required="" placeholder="Input here......">
				                  </div>
				                </div>

				                <div class="form-group">
				                  <label class="col-lg-3 control-label">Tanggal pembayaran:</label>
				                  <div class="col-lg-4">
				                    <input type="date" name="tanggal" class="form-control"  required="" value="<?php echo date("Y-m-d");?>" placeholder="Input here......">
				                  </div>
				                </div>
				                <button class="btn btn-success" type="submit"><i class="icon-spinner"></i> Proses</button>
 							</form>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</div>