<div class="panel panel-body panel-proses">
	<div class="row">
		<div class="col-md-12">
			<center><h3><u>Penilaian Kinerja Guru Periode <?php echo date_format(date_create($data_get['periode']), 'm/Y') ?> Tahun Ajaran <?php echo $data_get['tahun_ajaran']['tahun_ajaran'] ?></u></h3></center>
		</div>
	</div>
	<div class="row">
		<div class="col-md-2">
			<img src="<?php echo (!empty($data_get['guru']['foto'])) ? base_url('include/media/foto_pegawai/'.$data_get['guru']['foto']) : base_url('include/media/system/no_image.jpg')?>" class="img-responsive img-rounded" alt="" style="max-height :200px;"	>
		</div>
		<div class="col-md-6">
			<table class="table table-framed">
				<tr>
					<th>Kode Guru</th>
					<th>:</th>
					<th><?php echo $data_get['guru']['nip'] ?></th>
				</tr>
				<tr>
					<th>Nama</th>
					<th>:</th>
					<th><?php echo $data_get['guru']['nama'] ?></th>
				</tr>
				<tr>
					<th>Jabatan</th>
					<th>:</th>
					<th><?php echo $data_get['guru']['jabatan'] ?></th>
				</tr>
				
			</table>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<table class="table table-framed table-bordered" style="margin-top: 5%;">
				<thead>
					<tr class="bg-info">
						<th>No</th>
						<th>Indikator/SubIndikator</th>
						<th>Nilai</th>
					</tr>
				</thead>
				<tbody>
					<?php $cNo = 'A'; ?>
					<?php foreach ($data_get['indikator_pkg'] as $key => $value): ?>
						<?php $no = 0; ?>
						<tr>
							<td class="bg-warning" colspan="3"><b><?php echo ($cNo++).'. '.$value['kompetensi_pkg']['kompetensi'] ?></b></td>
						</tr>
						<?php foreach ($value['subkompetensi_pkg'] as $key_sub => $value_sub): ?>
							<tr>
								<td class="bg-info"><?php echo ++$no; ?></td>
								<td><?php echo $value_sub['subkompetensi'] ?></td>
								<td><input type="number" name="nilai" class="form-control" min="1" max="4" placeholder="(Angka 1-4)"></td>
							</tr>
						<?php endforeach ?>
					<?php endforeach ?>
				</tbody>
			</table>
		</div>
	</div>
</div>