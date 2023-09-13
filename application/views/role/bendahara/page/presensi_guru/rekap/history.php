<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">

			
			<div class="col-md-8">
				<table class="table table-bordered table-framed">
					<tr>
						<td>NIP</td>
						<td><?php echo $data_get['guru']['nip'] ?></td>
					</tr>
					<tr>
						<td>Nama</td>
						<td><?php echo $data_get['guru']['nama'] ?></td>
					</tr>
					<tr>
						<td>Jabatan</td>
						<td><?php echo $data_get['guru']['jabatan'] ?></td>
					</tr>
				</table>
			</div>
			<div class="col-md-2">
				<img src="<?php echo base_url('include/media/foto_pegawai/'.$data_get['guru']['foto']) ?>" style="max-width: 90px;margin:0;" class="img">
			</div>

			<div class="col-md-12">
				<hr>
				<table class="table table-bordered table-framed">
					<thead>
						<tr>
							<th width="15%">Tanggal</th>
							<th>Hari</th>
							<th width="15%">Check In</th>
							<th width="15%">Check Out</th>
						</tr>
					</thead>
					<tbody>
						<?php foreach ($data_get['hari'] as $key => $value): ?>
							<tr class="<?php echo ($value['is_jadwal'] == 0) ? "text-warning" : ""; ?>">
								<td><?php echo $value['tanggal'] ?></td>
								<td><?php echo $value['hari'] ?></td>
								<td><?php echo ($value['is_jadwal'] == 0) ? "Tidak ada jadwal" : ((!empty($value['presensi_guru']['jam_masuk'])) ? "<b class='text-success'>".$value['presensi_guru']['jam_masuk']."</b>" : "<b class='text-danger'><i class='icon-close2'></i></b>"); ?></td>
								<td><?php echo ($value['is_jadwal'] == 0) ? "Tidak ada jadwal" : ((!empty($value['presensi_guru']['jam_keluar'])) ? "<b class='text-success'>".$value['presensi_guru']['jam_keluar']."</b>" : "<b class='text-danger'><i class='icon-close2'></i></b>") ?></td>
							</tr>
						<?php endforeach ?>
					</tbody>
				</table>
			</div>
			
			
			
		</div>
	</div>
</div>