<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">
			<center><h3>Nilai pas </h3></center>
			<div class="alert alert-warning">
				Jika anda lebih familiar menggunakan ms excel silahkan <a href="<?php echo base_url('guru/nilai/download_file_pas/'.$data_get['kelas']['id_kelas'].'/'.$data_get['mata_pelajaran']['id_mata_pelajaran'].'/'.$data_get['tahun_ajaran']['id_tahun_ajaran']) ?>" target="__blank">download format ini</a>, kemudian lakukan import data pada form dibawah<br>
				<form action="<?php echo $data_get['param']['table'] ?>/import_pas" id="app-import" method="POST">
					<input type="hidden" name="idmatapelajaran_fk" value="<?php echo $data_get['mata_pelajaran']['id_mata_pelajaran']; ?>" class="form-control input-xs">
							<input type="hidden" name="idguru_fk" value="<?php echo $data_get['guru']['id_guru']; ?>" class="form-control input-xs">
							<input type="hidden" name="idkelas_fk" value="<?php echo $data_get['kelas']['id_kelas']; ?>" class="form-control input-xs">
							<input type="hidden" name="idtahunajaran_fk" value="<?php echo $data_get['tahun_ajaran']['id_tahun_ajaran']; ?>" class="form-control input-xs">
					<input type="file" name="file_upload"><br>
					<button type="submit" class="btn btn-success">Import</button>
				</form>
			</div>
			<table class="table table-bordered table-framed" style="width: 50%;" >
		        <tr>
		          <td class="bg-slate">Nama Guru</td>
		          <td class="bg-slate-300"><?php echo $data_get['guru']['nama'] ?></td>
		        </tr>
		        <tr>
		          <td class="bg-slate">Kelas</td>
		          <td class="bg-slate-300"><?php echo $data_get['kelas']['kelas'] ?></td>
		        </tr>
		        <tr>
		          <td class="bg-slate">Mata Pelajaran</td>
		          <td class="bg-slate-300"><?php echo $data_get['mata_pelajaran']['mata_pelajaran'] ?></td>
		        </tr>
		      </table>
		      <hr>
			<form action="<?php echo $data_get['param']['table'] ?>/simpan_pas" id="app-submit" method="POST">
				<input type="hidden" name="idmatapelajaran_fk" value="<?php echo $data_get['mata_pelajaran']['id_mata_pelajaran']; ?>" class="form-control input-xs">
							<input type="hidden" name="idguru_fk" value="<?php echo $data_get['guru']['id_guru']; ?>" class="form-control input-xs">
							<input type="hidden" name="idtahunajaran_fk" value="<?php echo $data_get['tahun_ajaran']['id_tahun_ajaran']; ?>" class="form-control input-xs">
			<table style ="border: 1px solid black;" class="table table-bordered">
				<thead>
					<tr>
						<th style ="border: 1px solid black;" class="bg-blue" width="2%" rowspan="2">No</th>
						<th style ="border: 1px solid black;" class="bg-blue" rowspan="2">Nama Siswa</th>
						<th style ="border: 1px solid black;" class="bg-blue" width="20%" rowspan="2">UAS</th>
					</tr>
				</thead>
				<tbody>
					<?php 
					$no = 0;

					foreach ($data_get['siswa'] as $key => $value): ?>
					<?php $rand = rand(0,99999); ?>
						<tr>
							<td class="bg-info"><?php echo ++$no ?></td>
							<td><?php echo $value['nama'] ?></td>
							<td><input type="number" placeholder="Range nilai 0-100" value="<?php echo (isset($value['nilai_pas']))? $value['nilai_pas'] : ''; ?>" name="data[<?php echo $rand ?>][nilai]" class="form-control input-xs"></td>
							<input type="hidden" name="data[<?php echo $rand ?>][idsiswa_fk]" value="<?php echo $value['id_siswa']; ?>" class="form-control input-xs">
							
						</tr>
					<?php endforeach ?>
				</tbody>
			</table>

			<br>

			<button class="btn btn-success" type="submit"><i class="icon-floppy-disk"></i> Submit Nilai</button>
		</form>
		</div>
	</div>
</div>