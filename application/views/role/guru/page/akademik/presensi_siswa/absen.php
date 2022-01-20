<form  action="Akademik/save_presensi_harian" id="app-proses-save" method="POST">
<div class="panel panel-body">
	<center><h3>Presensi Siswa Mapel <?php echo $data_get['mata_pelajaran']['mata_pelajaran'].' Kelas '.$data_get['kelas']['kelas'] ?> Tanggal <?= $data_get['tanggal'] ?></h3></center>
			<style type="text/css">
				.sticky {
					position: sticky;
  					top:0;
  					background: white;
				}
			</style>
	<table class="table table-bordered table-xxs table-framed">
		<thead>
			<tr>
				<th class="sticky" width="20%">NIS</th>
				<th class="sticky">Nama</th>
				<th class="sticky" width="2%">M</th>
				<th class="sticky" width="2%">A</th>
				<th class="sticky" width="2%">I</th>
				<th class="sticky" width="2%">S</th>
			</tr>
		</thead>
		<tbody>
			<input type="hidden" name="idkelas_fk" value="<?php echo $data_get['kelas']['id_kelas'] ?>">
			<input type="hidden" name="tanggal" value="<?php echo $data_get['tanggal'] ?>">
			<input type="hidden" name="idmatapelajaran_fk" value="<?php echo $data_get['mata_pelajaran']['id_mata_pelajaran'] ?>">
			<input type="hidden" name="idtahunajaran_fk" value="<?php echo $data_get['tahun_ajaran']['id_tahun_ajaran']; ?>" class="form-control input-xs">
			<?php foreach ($data_get['siswa'] as $key => $value): ?>
				<tr>
					<input type="hidden" name="data[<?php echo $key ?>][idsiswa_fk]" value="<?php echo $value['siswa']['id_siswa'] ?>">
					<td><?php echo $value['siswa']['nis'] ?></td>
					<td><?php echo $value['siswa']['nama'] ?></td>
					<td><input type="radio" value="M" <?php echo (!empty($value['presensi'])) ?( ($value['presensi']['presensi'] == "M") ? "checked" : "" ) : "checked" ; ?> name="data[<?php echo $key ?>][presensi]"></td>
					<td><input type="radio" value="A" <?php echo (!empty($value['presensi'])) ?( ($value['presensi']['presensi'] == "A") ? "checked" : "" ) : "" ; ?> name="data[<?php echo $key ?>][presensi]"></td>
					<td><input type="radio" value="I" <?php echo (!empty($value['presensi'])) ?( ($value['presensi']['presensi'] == "I") ? "checked" : "" ) : "" ; ?> name="data[<?php echo $key ?>][presensi]"></td>
					<td><input type="radio" value="S" <?php echo (!empty($value['presensi'])) ?( ($value['presensi']['presensi'] == "S") ? "checked" : "" ) : "" ; ?> name="data[<?php echo $key ?>][presensi]"></td>
				</tr>
			<?php endforeach ?>
		</tbody>
	</table>

	<hr>

	<button class="btn btn-success btn-submit" type="submit"><i class=" icon-floppy-disk"></i> Simpan</button>
</div>
</form>