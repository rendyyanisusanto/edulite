<style type="text/css">
	.text-table {
		padding: 5px;
		border: 1px solid gray;
		font-family: Consolas,monaco,monospace;
		font-size: 10px;
	}
	.button-group {
		margin-bottom: 2%;
	}
</style>
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">
			<center><h3><u>Laporan Penilaian Kinerja Guru Periode <?php echo date_format(date_create($data_get['periode']), 'm/Y') ?> Tahun Ajaran <?php echo $data_get['tahun_ajaran']['tahun_ajaran'] ?></u></h3></center>

			<br>

			<div class='button-group'>
			
				<a target="__blank" href="<?= base_url('admin/penilaian_kinerja_guru/cetak_pkg_all/'.$data_get['periode'].'/'.$data_get['tahun_ajaran']['id_tahun_ajaran']); ?>" class="btn btn-success"><i class="icon-printer"></i> Cetak Data</a>
			</div>
			<div style="overflow-x:auto;">
				<table  style="width: 100%;border: 1px solid gray;overflow-x:auto;">
					<thead >
						<tr>
							<th  class="text-center" style="font-weight: 900;border: 1px solid gray;" rowspan="3">Kode</th>
							<th class="text-center" style="font-weight: 900;border: 1px solid gray;" rowspan="3">Nama</th>
							<th class="text-center" style="font-weight: 900;border: 1px solid gray;" colspan="<?= $data_get['c_sub'] ?>">Kompetensi</th>
							<th class="text-center" style="font-weight: 900;border: 1px solid gray;padding-left: 2px;padding-right: 2px;" rowspan="3">Total</th>
							<th class="text-center" style="font-weight: 900;border: 1px solid gray;padding-left: 2px;padding-right: 2px;" rowspan="3">Hasil</th>
							<th class="text-center" style="font-weight: 900;border: 1px solid gray;padding-left: 2px;padding-right: 2px;" rowspan="3">Predikat</th>
						</tr>
						<tr>
							<?php foreach ($data_get['indikator_pkg'] as $value_indikator): ?>
									<th colspan="<?= count($value_indikator['subkompetensi_pkg']); ?>" style="font-weight: 900;padding-right: 2px;padding-left:2px;border: 1px solid gray;padding-left: 2px;" class="text-center"><?= $value_indikator['kompetensi_pkg']['kompetensi'] ?></th>
							<?php endforeach ?>
						</tr>
						<tr>
							<?php foreach ($data_get['indikator_pkg'] as $value_indikator): ?>
									<?php foreach ($value_indikator['subkompetensi_pkg'] as $value_sub): ?>
										<th style="font-weight: 900;border: 1px solid gray;" class="text-center"><?= $value_sub['kode'] ?></th>
									<?php endforeach ?>
							<?php endforeach ?>
						</tr>
					</thead>
					<tbody>
						<?php foreach ($data_get['all'] as $value): ?>
							<tr>
								<td class="text-table" style="width: 10%; "><?= $value['guru']['nip'] ?></td>
								<td class="text-table" style="width: 30%; "><a href="Penilaian_kinerja_guru/report_pkg_guru/<?= $value['guru']['id_guru'] ?>/<?= $data_get['periode'] ?>/<?= $data_get['tahun_ajaran']['id_tahun_ajaran'] ?>" class="app-item"><?= $value['guru']['nama'] ?></a></td>
									<?php foreach ($value['nilai'] as $value_nilai): ?>
										<td class="text-center text-table" style="width: 2%;"><?= $value_nilai['nilai']?></td>
									<?php endforeach ?>
								<td class="text-center text-table" style="width: 5%;"><?= $value['total'] ?></td>
								<td class="text-center text-table" style="width: 5%;"><?= $value['hasil'] ?></td>
								<td class="text-center text-table" style="width: 10%;"><b class="text-<?= $value['predikat']['warna'] ?>"><?= $value['predikat']['predikat'] ?></b></td>
							</tr>
						<?php endforeach ?>
					</tbody>
				</table>
			</div>
		</div>
		
	</div>
</div>