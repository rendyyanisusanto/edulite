<div class="row">
	<div class="alert alert-warning">
		Fitur duplikat adalah menduplikasi data materi dan KD ke kelas dengan mapel yang sama. jika dalam kelas tersebut telah terdapat kd dan materi yg sama maka data tidak akan tercopy
	</div>
	<input type="hidden" value="<?php echo $data_get['idtahunajaran_fk'] ?>" name="idtahunajaran_fk">
	<input type="hidden" value="<?php echo $data_get['idmatapelajaran_fk'] ?>" name="idmatapelajaran_fk">
	<input type="hidden" value="<?php echo $data_get['idkelas_fk'] ?>" name="idkelas_fk">
	<input type="hidden" value="<?php echo $data_get['idguru_fk'] ?>" name="idguru_fk">
	<ul style="list-style-type: none;">
		<?php foreach ($data_get['pelajaran'] as $key => $value): ?>
			<li><input type="checkbox" name="kelas[]" value="<?php echo $value['id_guru_mapel'] ?>"> <?php echo $value['mata_pelajaran'] ?> - <?php echo $value['kelas'] ?></li>
		<?php endforeach ?>
	</ul>
</div>