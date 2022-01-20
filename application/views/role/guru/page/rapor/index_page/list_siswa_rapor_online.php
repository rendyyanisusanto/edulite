<div class="panel panel-body">
	<center><h3>Rapor Siswa Tahun Ajaran <?php echo $data_get['tahun_ajaran']['tahun_ajaran'].' Semester '.$data_get['tahun_ajaran']['semester'] ?></h3></center>
	<table class="table table-bordered table-framed">
		<thead>
			<tr>
				<th width="20%">NIS</th>
				<th>Nama</th>
				<th width="2%">Kode Rapor</th>
				<th width="2%">UPLOAD</th>
			</tr>
		</thead>
		<tbody>
			<?php foreach ($data_get['siswa'] as $key => $value): ?>
			<tr>
				<td><?php echo $value['siswa']['nis'] ?></td>
				<td><?php echo $value['siswa']['nama'] ?></td>
				<td><?php echo ($value['file'] == 0) ? "<p class='text-danger'>Belum</p>" : "<b class='text-success'>".$value['file']."</b>" ?></td>
				<td>
					<button type="button"
					data-id="<?php echo $value['siswa']['id_siswa'] ?>"
					data-nama="<?php echo $value['siswa']['nama'] ?>"
					data-kelas="<?php echo $value['siswa']['idkelas_fk'] ?>"
					data-tahun_ajaran="<?php echo $data_get['tahun_ajaran']['id_tahun_ajaran'] ?>"
					class="btn btn-primary btn-upload">Upload</button>
				</td>
			</tr>
			<?php endforeach ?>
		</tbody>
	</table>
</div>
<!-- Disabled animation -->
<div id="modal_upload" class="modal" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<form action="Rapor/upload_rapor_online" class ="app-import" method="POST">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title-upload">Upload</h5>
				</div>
				<div class="modal-body">
					
					<input type="file" name="file_upload" class="flrp">
					<input type="hidden" class="idsiswa_fk" name="idsiswa_fk">
					<input type="hidden" class="idkelas_fk" name="idkelas_fk">
					<input type="hidden" class="idtahunajaran_fk" name="idtahunajaran_fk">				
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-link" data-dismiss="modal">Tutup</button>
					<button type="submit" class="btn btn-primary">Upload</button>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- /disabled animation -->
