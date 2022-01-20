
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">
			<form  action="Jurnal_guru/save_catatan_siswa" id="app-catatan-save" method="POST">
				<label >Siswa</label>
				<input type="hidden" class="id_catatan_siswa" name="id_catatan_siswa">
				<select class="select idsiswa_fk" name="idsiswa_fk">
					<?php foreach ($data_get['siswa'] as $key => $value): ?>
						<option value="<?php echo $value['id_siswa'] ?>"><?php echo $value['nama'] ?></option>
					<?php endforeach ?>
				</select>
				<label style="margin-top: 5px;">Uraian Masalah</label>
				<textarea class="form-control uraian_catatan" name="uraian"></textarea>
				
				<label style="margin-top: 5px;">Tindak Lanjut</label>
				<select class="form-control teruskan_ke" name="teruskan_ke">
					<option value="">Tidak ada</option>
					<option value="WALAS">Teruskan ke Wali Kelas</option>
					<option value="BK">Teruskan ke BK</option>
					<option value="KESISWAAN">Teruskan ke Kesiswaan</option>
				</select>
				<br>
				<button type="submit" class="btn btn-catatan-submit btn-success"><i class="icon-floppy-disk"></i> Simpan</button>
				<button class="btn btn-danger btn-batal-catatan" type="button" style="display: none;"><i class="icon-close2"></i> Batal</button>
			</form>
		</div>
	</div>
	<div class="col-md-12">
		<div class="table-responsive">
		<table class="table table-bordered table-framed table-xxs">
			<thead>
				<tr>
					<th width="1%">No</th>
					<th>Siswa</th>
					<th>Uraian</th>
					<th>Diteruskan</th>
					<th width="2%">#</th>
					<th width="2%">#</th>
				</tr>
			</thead>
			<tbody>
				<?php $no = 0; ?>
				<?php if (!empty($data_get['catatan_siswa'])){ ?>
					<?php foreach ($data_get['catatan_siswa'] as $key => $value): ?>
						<tr>
							<td><?php echo ++$no ?></td>
							<td><?php echo $value['nama'] ?></td>
							<td><?php echo $value['uraian'] ?></td>
							<td><?php echo $value['teruskan_ke'] ?></td>
							<td><button class="btn btn-xs btn-success btn-edit-catatan" data-uraian="<?php echo $value['uraian'] ?>" data-idsiswa="<?php echo $value['idsiswa_fk'] ?>" data-teruskan_ke="<?php echo $value['teruskan_ke'] ?>" data-id="<?php echo $value['id_catatan_siswa'] ?>"><i class="icon-pencil3"></i></button></td>
							<td><button class="btn btn-xs btn-danger btn-del-catatan" data-id="<?php echo $value['id_catatan_siswa'] ?>"><i class="icon-trash"></i></button> </td>
						</tr>
					<?php endforeach ?>
					
				<?php }else{
					echo "<tr><td colspan='5'><b><center>Belum ada data</center></b></td></tr>";
				} ?>
			</tbody>
		</table>
		</div>
	</div>
</div>

<script type="text/javascript">
	$('.select').select2();
</script>