<div class="panel panel-body">
	<div class="alert alert-warning">
				Jika anda lebih familiar menggunakan ms excel silahkan <a href="<?php echo base_url('admin/siswa/download_file_siswa/'.$data_get['kelas']['id_kelas']) ?>" target="__blank">download format ini</a>, kemudian lakukan import data pada form dibawah<br>
				<form action="<?php echo $data_get['param']['table'] ?>/import_siswa/<?php echo $data_get['kelas']['id_kelas'] ?>" id="app-import" method="POST">
					<input type="hidden" name="idkelas_fk" value="<?php echo $data_get['kelas']['id_kelas'] ?>">
					
					<input type="file" name="file_upload"><br>
					<button type="submit" class="btn btn-success">Import</button>
				</form>
			</div>
	<table style ="border: 1px solid black;" class="table table-bordered">
				<thead>
					<tr>
						<th style ="border: 1px solid black;" class="bg-blue" width="2%" rowspan="2">No</th>
						<th style ="border: 1px solid black;" class="bg-blue" rowspan="2">Nama Siswa</th>
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
						</tr>
					<?php endforeach ?>
				</tbody>
			</table>
</div>