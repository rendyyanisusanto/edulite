<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">
			<center><h4>Presensi Harian Siswa</h4></center>
			<br>

			<table class="table table-framed table-bordered table-xxs" >
				<tr>
					<td>Kelas</td>
					<td><?php echo $data_get['kelas']['kelas'] ?></td>
				</tr>
				<tr>
					<td>Tanggal</td>
					<td><?php echo $data_get['tanggal'] ?></td>
				</tr>
			</table>
			<hr>
			<form  action="Presensi_harian/save_presensi_harian_siswa" id="app-absen-save" method="POST">
			<input type="hidden" name="idkelas_fk" value="<?php echo $data_get['kelas']['id_kelas'] ?>">
			<input type="hidden" name="tanggal" value="<?php echo $data_get['tanggal'] ?>">
			<input type="hidden" name="idtahunajaran_fk" value="<?php echo $data_get['tahun_ajaran']['id_tahun_ajaran']; ?>" >
			<input type="hidden" name="stat" value="<?php echo $data_get['stat'] ?>">
			<!-- <div class="table-responsive">
			<table class="table table-bordered table-xxs table-framed" style="width: 100%;">
				<thead>
					<tr>
						<th class="sticky" width="2%">No</th>
						<th class="sticky" width="10%">NIS</th>
						<th class="sticky">Nama</th>
						<th class="sticky" width="2%">M</th>
						<th class="sticky" width="2%">A</th>
						<th class="sticky" width="2%">I</th>
						<th class="sticky" width="2%">S</th>
						<th class="sticky" width="20%">Keterangan</th>
					</tr>
				</thead>
				<tbody>
				
					<?php 
					$no = 0;
					foreach ($data_get['siswa'] as $key => $value): ?>

					<tr>
						<input type="hidden" name="data[<?php echo $key ?>][idsiswa_fk]" value="<?php echo $value['siswa']['id_siswa'] ?>">
						<td><?php echo ++$no ?></td>
						<td><?php echo $value['siswa']['nis'] ?></td>
						<td><?php echo $value['siswa']['nama'] ?></td>
						<td><input type="radio" value="M" <?php echo (!empty($value['presensi'])) ?( ($value['presensi']['presensi_'.(($data_get['stat'] == "M") ? "masuk" : "pulang")] == "M") ? "checked" : "" ) : "checked" ; ?> name="data[<?php echo $key ?>][presensi]"></td>
						<td><input type="radio" value="A" <?php echo (!empty($value['presensi'])) ?( ($value['presensi']['presensi_'.(($data_get['stat'] == "M") ? "masuk" : "pulang")] == "A") ? "checked" : "" ) : "" ; ?> name="data[<?php echo $key ?>][presensi]"></td>
						<td><input type="radio" value="I" <?php echo (!empty($value['presensi'])) ?( ($value['presensi']['presensi_'.(($data_get['stat'] == "M") ? "masuk" : "pulang")] == "I") ? "checked" : "" ) : "" ; ?> name="data[<?php echo $key ?>][presensi]"></td>
						<td><input type="radio" value="S" <?php echo (!empty($value['presensi'])) ?( ($value['presensi']['presensi_'.(($data_get['stat'] == "M") ? "masuk" : "pulang")] == "S") ? "checked" : "" ) : "" ; ?> name="data[<?php echo $key ?>][presensi]"></td>
						<td><input type="text" value="<?php echo (!empty($value['presensi'])) ? $value['presensi']['keterangan'] : '' ?>" class="form-control" name="data[<?php echo $key ?>][keterangan]"></td>
					</tr>
					<?php endforeach ?>
				</tbody>
			</table>
			</div> -->
					<?php 
					$no = 0;
					foreach ($data_get['siswa'] as $key => $value): ?>
			<b><?php echo $value['siswa']['nama'] ?></b>
				<br>
				
				<input type="hidden" name="data[<?php echo $key ?>][idsiswa_fk]" value="<?php echo $value['siswa']['id_siswa'] ?>">
				
				
				
				<div class="btn-group" style="width: 100%;" >
										
									
					<label class="radio-inline btn btn-success">
				      <input type="radio" value="M" <?php echo (!empty($value['presensi'])) ?( ($value['presensi']['presensi_'.(($data_get['stat'] == "M") ? "masuk" : "pulang")] == "M") ? "checked" : "" ) : "checked" ; ?> name="data[<?php echo $key ?>][presensi]"> M
				    </label>
				    <label class="radio-inline btn btn-danger">
				      <input type="radio" value="A"  <?php echo (!empty($value['presensi'])) ?( ($value['presensi']['presensi_'.(($data_get['stat'] == "M") ? "masuk" : "pulang")] == "A") ? "checked" : "" ) : "" ; ?>  name="data[<?php echo $key ?>][presensi]"> A
				    </label>
				    <label class="radio-inline btn btn-info">
				      <input type="radio" value="I" <?php echo (!empty($value['presensi'])) ?( ($value['presensi']['presensi_'.(($data_get['stat'] == "M") ? "masuk" : "pulang")] == "I") ? "checked" : "" ) : "" ; ?>  name="data[<?php echo $key ?>][presensi]"> I
				    </label>
				    <label class="radio-inline btn btn-warning">
				      <input type="radio" value="S"  <?php echo (!empty($value['presensi'])) ?( ($value['presensi']['presensi_'.(($data_get['stat'] == "M") ? "masuk" : "pulang")] == "S") ? "checked" : "" ) : "" ; ?>  name="data[<?php echo $key ?>][presensi]"> S
				    </label>
			    </div>
				    <input type="text" style="margin-top:1%;" placeholder="keterangan" value="<?php echo (!empty($value['presensi'])) ? $value['presensi']['keterangan'] : '' ?>" class="form-control" name="data[<?php echo $key ?>][keterangan]">
			<hr>
			<?php endforeach ?>
			<hr>
			<button class="btn btn-success btn-absen-submit" type="submit"><i class=" icon-floppy-disk"></i> Simpan</button>
			</form>
		</div>
	</div>
</div>
