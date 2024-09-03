<div class="row">
	<div class="alert alert-success">
		<marquee>Hallo <b><?php echo $data_get['guru']['nama'] ?></b>, Selamat datang di aplikasi EDULITE milik SMK IT ASY SYADZILI. Hak akses anda saat ini adalah sebagai <b>OPERATOR</b></marquee>
	</div>
</div>
<div class="row">
	
	<div class="col-md-6">
		<div class="row">
			<div class="col-sm-6 col-md-6">
				<div class="panel panel-body panel-body-accent">
					<div class="media no-margin">
						<div class="media-left media-middle">
							<i class="icon-user icon-3x text-success-400"></i>
						</div>
						<div class="media-body text-right">
							<h3 class="no-margin text-semibold"><?= $data_get['ijin_hari_ini'] ?></h3>
							<span class="text-uppercase text-size-mini text-muted">Ijin Hari Ini</span>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-6">
				<div class="panel panel-body panel-body-accent">
					<div class="media no-margin">
						<div class="media-left media-middle">
							<i class="icon-users icon-3x text-primary-400"></i>
						</div>
						<div class="media-body text-right">
							<h3 class="no-margin text-semibold"><?= $data_get['total_ijin'] ?></h3>
							<span class="text-uppercase text-size-mini text-muted">Total Ijin</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<button type="button" class="btn btn-danger btn-float btn-float-lg"><i class="icon-html52"></i> <span>Download</span></button>
	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">
			<table class="table table-framed table-xxs">
				<thead>
					<tr>
						<th>No</th>
						<th>Tanggal</th>
						<th>Nama</th>
						<th>Kelas</th>
						<th>Keterangan</th>
					</tr>
				</thead>
				<tbody>
					<?php
					$no = 0;
					foreach ($data_get['ijin_siswa'] as $key => $value): ?>
					<tr>
						<td><?php echo ++$no; ?></td>
						<td><?php echo $value['tanggal'] ?></td>
						<td><?php echo $value['nama'] ?></td>
						<td><?php echo $value['kelas'] ?></td>
						<td><b style="color: <?php echo $value['c_jenis_ijin'] ?>"><?php echo $value['jenis_ijin'] ?></b></td>
					</tr>
					<?php endforeach ?>
				</tbody>
			</table>
			<hr>
			<a href="Ijin_siswa/get_data" class="app-item btn btn-primary"><i class="icon-magazine"></i> Tambah Ijin Siswa</a>
		</div>
	</div>
</div>