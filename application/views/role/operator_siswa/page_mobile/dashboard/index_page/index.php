
<div class="row">
	<div class="alert alert-success">
		<marquee>Hallo <b><?php echo $data_get['guru']['nama'] ?></b>, Selamat datang di aplikasi EDULITE milik SMK IT ASY SYADZILI. Hak akses anda saat ini adalah sebagai <b>OPERATOR</b></marquee>
	</div>
</div>
<div class="row" style="margin-bottom: 15%;">
	<div class="col-md-12">
		<center>
			<img src="<?php echo base_url('include/media/logo_new.png'); ?>" style="max-width: 150px;" class="img img-responsive">
		</center>
	</div>
</div>
<div class="row">
	<div class="col-xs-6">
		<div class="panel panel-body" style="border-radius: 10%;">
			<b>Ijin Hari Ini : <?= $data_get['ijin_hari_ini'] ?></b>
		</div>
	</div>
	<div class="col-xs-6">
		<div class="panel panel-body" style="border-radius: 10%;">
			
			<b>Total Ijin : <?= $data_get['total_ijin'] ?></b>
		</div>
	</div>
</div>
<div class="row" style="margin-bottom:2%;">

<style type="text/css">
	.tbl tr td{
		background: #fff;
	}
</style>
	<div class="col-xs-12">
		<table class="tbl table table-bordered">
			<tr>
				<td style="height: 120px !important;width: 33%;" class="text-center align-middle">
					<a href="Ijin_siswa/get_data" class="app-item" style="text-decoration: none;color: black;"><i class="icon-magazine"></i> <br> <span>Ijin Siswa</span></a>
				</td>
				<td style="height: 120px !important;width: 33%;" class="text-center align-middle">
					<a href="Buku_pemanggilan_siswa/get_data" class="app-item" style="text-decoration: none;color: black;"><i class="icon-calendar"></i> <br> <span>Pelanggaran</span></a>
				</td>
				<td style="height: 120px !important;width: 33%;" class="text-center align-middle">
					<a href="Ijin_siswa/get_data" class="app-item" style="text-decoration: none;color: black;"><i class="icon-magazine"></i> <br> <span>Presensi</span></a>
				</td>
			</tr>
			
			<tr>
				<td style="height: 120px !important;width: 33%;" class="text-center align-middle">
					<a href="Surat_keluar/get_data" class="app-item" style="text-decoration: none;color: black;"><i class="icon-stack-empty"></i> <br> <span>Surat Ijin Sekolah</span></a>
				</td>
				<td style="height: 120px !important;width: 33%;" class="text-center align-middle">
					<i class="icon-file-text2"></i> <br> <span>Laporan</span>
				</td>
				<td style="height: 120px !important;width: 33%;" class="text-center align-middle text-danger">
					<i class="icon-exit2"></i> <br> <span>Logout</span>
				</td>
			</tr>
			
		</table>
	</div>
	

</div>

