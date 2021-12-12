<div class="row">
	<div class="col-sm-12 col-md-12">
		<!-- <img src="<?php echo base_url('include/media/default_image/bnew.jpeg'); ?>" style="width:100%;" class="img img-rounded" alt=""> -->
		<div class="panel">
			<div class="panel-body text-center">
				<a href="#" class="display-inline-block">
					<img src="<?php echo base_url('include/media/default_image/o.png'); ?>" class="img-circle img-responsive" alt="" style="width: 120px; height: 120px;">
				</a>

				<h6 class="text-semibold no-margin-bottom">
					<a href="#" class="text-default"><?php echo $data_get['siswa']['nama'] ?></a>
					<small class="display-block">Rp. <?php echo number_format($data_get['siswa']['saldo'],0 , '.', '.') ?></small>
				</h6>
			</div>

			<div class="panel-footer text-center no-padding">
				<div class="row">
					<div class="col-xs-4">
						<a href="bayar/get_data" class="display-block app-item p-10 text-default" data-popup="tooltip" data-placement="top" data-container="body" title="" data-original-title="Google Drive"><i class="icon-cash"></i></a>
					</div>

					

					<div class="col-xs-4">
						<a href="#" class="display-block p-10 text-default" data-popup="tooltip" data-placement="top" data-container="body" title="" data-original-title="Dribbble"><i class="icon-cog"></i></a>
					</div>
					<div class="col-xs-4">
						<a href="#" class="display-block p-10 text-default" data-popup="tooltip" data-placement="top" data-container="body" title="" data-original-title="Dribbble"><i class="icon-exit"></i></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="row row-seamless btn-block-group">
<div class="col-xs-12">
		<a href="Presensi/get_data" class="btn app-item btn-default btn-block btn-float btn-float-lg">
			<i class="icon-clipboard2 text-success-400"></i>
			<span>Presensi Siswa</span>
		</a>
</div>
	<div class="col-xs-6">
		<a href="Transaksi/get_data" class="btn app-item btn-default btn-block btn-float btn-float-lg">
			<i class="icon-drawer-out text-warning-600"></i>
			<span>Transaksi</span>
		</a>

		<a href="Transaksi/tanggungan" class="btn app-item btn-default btn-block btn-float btn-float-lg">
			<i class=" icon-cash2 text-blue"></i>
			<span>Tanggungan Siswa</span>
		</a>
	</div>

	<div class="col-xs-6">
		<a href="" class="btn btn-default btn-block btn-float btn-float-lg">
			<i class=" icon-clipboard3 text-blue"></i>
			<span>E-Rapor</span>
		</a>

		<a href="Catatan/get_data"  class="btn app-item btn-default btn-block btn-float btn-float-lg">
			<i class="icon-list text-danger-400"></i>
			<span>Catatan Siswa</span>
		</a>
	</div>
</div>