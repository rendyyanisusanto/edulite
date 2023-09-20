<script src="<?php echo base_url('include/template/dashboard/')?>/js/core/libraries/jquery_ui/widgets.min.js"></script>
<div class="row">
	<div class="col-md-12">
		<button type="button"  class="btn btn-danger"><i class="icon-user"></i> <?php echo $user_groups['name'] ?></button>
		<button type="button" style="float: right;margin-left: 1%;" class="btn btn-info"><i class="icon-screen3"></i> <?php echo $this->agent->platform(); ?></button>
		<button type="button"  style="float: right;margin-left: 1%;" class="btn btn-success"><i class="icon-chrome"></i> <?php echo $this->agent->browser().' '.$this->agent->version() ?></button>
	</div>
</div>
<div class="row" style="margin-top: 5%;">
	<div class="stats"></div>
</div>
<div class="row">
	<div class="col-md-6">
		<div class="panel panel-body">
			<div class="row">
				<div class="col-md-12">
					<img src="<?= base_url('include/setting_website/img_about_us/'.$profil_website['img_about_us']); ?>" class="img img-responsive img-rounded" >
				</div>
				<div class="col-md-12" style="margin-top: 1%;">
					<table class="table table-bordered table-sm">
						<tr>
							<td class="bg-primary">Nama Sekolah</td>
							<td class="bg-info"><?= $profil_website['nama'] ?></td>
						</tr>
						<tr>
							<td class="bg-primary">Alamat</td>
							<td class="bg-info"><?= $profil_website['alamat'] ?></td>
						</tr>
						<tr>
							<td class="bg-primary">No. HP</td>
							<td class="bg-info"><?= $profil_website['no_hp'] ?></td>
						</tr>
						<tr>
							<td class="bg-primary">Kota</td>
							<td class="bg-info"><?= $profil_website['kota'] ?></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-3">
		<div class="row row-seamless btn-block-group">
			<div class="col-xs-6">
				<button type="button" class="btn btn-default btn-block btn-float btn-float-lg">
				<i class="icon-stats-bars2 text-warning-600"></i>
				<span>Statistik Sekolah</span>
				</button>
				<button type="button" class="btn btn-default btn-block btn-float btn-float-lg">
				<i class="icon-cash text-success-400"></i>
				<span>Laporan Keuangan</span>
				</button>
			</div>
			<div class="col-xs-6">
				<button type="button" class="btn btn-default btn-block btn-float btn-float-lg">
				<i class="icon-users text-blue"></i>
				<span>Data Siswa</span>
				</button>
				<button type="button" class="btn btn-default btn-block btn-float btn-float-lg">
				<i class="icon-user text-danger-400"></i>
				<span>Presensi Guru</span>
				</button>
			</div>
		</div>
		<div class="row" style="margin-top: 2%;">
			<div class="col-md-12">
				<div class="panel has-scroll">
					<div class="datepicker no-border"></div>
				</div>
			</div>
		</div>
		
	</div>
	<div class="col-md-3">
		<div class="row">
			<div class="panel panel-body">
								<div class="media no-margin stack-media-on-mobile">
									<div class="media-left media-middle">
										<i class="icon-lifebuoy icon-3x text-muted no-edge-top"></i>
									</div>

									<div class="media-body">
										<h6 class="media-heading text-semibold">Got a question or request?</h6>
										<span class="text-muted">Contact us directly</span>
									</div>

									<div class="media-right media-middle">
										<a href="https://api.whatsapp.com/send?phone=‪6283848498639‬" class="btn btn-primary">Contact</a>
									</div>
								</div>
							</div>
		</div>
		<div class="row">
			<div class="panel panel-flat">
				<div class="panel-heading">
					<h6 class="panel-title">Latest updates<a class="heading-elements-toggle"><i class="icon-more"></i></a></h6>
					<div class="heading-elements">
						<!-- <a href="#" class="heading-text">See all →</a> -->
					</div>
				</div>
				<div class="panel-body">
					<ul class="media-list">
						
						<li class="media">
							<div class="media-left">
								<a href="#" class="btn border-success text-success btn-flat btn-icon btn-rounded btn-sm">
									<i class="icon-checkmark3"></i>
								</a>
							</div>
							
							<div class="media-body">
								Perbaikan bug halaman upload siswa
								<div class="media-annotation">Apr 28, 21:39</div>
							</div>
						</li>
						<li class="media">
							<div class="media-left">
								<a href="#" class="btn border-success text-success btn-flat btn-icon btn-rounded btn-sm">
									<i class="icon-checkmark3"></i>
								</a>
							</div>
							
							<div class="media-body">
								Perbaikan tampilan halaman kesiswaan
								<div class="media-annotation">Apr 28, 21:39</div>
							</div>
						</li>
						<li class="media">
							<div class="media-left">
								<a href="#" class="btn border-success text-success btn-flat btn-icon btn-rounded btn-sm">
									<i class="icon-checkmark3"></i>
								</a>
							</div>
							
							<div class="media-body">
								Perbaikan bug halaman inventaris
								<div class="media-annotation">Apr 28, 21:39</div>
							</div>
						</li>
						<li class="media">
							<div class="media-left">
								<a href="#" class="btn border-success text-success btn-flat btn-icon btn-rounded btn-sm">
									<i class="icon-checkmark3"></i>
								</a>
							</div>
							
							<div class="media-body">
								Perbaikan halaman dashboard
								<div class="media-annotation">Apr 28, 21:39</div>
							</div>
						</li>
						<li class="media">
							<div class="media-left">
								<a href="#" class="btn border-success text-success btn-flat btn-icon btn-rounded btn-sm">
									<i class="icon-checkmark3"></i>
								</a>
							</div>
							
							<div class="media-body">
								Perbaikan bug halaman upload siswa
								<div class="media-annotation">Apr 28, 21:39</div>
							</div>
						</li>
						<li class="media">
							<div class="media-left">
								<a href="#" class="btn border-success text-success btn-flat btn-icon btn-rounded btn-sm">
									<i class="icon-checkmark3"></i>
								</a>
							</div>
							
							<div class="media-body">
								Perbaikan bug halaman upload siswa
								<div class="media-annotation">Apr 28, 21:39</div>
							</div>
						</li>
						<li class="media">
							<div class="media-left">
								<a href="#" class="btn border-success text-success btn-flat btn-icon btn-rounded btn-sm">
									<i class="icon-checkmark3"></i>
								</a>
							</div>
							
							<div class="media-body">
								Perbaikan bug halaman upload siswa
								<div class="media-annotation">Apr 28, 21:39</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(".datepicker").datepicker();
</script>