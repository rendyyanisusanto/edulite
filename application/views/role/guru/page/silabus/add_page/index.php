<div class="col-md-8">
	<div class="panel panel-body">
		<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/simpan_data" id="app-submit" method="POST">
			<div class="form-group">
				<label class="col-lg-3 control-label">Tahun Ajaran:</label>
				<div class="col-lg-9">
					<select required class="form-control" name="idtahunajaran_fk">
						<?php foreach ($data_get['tahun_ajaran'] as $value): ?>
							<option value="<?= $value['id_tahun_ajaran'] ?>"><?= $value['tahun_ajaran'] ?></option>
						<?php endforeach ?>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-3 control-label">Kelas/Mapel:</label>
				<div class="col-lg-9">
					<select required class="form-control kelas_mapel" name="kelas_mapel">
						<option value="">-- Pilih Kelas/Mapel --</option>
						<?php foreach ($data_get['dt_guru']['mapel'] as $value): ?>
							<option idkelas="<?= $value['id_kelas'] ?>" idmapel="<?= $value['id_mata_pelajaran'] ?>" value="<?= $value['id_mata_pelajaran'].'/'.$value['id_kelas'] ?>"><?= $value['kelas'].' - ('.$value['kode'].') '.$value['mata_pelajaran'] ?></option>
						<?php endforeach ?>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-3 control-label">Materi:</label>
				<div class="col-lg-9">
					<div class="set_materi">
						<select required="" class="form-control " name="materi">
							<option>Pilih Kelas/Materi Dulu</option>
						</select>
					</div>
					
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-3 control-label">File:</label>
				<div class="col-lg-9">
					<input type="file" class="form-control" name="file">
				</div>
			</div>
			<hr>
			<button type="submit" class="btn btn-success"><i class="icon-floppy-disk"></i> Simpan</button>
		</form>
	</div>
</div>