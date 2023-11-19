<div class="alert alert-warning"><b>Info : </b> Lakukan pengecekan data terlebih dahulu. Scroll kebawah untuk memasukkan data ke database</div>
<input type="hidden" name="idjurusan_fk" class="idjurusan_fk">
<input type="hidden" name="idkelas_fk" class="idkelas_fk">
<table class=" table table-framed table-xxs" style="margin-bottom: 10px;">
	<thead>
		<tr>
			<th>No</th>
			<th>NIS</th>
			<th>NISN</th>
			<th>Nama</th>
			<th>Agama</th>
			<th>No. Ijazah</th>
			<th>Tmp Lahir</th>
			<th>JK</th>
		</tr>
	</thead>
	<tbody>
		<?php foreach ($data_get['siswa'] as $key => $value): ?>
			<tr>
				<td width="1%"><button class="btn btn-xs btn-danger btn-del" type="button"><i class="icon-close2"></i></button></td>
				<td><input type="text" name="dt[<?php echo $key ?>][nis]" value="<?php echo (!empty($value['nis'])) ? $value['nis'] : '' ; ?>" class="nis form-control"></td>
				<td><input type="text" name="dt[<?php echo $key ?>][nisn]" value="<?php echo (!empty($value['nisn'])) ? $value['nisn'] : '' ; ?>" class="nisn form-control"></td>
				<td><input type="text" name="dt[<?php echo $key ?>][nama]" value="<?php echo (!empty($value['nama'])) ? $value['nama'] : '' ; ?>" class="nama form-control"></td>
				<td><input type="text" name="dt[<?php echo $key ?>][agama]" value="<?php echo (!empty($value['agama'])) ? $value['agama'] : '' ; ?>" class="agama form-control"></td>
				<td><input type="text" name="dt[<?php echo $key ?>][no_ijazah]" value="<?php echo (!empty($value['no_ijazah'])) ? $value['no_ijazah'] : '' ; ?>" class="no_ijazah form-control"></td>
				<td><input type="text" name="dt[<?php echo $key ?>][tempat_lahir]" value="<?php echo (!empty($value['tempat_lahir'])) ? $value['tempat_lahir'] : '' ; ?>" class="tempat_lahir form-control"></td>
				<td><input type="text" name="dt[<?php echo $key ?>][jenis_kelamin]" value="<?php echo (!empty($value['jenis_kelamin'])) ? $value['jenis_kelamin'] : '' ; ?>" class="jenis_kelamin form-control"></td>
				
			</tr>
		<?php endforeach ?>
	</tbody>
</table>

<hr>
<button class="btn btn-success btn-submit-all" type="submit"><i class="icon-upload"></i> Import data ke database</button>
