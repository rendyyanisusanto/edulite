<div class="col-sm-6 col-md-3" >
	<div class="panel panel-body bg-blue-400 has-bg-image">
		<div class="media no-margin">
			<div class="media-body">
				<h5 class="no-margin text-semibold pendapatan">Rp. <?php echo number_format($data_get['pendapatan_hari_ini'],0,',','.') ?></h5>
				<span class="text-uppercase  text-muted">Pendapatan Hari Ini</span>
			</div>
			<div class="media-right media-middle">
				<i class="icon-coin-dollar icon-3x text-white-400"></i>
			</div>
		</div>
	</div>
</div>
<div class="col-sm-6 col-md-3">
	<div class="panel panel-body bg-blue-400 has-bg-image">
		<div class="media no-margin">
			<div class="media-body">
				<h5 class="no-margin text-semibold">Rp. <?php echo number_format($data_get['pendapatan_total'],0,',','.') ?></h5>
				<span class="text-uppercase text-size-mini text-muted">Total Pendapatan</span>
			</div>
			<div class="media-right media-middle">
				<i class="icon-wallet icon-3x text-white-400"></i>
			</div>
		</div>
	</div>
</div>
<div class="col-sm-6 col-md-3">
	<div class="panel panel-body bg-danger-400 has-bg-image">
		<div class="media no-margin">
			<div class="media-body">
				<h5 class="no-margin text-semibold"><?php echo $data_get['siswa_total'] ?></h5>
				<span class="text-uppercase text-size-mini text-muted">Total Siswa</span>
			</div>
			<div class="media-right media-middle">
				<i class="icon-users icon-3x text-white-400"></i>
			</div>
		</div>
	</div>
</div>
<div class="col-sm-6 col-md-3">
	<div class="panel panel-body bg-danger-400 has-bg-image">
		<div class="media no-margin">
			<div class="media-body">
				<h5 class="no-margin text-semibold"><?php echo $data_get['guru_total'] ?></h5>
				<span class="text-uppercase text-size-mini text-muted">Total Guru</span>
			</div>
			<div class="media-right media-middle">
				<i class="icon-user icon-3x text-white-400"></i>
			</div>
		</div>
	</div>
</div>