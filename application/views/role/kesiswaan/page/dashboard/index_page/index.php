
<div class="row">
	<div class="alert alert-success">
		<marquee>Hallo <b><?php echo $data_get['guru']['nama'] ?></b>, Selamat datang di aplikasi EDULITE milik SMK IT ASY SYADZILI. Hak akses anda saat ini adalah sebagai <b>KESISWAAN</b></marquee>
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
				<b>Catatan Siswa Minggu Ini</b>

				<br>

				<table style="margin-top: 2%;margin-bottom: 2%;" class="table table-sm table-framed">
					<thead>
						<tr>
							<th>No</th>
							<th>Siswa</th>
							<th>Uraian</th>
							<th>Oleh</th>
							<th>Tindakan</th>
						</tr>
					</thead>
					<tbody>
						<?php $i=0; ?>
						<?php foreach ($data_get['catatan'] as $key => $value): ?>
							<tr>
								<td><?php echo ++$i; ?></td>
								<td><?php echo $value['nama'] ?></td>
								<td><?php echo $value['uraian'] ?></td>
								<td><?php echo $value['nama_guru'] ?></td>
								<td><?php echo (!empty($value['is_tindakan'])) ? "<b class='text-success'>Sudah</b>" : "<b class='text-danger'>Belum</b>" ; ?></td>
							</tr>
						<?php endforeach ?>
					</tbody>
				</table>

			<a href="Pelanggaran_siswa/catatan_siswa" class="app-item">Lihat semua</a>
			</div>

		</div>
		<div class="col-md-12">
			<div class="panel panel-body">
				<b>Peringkat Siswa dg Poin Pelanggaran Tertinggi</b>
				<br>

				<table class="table table-framed table-sm" style="margin-top: 2%;">
					<thead>
						<tr>
							<th>No</th>
							<th>Siswa</th>
							<th>Poin</th>
						</tr>
					</thead>
					<tbody>
						<?php 
						$no = 0;
						foreach ($data_get['poin_pelanggaran_siswa'] as $key => $value): ?>
							<tr>
								<td><?php echo ++$no ?></td>
								<td><?php echo $value['nama'] ?></td>
								<td><?php echo $value['poin'] ?></td>
							</tr>
						<?php endforeach ?>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
