<script src="<?php echo base_url('include/geo') ?>/geo-min.js" type="text/javascript" charset="utf-8"></script>
<div class="row">
	<div class="alert alert-success">
		<marquee>Hallo <b><?php echo $data_get['guru']['nama'] ?></b>, Selamat datang di aplikasi EDULITE milik SMK IT ASY SYADZILI. Hak akses anda saat ini adalah sebagai <b>GURU</b></marquee>
	</div>
</div>
<?php if ($data_get['cek_kd'] == 0): ?>
	
<div class="row">
	<div class="alert alert-danger">
		<b>Message from the system</b> :
		<ul>
			<li>Download aplikasi Edulite Mobile untuk melakukan presensi guru, untuk mendownload silahkan klik <a href="<?= base_url('include/media/M-Edulite.apk'); ?>" target="__blank">link ini</a></li>
		</ul>
	</div>
</div>

<?php endif ?>

<?php if ($data_get['jadwal_guru'] > 0): ?>
	<div class="row" >
		<div class="alert alert-info">
			<button class="btn btn-default" onclick="getLocation()">Refresh Lokasi</button>


			<hr>
			<b>Anda hari ini ada jadwal:</b>
			<br>
			<p id="mesJadwal"></p>
			<br>
			<div style="display: none;" class="rowabsen">
				<?php if (isset($data_get['presensi'])){ ?>
					<?php if (!empty($data_get['presensi']['jam_masuk']) && $data_get['presensi']['jam_masuk'] !== '00:00:00' ){ ?>
						Anda sudah check in (<?php echo $data_get['presensi']['jam_masuk'] ?>) <br>
					<?php }else{ ?>
						<button class="btn btn-success btn-check" data-status="0" type="button">Check IN</button>
					<?php } ?>
					<?php if (!empty($data_get['presensi']['jam_keluar']) && $data_get['presensi']['jam_keluar'] !== '00:00:00' ){ ?>
						Anda sudah check out (<?php echo $data_get['presensi']['jam_keluar'] ?>)
					<?php }else{ ?>
						<button class="btn btn-danger btn-check" data-status="1" type="button">Check OUT</button>
					<?php } ?>
				<?php }else{ ?>
					<button class="btn btn-success btn-check" data-status="0" type="button">Check IN</button>
					<button class="btn btn-danger btn-check" data-status="1" type="button">Check OUT</button>
				<?php } ?>
			</div>
			
			
		</div>
	</div>
<?php endif ?>
<?php if (count($data_get['event'])>0): ?>
	
	<div class="row">
		
			<div class="alert alert-warning">
				<b>Event Hari ini</b> :
				<ul>
					<?php foreach ($data_get['event'] as $key => $value): ?>
						<li><?php echo $value['event'] ?> (<a href="Event/detail/<?php echo $value['id_event'] ?>" class="app-item">Konfirmasi Kehadiran</a>)</li>
					<?php endforeach ?>
				</ul>
				
			</div>
		
	</div>
<?php endif ?>


<div class="row">
	<div class="col-md-12">
			<div class="panel panel-body">
				<center><b><u>Presensi Prakerin</u></b></center>

				<table class="table table-bordered table-xxs table-framed">
					<thead>
						<tr>
							<th width="1%">No</th>
							<th>Keterangan</th>
							<th width="1%">Absen Masuk</th>
							<th width="1%">Absen Pulang</th>
						</tr>
					</thead>
					<tbody>
						<?php $no = 0; ?>
						<?php foreach ($data_get['prakerin'] as $value): ?>
							<tr>
								<td><?= (++$no); ?></td>
								<td><?= '<b>'.$value['prakerin']['nama_kelompok'].'</b>' ?></td>
								<td><a href="Jurnal_guru/presensi_prakerin/<?= $value['prakerin']['id_prakerin_kelompok'] ?>/M" class="app-item"><?= ($value['absen_masuk_prakerin'] == 0) ? "Belum" : "Sudah" ?></a></td>
								<td><a href="Jurnal_guru/presensi_prakerin/<?= $value['prakerin']['id_prakerin_kelompok'] ?>/P" class="app-item"><?= ($value['absen_pulang_prakerin'] == 0) ? "Belum" : "Sudah" ?></a></td>
							</tr>
						<?php endforeach ?>
					</tbody>
				</table>
			</div>
		</div>
