<div class="panel panel-body">
	<center><h3>Presensi Siswa Tahun Ajaran <?php echo $data_get['tahun_ajaran']['tahun_ajaran'].' Semester '.$data_get['tahun_ajaran']['semester'] ?></h3></center>

	<div class="alert alert-warning">
				Jika anda lebih familiar menggunakan ms excel silahkan <a href="<?php echo base_url('guru/absensi/download_file/'.$data_get['kelas']['id_kelas'].'/'.$data_get['tahun_ajaran']['id_tahun_ajaran']) ?>" target="__blank">download format ini</a>, kemudian lakukan import data pada form dibawah<br>
				<form action="<?php echo $data_get['param']['table'] ?>/impor_presensi_rapor" id="app-import" method="POST">
							<input type="hidden" name="idkelas_fk" value="<?php echo $data_get['kelas']['id_kelas']; ?>" class="form-control input-xs">
							<input type="hidden" name="idtahunajaran_fk" value="<?php echo $data_get['tahun_ajaran']['id_tahun_ajaran']; ?>" class="form-control input-xs">
							
					<input type="file" name="file_upload"><br>
					<button type="submit" class="btn btn-success">Import</button>
				</form>
			</div>
	<table class="table table-bordered table-framed">
		<thead>
			<tr>
				<th width="20%">NIS</th>
				<th>Nama</th>
				<th width="2%">I</th>
				<th width="2%">A</th>
				<th width="2%">S</th>
			</tr>
		</thead>
		<tbody>
			<?php foreach ($data_get['siswa'] as $key => $value): ?>
				<tr>
					<td><?php echo $value['siswa']['nis'] ?></td>
					<td><?php echo $value['siswa']['nama'] ?></td>
					<td><?php echo (!empty($value['presensi'])) ? $value['presensi']['ijin'] : ''; ?></td>
					<td><?php echo (!empty($value['presensi'])) ? $value['presensi']['alpha'] : ''; ?></td>
					<td><?php echo (!empty($value['presensi'])) ? $value['presensi']['sakit'] : ''; ?></td>
				</tr>
			<?php endforeach ?>
		</tbody>
	</table>
</div>