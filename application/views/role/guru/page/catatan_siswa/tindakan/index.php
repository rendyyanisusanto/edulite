<div class="row">
	<div class="col-md-8">
		<div class="panel panel-body">
			<table class="table table-bordered table-framed table-sm">
				<tr>
					<td>Nama</td>
					<td>:</td>
					<td><?php echo $data_get['catatan_siswa']['nama'] ?></td>
				</tr>
				<tr>
					<td>Kelas</td>
					<td>:</td>
					<td><?php echo $data_get['catatan_siswa']['nama_kelas'] ?></td>
				</tr>
				<tr>
					<td>Pelapor</td>
					<td>:</td>
					<td><?php echo $data_get['catatan_siswa']['nama_guru'] ?></td>
				</tr>
				<tr>
					<td>Uraian Masalah</td>
					<td>:</td>
					<td><?php echo $data_get['catatan_siswa']['uraian'] ?></td>
				</tr>
			</table>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">
			<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/simpan_data" id="app-submit" method="POST">
				<input type="hidden" class="id_catatan_siswa" value="<?php echo $data_get['catatan_siswa']['id_catatan_siswa'] ?>" name="idcatatansiswa_fk">
				<div class="form-group">
                  <label class="col-lg-3 control-label">Tanggal</label>
                  <div class="col-lg-4">
                    <input type="date" name="tanggal" class="form-control" >
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-lg-3 control-label">Tindakan</label>
                  <div class="col-lg-4">
                    <input type="text" name="tindakan" class="form-control" >
                  </div>
                </div>
                <br>
                <button class="btn btn-success" type="submit">Simpan</button>
			</form>
			<hr>
			<div class="panel-tindakan"></div>
		</div>
	</div>
</div>