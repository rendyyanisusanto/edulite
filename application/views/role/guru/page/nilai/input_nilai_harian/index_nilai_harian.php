<div class="panel panel-body">
	<center><h3>Nilai Pengetahuan </h3></center>
			<div class="alert alert-warning">
				Jika anda lebih familiar menggunakan ms excel silahkan <a href="<?php echo base_url('guru/nilai/download_file_pengetahuan/'.$data_get['kelas']['id_kelas'].'/'.$data_get['mata_pelajaran']['id_mata_pelajaran'].'/'.$data_get['tahun_ajaran']['id_tahun_ajaran'].'/'.$data_get['kd']['id_kd'].'/'.$data_get['jenis_pengetahuan']['id_jenis_pengetahuan']) ?>" target="__blank">download format ini</a>, kemudian lakukan import data pada form dibawah<br>
				<form action="<?php echo $data_get['param']['table'] ?>/import_pengetahuan/<?php echo $data_get['kd']['id_kd'] ?>" id="app-import" method="POST">
					<input type="hidden" name="idmatapelajaran_fk" value="<?php echo $data_get['mata_pelajaran']['id_mata_pelajaran']; ?>" class="form-control input-xs">
							<input type="hidden" name="idguru_fk" value="<?php echo $data_get['guru']['id_guru']; ?>" class="form-control input-xs">
							<input type="hidden" name="idkelas_fk" value="<?php echo $data_get['kelas']['id_kelas']; ?>" class="form-control input-xs">
							<input type="hidden" name="idtahunajaran_fk" value="<?php echo $data_get['tahun_ajaran']['id_tahun_ajaran']; ?>" class="form-control input-xs">
							<input type="hidden" name="idjenispengetahuan_fk" value="<?php echo $data_get['jenis_pengetahuan']['id_jenis_pengetahuan']; ?>" class="form-control input-xs">
							<input type="hidden" name="idkd_fk" value="<?php echo $data_get['kd']['id_kd'] ?>" class="form-control input-xs">
					<input type="file" name="file_upload"><br>
					<button type="submit" class="btn btn-success">Import</button>
				</form>
			</div>
			<table class="table table-bordered table-framed" style="width: 100%;" >
		        <tr>
		          <td class="bg-slate">Mata Pelajaran</td>
		          <td class="bg-slate-300"><?php echo $data_get['mata_pelajaran']['mata_pelajaran'] ?></td>
		        </tr>
		        <tr>
		          <td class="bg-slate">KD 3</td>
		          <td class="bg-slate-300"><?php echo $data_get['kd']['ringkasan'] ?></td>
		        </tr>
		        <tr>
		          <td class="bg-slate">Jenis Penilaian</td>
		          <td class="bg-slate-300"><?php echo $data_get['jenis_pengetahuan']['jenis_pengetahuan'] ?></td>
		        </tr>
		      </table>
		      <hr>
	<table style ="border: 1px solid black;" class="table table-bordered">
				<thead>
					<tr>
						<th style ="border: 1px solid black;" class="bg-blue" width="2%" rowspan="2">No</th>
						<th style ="border: 1px solid black;" class="bg-blue" rowspan="2">Nama Siswa</th>
						<th style ="border: 1px solid black;" class="bg-blue" width="20%" rowspan="2">NT</th>
					</tr>
				</thead>
				<tbody>
					<?php 
					$no = 0;
					foreach ($data_get['siswa_fix'] as $key => $value): ?>
						<?php $rand = rand(0,99999); ?>
						<tr>
							<td class="bg-info"><?php echo ++$no ?></td>
							<td><?php echo $value['siswa']['nama'] ?></td>
							<td><input type="number" placeholder="0-100" value="<?php echo isset($value['nilai']['nilai']) ? $value['nilai']['nilai']:''; ?>" name="data[<?php echo $rand ?>][nilai]" class="form-control input-xs"></td>
							<input type="hidden" name="data[<?php echo $rand ?>][idsiswa_fk]" value="<?php echo $value['siswa']['id_siswa']; ?>" class="form-control input-xs">
						</tr>
					<?php endforeach ?>
				</tbody>
			</table>
</div>