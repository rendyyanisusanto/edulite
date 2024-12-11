
<div class="row">
	<div class="alert alert-success">
		<marquee>Hallo <b><?php echo $data_get['guru']['nama'] ?></b>, Selamat datang di aplikasi EDULITE milik SMK IT ASY SYADZILI. Hak akses anda saat ini adalah sebagai <b>BK</b></marquee>
	</div>
</div>

<div class="row" style="margin-bottom: 5%;">
	<div class="col-md-12">
		<center>
			<img src="<?php echo base_url('include/media/logo_new.png'); ?>" style="max-width: 250px;" class="img img-responsive">
		</center>
	</div>
</div>
<div class="row">
	<center><b>MENU YANG BISA DIAKSES</b></center>
	<br>
</div>
<div class="row">
	<div class="col-lg-3 col-md-6 col-sm-12" style="margin-bottom:1px;">
		<a href="Presensi_harian/presensi_siswa_masuk_pulang" class="btn btn-default btn-block app-item" ><i class="icon-magazine"></i> <br> <span>Presensi Siswa (Masuk-Pulang)</span></a>
	</div>
	<div class="col-lg-3 col-md-6 col-sm-12" style="margin-bottom:1px;">
		<a href="Buku_pemanggilan_siswa/get_data" class="btn btn-default btn-block app-item" ><i class="icon-magazine"></i> <br> <span>Pemanggilan Siswa</span></a>
	</div>
	<div class="col-lg-3 col-md-6 col-sm-12" style="margin-bottom:1px;">
		<a href="Alumni/get_data" class="btn btn-default btn-block app-item" ><i class="icon-magazine"></i> <br> <span>Alumni</span></a>
	</div>
	<div class="col-lg-3 col-md-6 col-sm-12" style="margin-bottom:1px;">
		<a href="auth/logout" class="btn btn-danger btn-block app-item" ><i class="icon-magazine"></i> <br> <span>Logout</span></a>
	</div>
</div>