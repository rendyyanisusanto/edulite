<input type="hidden" value="<?php echo $data_get['set']['idkelas_fk'] ?>" name="idkelas_fk">
<input type="hidden" value="<?php echo $data_get['set']['idmatapelajaran_fk'] ?>" name="idmatapelajaran_fk">
<input type="hidden" value="<?php echo $data_get['set']['idguru_fk'] ?>" name="idguru_fk">
<input type="hidden" value="<?php echo $data_get['set']['idkelas_fk'] ?>" name="idkelas_fk">
<input type="hidden" value="<?php echo $data_get['set']['idtahunajaran_fk'] ?>" name="idtahunajaran_fk">

<label>KI/KD/Materi</label>
<select class="form-control" name="idkd_fk">
	<?php foreach ($data_get['kd'] as $key => $value): ?>
		<option value="<?php echo $value['id_kd'] ?>"><?php echo $value['ringkasan'] ?></option>
	<?php endforeach ?>
</select>
<br>
<label>Jenis Penilaian</label>
<select class="form-control" name="idjenispenilaian_fk">
	<?php foreach ($data_get['jenis_pengetahuan'] as $key => $value): ?>
		<option value="<?php echo $value['id_jenis_pengetahuan'] ?>"><?php echo $value['kode'] ?> - <?php echo $value['jenis_pengetahuan'] ?></option>
	<?php endforeach ?>
</select>
<br>
<label>Kode</label>
<input type="text" class="form-control" name="kode" placeholder="contoh : NT1, NT2, NT3 ....">
<br>
<label>Keterangan</label>
<input type="text" class="form-control" name="keterangan" >

