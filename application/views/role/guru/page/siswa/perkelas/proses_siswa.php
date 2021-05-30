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
						<th style ="border: 1px solid black;" class="bg-blue" rowspan="2">NIS</th>
						<th style ="border: 1px solid black;" class="bg-blue" rowspan="2">Nama</th>
						<th style ="border: 1px solid black;" class="bg-blue" rowspan="2">Kelas</th>
						<th style ="border: 1px solid black;width: 2%;" class="bg-blue"  rowspan="2">J.Kelamin</th>
						<th style ="border: 1px solid black;" class="bg-blue"  rowspan="2">TTL</th>
						<th class="bg-blue" style="border: 1px solid black;width: 1%;">#</th>
					</tr>
				</thead>
				<tbody>
					<?php 
					$no = 0;
					foreach ($data_get['siswa'] as $key => $value): ?>
						<?php $rand = rand(0,99999); ?>
						<tr>
							<td class="bg-info"><?php echo ++$no ?></td>
							<td><?php echo '<a href="siswa/detail_all/'.$value['id_siswa'].'" class="app-item">'.strtoupper($value['nis']).'</a>' ?></td>
							<td><?php echo '<a href="siswa/detail_all/'.$value['id_siswa'].'" class="app-item">'.strtoupper($value['nama']).'</a>' ?></td>
							<td><?php echo strtoupper($value['kelas'])?></td>
							<td><?php echo strtoupper($value['jenis_kelamin'])?></td>
							<td><?php echo strtoupper($value['tempat_lahir'])?>/<?php echo $value['tanggal_lahir'] ?></td>
							<td><a class="app-item" href="Siswa/edit_page/<?php echo $value['id_siswa'] ?>">Edit</a></td>

						</tr>
					<?php endforeach ?>
				</tbody>
			</table>
</div>