</div>


<?php if (count($data_get['mapel_hari_ini']) > 0): ?>
	
<div class="row">
	<div class="col-md-12">
			<div class="panel panel-body">
				<center><b><u>Tugas anda hari ini</u></b></center>

				<table class="table table-bordered table-xxs table-framed">
					<thead>
						<tr>
							<th width="1%">No</th>
							<th>Keterangan</th>
							<th width="1%">Abs</th>
							<th width="1%">Jn</th>
							<th width="1%">Ctt</th>
						</tr>
					</thead>
					<tbody>
						<?php $no = 0; ?>
						<?php foreach ($data_get['mapel_hari_ini'] as $value): ?>
							<tr>
								<td><?= (++$no); ?></td>
								<td><a href="Jurnal_guru/jurnal/<?= $value['mapel']['id_jadwal_pelajaran'] ?>" class="app-item">Mata Pelajaran <?= '<b>'.$value['mapel']['kode_pelajaran'].'('.$value['mapel']['id_jadwal_pelajaran'].')'.'<b> Kelas <b>'.$value['mapel']['kelas'].'</b> Jam Ke-'.$value['mapel']['nama'] ?></a></td>
								<td><b class="<?php echo ($value['absen']>0) ? 'text-success icon-checkmark2' : 'text-danger icon-close2'; ?>"></b></td>
								<td><b class="<?php echo ($value['jurnal_guru']>0) ? 'text-success icon-checkmark2' : 'text-danger icon-close2'; ?>"></b></td>
								<td><b class="<?php echo ($value['catatan_siswa']>0) ? 'text-success icon-checkmark2' : 'text-danger icon-close2'; ?>"></b></td>
							</tr>
						<?php endforeach ?>
					</tbody>
				</table>
			</div>
		</div>
</div>

<?php endif ?>

<?php if ($data_get['ijin_siswa'] > 0): ?>
	<div class="row">
		<div class="col-md-12">
			<div class="panel">
				<div class="panel-body">
					<center><b><u>Siswa Ijin Hari Ini</u></b></center>

					<div class="ijin-siswa"></div>
				</div>
				<div class="panel-footer">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group" style="margin-left: 5%;">
								<b>Filter : </b>
					            <select style="width: 80%;" class="form-control filterkelas" onchange="ijin_siswa()">
					            	<option value=""> Semua Kelas</option>
					            	<?php foreach ($data_get['kelas'] as $key => $value): ?>
					            		<option value="<?php echo $value['id_kelas'] ?>"><?php echo $value['kelas'] ?></option>
					            	<?php endforeach ?>
					            </select>
					          </div>
						</div>
					</div>
			          
			    </div>
			</div>
		</div>
	</div>
<?php endif ?>
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
			<div class="panel panel-body">
			<center><b><u>Mapel yang anda ampu</u></b></center>
			<br>
			<table style ="border: 1px solid black;" class="table table-bordered">
				<thead>
					<tr>
						<th class="bg-warning">Kelas</th>
						<th class="bg-warning">Mata Pelajaran</th>
					</tr>
				</thead>
				<tbody>
					<?php foreach ($data_get['mapel'] as $key => $value): ?>
						<tr>
							<td><?php echo $value['kelas'] ?></td>
							<td><?php echo $value['mata_pelajaran'] ?></td>
						</tr>
					<?php endforeach ?>
				</tbody>
			</table>
			
		</div>
		</div>
		
	</div>
</div>
