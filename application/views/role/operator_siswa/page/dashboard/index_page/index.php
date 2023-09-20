
<div class="row">
	<div class="alert alert-success">
		<marquee>Hallo <b><?php echo $data_get['guru']['nama'] ?></b>, Selamat datang di aplikasi EDULITE milik SMK IT ASY SYADZILI. Hak akses anda saat ini adalah sebagai <b>OPERATOR</b></marquee>
	</div>
</div>
<div class="row">
	<div class="col-md-6">
		<div class="panel panel-body">
			<table class="table table-framed table-xxs">
				<thead>
					<tr>
						<th>No</th>
						<th>Tanggal</th>
						<th>Nama</th>
						<th>Kelas</th>
						<th>Keterangan</th>
					</tr>
				</thead>
				<tbody>
					<?php 
					$no = 0;
					foreach ($data_get['ijin_siswa'] as $key => $value): ?>
						<tr>
							<td><?php echo ++$no; ?></td>
							<td><?php echo $value['tanggal'] ?></td>
							<td><?php echo $value['nama'] ?></td>
							<td><?php echo $value['kelas'] ?></td>
							<td><b style="color: <?php echo $value['c_jenis_ijin'] ?>"><?php echo $value['jenis_ijin'] ?></b></td>
						</tr>
					<?php endforeach ?>
				</tbody>
			</table>
		</div>
	</div>
	<div class="col-md-6"></div>
</div>
