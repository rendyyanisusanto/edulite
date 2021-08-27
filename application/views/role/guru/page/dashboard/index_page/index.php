
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
			<li>Anda Belum Mengisi KD Pada tahun ajaran <?php echo $data_get['tahun_ajaran']['tahun_ajaran'].' '.$data_get['tahun_ajaran']['semester'] ?>, silahkan klik <a href="Kd/get_data" class="app-item">link ini</a></li>
		</ul>
	</div>
</div>

<?php endif ?>
<?php if ($this->agent->is_mobile()): ?>
	<div class="row" style="margin-bottom: 3%;">
		<div class="col-sm-6 col-xs-6" style="margin-bottom: 3%;">
			<a type="button" class="btn btn-warning btn-block btn-float"><i class="icon-magazine"></i> <span>Presensi App</span></a>
		</div>
		<div class="col-sm-6 col-xs-6" style="margin-bottom: 3%;">
			<a type="button" class="btn btn-info btn-block btn-float"><i class="icon-search4"></i> <span>KI/KD App</span></a>
		</div>
	</div>
<?php endif ?>
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
