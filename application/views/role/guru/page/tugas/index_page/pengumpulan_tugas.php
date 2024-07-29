<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">
			<center><h4>Pengumpulan Tugas</h4></center>
			<br>
			<table class="table table-xxs table-framed table-bordered" style="width: 100%;">
				<tr>
					<td >Judul</td>
					<td width="1%">:</td>
					<td><?php echo $data_get['tugas']['kode'] ?></td>
				</tr>
				<tr>
					<td >Judul</td>
					<td width="1%">:</td>
					<td><?php echo $data_get['tugas']['judul'] ?></td>
				</tr>
				<tr>
					<td >Deadline</td>
					<td width="1%">:</td>
					<td><?php echo $data_get['tugas']['deadline'] ?></td>
				</tr>
				<tr>
					<td >Kelas</td>
					<td width="1%">:</td>
					<td><?php echo $data_get['kelas']['kelas'] ?></td>
				</tr>
			</table>
			<br>
			<table class="table table-xxs table-framed table-bordered">
				<thead>
					<tr>
						<th width="1%">No</th>
						<th>Siswa</th>
						<th>Jawaban</th>
						<th>File</th>
					</tr>
				</thead>
				<tbody>
					<?php 
					$no = 0;
					foreach ($data_get['pengumpulan_tugas'] as $key => $value): ?>
						<tr>
							<td><?php echo ++$no; ?></td>
							<td><?php echo $value['siswa']['nama'] ?></td>
							<td><?php echo $value['tugas']['jawaban'] ?></td>
							<td><a href="<?php echo $value['tugas']['file'] ?>">File Tugas</a></td>
						</tr>
					<?php endforeach ?>
				</tbody>
			</table>
		</div>
	</div>
</div>