<style type="text/css">
	.text-table {
		padding: 5px;
		border: 1px solid gray;
		font-family: Consolas,monaco,monospace;
		font-size: 10px;
	}
	.button-group {
		margin-top: 1%;
	}
</style>
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">
			<center><h3><u>Penilaian Kinerja Guru Periode <?php echo date_format(date_create($data_get['periode']), 'm/Y') ?> Tahun Ajaran <?php echo $data_get['tahun_ajaran']['tahun_ajaran'] ?></u></h3></center>
			<br>
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
				<div class="col-md-12">
					<div class='button-group'>
			
						<a target="__blank" href="<?= base_url('admin/penilaian_kinerja_guru/cetak_pkg_guru/'.$data_get['guru']['id_guru'].'/'.$data_get['periode'].'/'.$data_get['tahun_ajaran']['id_tahun_ajaran']); ?>" class="btn btn-success"><i class="icon-printer"></i> Cetak Data</a>
					</div>
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
							<?php $vno = 0; ?>
							<?php foreach ($data_get['indikator_pkg'] as $key => $value): ?>
								<?php $no = 0; ?>
								<tr>
									<td class="bg-warning" colspan="3"><b><?php echo ($cNo++).'. '.$value['kompetensi_pkg']['kompetensi'] ?></b></td>
								</tr>
								<?php foreach ($value['subkompetensi_pkg'] as $key_sub => $value_sub): ?>
									<tr>
										<td class="bg-info"><?php echo ++$no; ?></td>
										<td><?php echo $value_sub['subkompetensi'] ?></td>
										<td><?= $value_sub['nilai'] ?></td>
									</tr>
									<?php $vno ++; ?>
								<?php endforeach ?>
							<?php endforeach ?>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>