
<?php if ($data_get['jadwal_guru'] > 0): ?>
	<div class="row" >
		<div class="alert alert-info">
			<button class="btn btn-default" onclick="getLocation()">Refresh Lokasi</button>


			<hr>
			<b>Anda hari ini ada jadwal:</b>
			<br>
			Clock In : <?php echo (!empty($data_get['presensi']['jam_masuk']) && $data_get['presensi']['jam_masuk'] !== '00:00:00' ) ?  $data_get['presensi']['jam_masuk'] : "Belum Absen"; ?>
			<br>
			Clock Out : <?php echo (!empty($data_get['presensi']['jam_keluar']) && $data_get['presensi']['jam_keluar'] !== '00:00:00' ) ?  $data_get['presensi']['jam_keluar'] : "Belum Absen"; ?>
			<br>
			<p id="mesJadwal"></p>
			<br>
			
			<div style="display: none;" class="rowabsen">
				<?php if (isset($data_get['presensi'])){ ?>
					<?php if (!empty($data_get['presensi']['jam_masuk']) && $data_get['presensi']['jam_masuk'] !== '00:00:00' ){ ?>
					<?php }else{ ?>
						<button class="btn btn-success btn-check" data-status="0" type="button">Clock IN</button>
					<?php } ?>
					<?php if (!empty($data_get['presensi']['jam_keluar']) && $data_get['presensi']['jam_keluar'] !== '00:00:00' ){ ?>
					<?php }else{ ?>
						<button class="btn btn-danger btn-check" data-status="1" type="button">Clock OUT</button>
					<?php } ?>
				<?php }else{ ?>
					<button class="btn btn-success btn-check" data-status="0" type="button">Clock IN</button>
					<button class="btn btn-danger btn-check" data-status="1" type="button">Clock OUT</button>
				<?php } ?>
			</div>
			
			<div style="display:none;" class="row-request">
				<a href="Request_absen/get_data" class="app-item btn btn-info">Request Absent</a>
			</div>
			
		</div>
	</div>
<?php endif ?>


<div class="row" style="margin-bottom: 15%;">
	<div class="col-md-12">
		<center>
			<img src="<?php echo base_url('include/media/logo_new.png'); ?>" style="max-width: 250px;" class="img img-responsive">
		</center>
	</div>
</div>
<div class="row">
	<div class="col-xs-6">
		<div class="panel panel-body" style="border-radius: 10%;">
			<b>Mapel Hari Ini : <?= count($data_get['mapel_hari_ini']) ?></b>
		</div>
	</div>
	<div class="col-xs-6">
		<div class="panel panel-body" style="border-radius: 10%;">
			
			<b>Total siswa Ijin : <?= $data_get['ijin_siswa'] ?></b>
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
					<a href="Jurnal_guru/cek_jurnal" class="app-item" style="text-decoration: none;color: black;"><i class="icon-magazine"></i> <br> <span>Presensi Siswa</span></a>
				</td>
				<td style="height: 120px !important;width: 33%;" class="text-center align-middle">
					<a href="Presensi_guru/rekap" class="app-item" style="text-decoration: none;color: black;"><i class="icon-stack-empty"></i> <br> <span>Log Absen Guru</span></a>
				</td>
				<td style="height: 120px !important;width: 33%;" class="text-center align-middle">
					<a href="Penggajian/get_data" class="app-item" style="text-decoration: none;color: black;"><i class="icon-coin-dollar"></i> <br> <span>HR</span></a>
				</td>
			</tr>
			
			<tr>
				<td style="height: 120px !important;width: 33%;" class="text-center align-middle">
					<a href="Request_absen/get_data" class="app-item" style="text-decoration: none;color: black;"><i class="icon-file-text2"></i> <br> <span>Request Absen Guru</span></a>
				</td>
				<td style="height: 120px !important;width: 33%;" class="text-center align-middle">
					<a href="Tugas/get_data" class="app-item" style="text-decoration: none;color: black;"><i class="icon-file-text3"></i> <br> <span>Tugas</span></a>
				</td>
				<td style="height: 120px !important;width: 33%;" class="text-center align-middle text-danger">
					<i class="icon-exit2"></i> <br> <span>Logout</span>
				</td>
			</tr>
			
		</table>
	</div>
	

</div>

