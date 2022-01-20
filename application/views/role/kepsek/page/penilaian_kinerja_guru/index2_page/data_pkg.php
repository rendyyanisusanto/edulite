<div class="row">
		<div class="col-md-12">
			<center><h3><u>Penilaian Kinerja Guru Periode <?php echo $data_get['bulan'].'/'.$data_get['tahun'] ?> Tahun Ajaran <?php echo $data_get['tahun_ajaran'] ?></u></h3></center>
		</div>
	</div>
	<div class="row">
		<div class="col-md-2">
			<img src="<?php echo (!empty($data_get['guru']['foto'])) ? base_url('include/media/foto_pegawai/'.$data_get['guru']['foto']) : base_url('include/media/system/no_image.jpg')?>" class="img-responsive img-rounded" alt="" style="max-height :200px;"	>
		</div>

		<!-- INPUT TYPE HIDE -->
				<input type="hidden" value="<?= $data_get['guru']['id_guru'] ?>" name="idguru_fk">
				<input type="hidden" value="<?= $data_get['tahun_ajaran_id'] ?>" name="idtahunajaran_fk">
				<input type="hidden" value="<?= $data_get['bulan'] ?>" name="bulan">
				<input type="hidden" value="<?= $data_get['tahun']  ?>" name="tahun">
		<!-- /INPUT -->
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
					<?php $vno = 0; ?>
					<?php foreach ($data_get['indikator_pkg'] as $key => $value): ?>
						<?php $no = 0; ?>
						<tr>
							<td class="bg-warning" colspan="3"><b><?php echo ($cNo++).'. '.$value['kompetensi_pkg']['kompetensi'] ?></b></td>
						</tr>
						<?php foreach ($value['subkompetensi_pkg'] as $key_sub => $value_sub): ?>
							<tr>
								<!-- hidden -->
									<input type="hidden" name="data_pkg[<?= $vno ?>][idsubkompetensipkg_fk]" value="<?= $value_sub['id_subkompetensi_pkg'] ?>">
								<!-- /hidden -->
								<td class="bg-info"><?php echo ++$no; ?></td>
								<td><?php echo $value_sub['subkompetensi'] ?></td>
								<td><input type="number" name="data_pkg[<?= $vno ?>][nilai]" required value="<?= ($data_get['is_edit'] == 1) ? ((isset($value_sub['nilai']) ? $value_sub['nilai']: "" )) : "" ; ?>" class="form-control" min="1" max="4" placeholder="(Angka 1-4)"></td>
							</tr>
							<?php $vno ++; ?>
						<?php endforeach ?>
					<?php endforeach ?>
				</tbody>
			</table>
		</div>
	</div>