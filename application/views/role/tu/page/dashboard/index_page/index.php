
<script src="<?php echo base_url('include/template/dashboard/') ?>js/plugins/visualization/echarts/echarts.min.js"></script>
<div class="row">
	<div class="alert alert-success">
		<marquee>Hallo <b><?php echo $data_get['guru']['nama'] ?></b>, Selamat datang di aplikasi EDULITE milik SMK IT ASY SYADZILI. Hak akses anda saat ini adalah sebagai <b>TU dan Administrasi</b></marquee>
	</div>
</div>
<div class="row">
	<div class="col-sm-6 col-md-3" >
	<div class="panel panel-body bg-blue-400 has-bg-image">
		<div class="media no-margin">
			<div class="media-body">
				<h5 class="no-margin text-semibold pendapatan"><?= $data_get['total_pegawai'] ?></h5>
				<span class="text-uppercase  text-muted">Jumlah Pegawai</span>
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
				<h5 class="no-margin text-semibold"><?= $data_get['buku_tamu'] ?></h5>
				<span class="text-uppercase text-size-mini text-muted">Tamu Hari ini</span>
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
				<h5 class="no-margin text-semibold"><?= $data_get['surat_masuk'] ?></h5>
				<span class="text-uppercase text-size-mini text-muted">Surat Masuk Hari Ini</span>
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
				<h5 class="no-margin text-semibold"><?= $data_get['surat_keluar'] ?></h5>
				<span class="text-uppercase text-size-mini text-muted">Surat Keluar Hari Ini</span>
			</div>
			<div class="media-right media-middle">
				<i class="icon-user icon-3x text-white-400"></i>
			</div>
		</div>
	</div>
</div>
</div>

<div class="row">
	<div class="col-md-4">
		<div class="content-group">
			<div class="panel-body bg-blue border-radius-top text-center" style="background-image: url(https://media.istockphoto.com/vectors/abstract-white-background-vector-id1143662580?b=1&k=6&m=1143662580&s=612x612&w=0&h=nHS1tx7rQOvyFnYh9Iwfd39Q2wctjNPNK6YjYhBEykY=); background-size: cover;">
				<div class="content-group-sm">
					<h5 class="text-semibold no-margin-bottom text-blue">
					<?php echo $data_get['guru']['nama'] ?>
					</h5>
					<span class="display-block text-blue"><?php echo $data_get['guru']['jabatan'] ?></span>
				</div>
				<a href="#" class="display-inline-block content-group-sm">
					<img src="<?php echo (!empty($data_get['guru']['foto'])) ? base_url('include/media/foto_pegawai/'.$data_get['guru']['foto']) : base_url('include/media/system/no_image.jpg')?>" class="img-responsive img-rounded" alt="" style="max-height :200px;"	>
				</a>
			</div>
			<div class="panel panel-body no-border-top no-border-radius-top">
				<div class="form-group no-margin-bottom">
					<label class="text-semibold">NIP:</label>
					<span class="pull-right-sm"><?php echo $data_get['guru']['nip'] ?></span>
				</div>
				<div class="form-group  no-margin-bottom">
					<label class="text-semibold">Nama Lengkap:</label>
					<span class="pull-right-sm"><?php echo $data_get['guru']['nama'] ?></span>
				</div>
				<div class="form-group no-margin-bottom">
					<label class="text-semibold">No. Hp:</label>
					<span class="pull-right-sm"><?php echo $data_get['guru']['no_hp'] ?></span>
				</div>
				<div class="form-group no-margin-bottom">
					<label class="text-semibold">Corporate Email:</label>
					<span class="pull-right-sm"><a href="#"><?php echo $data_get['guru']['email'] ?></a></span>
				</div>
				<div class="form-group no-margin-bottom">
					<label class="text-semibold">Wali Kelas:</label>
					<span class="pull-right-sm"><b>
						<?php foreach ($data_get['walas'] as $key => $value): ?>
							<?php echo $value['kelas'] ?>, 
						<?php endforeach ?>
					</b></span>
				</div>
				
			</div>
		</div>
	</div>
	<div class="col-md-8">
		<div class="col-md-12">
			<div class="panel panel-body" style="min-height: 350px;">
				<b>Jumlah Tamu</b>

				<br>
				<div class="chart-container">
					<div class="chart has-fixed-height" id="line_values"></div>
				</div>
				
			
			</div>

		</div>
	</div>
</div>
