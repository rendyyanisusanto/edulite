<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">

			<center><h4>Data Presensi Guru Tanggal <?php echo $data_get['tanggal'] ?></h4></center>

			<table class="table table-xxs table-framed table-bordered">
				<thead>
					<tr>
						<th width="1%">No</th>
						<th>Nama Guru</th>
						<th width="10%" style="text-align: center;">Clock In</th>
						<th width="10%" style="text-align: center;">Clock Out</th>
					</tr>
				</thead>
				<tbody>
					<?php 
					$no = 0;
					foreach ($data_get['presensi'] as $key => $value): ?>
						<tr>
							<td><?php echo ++$no; ?></td>
							<td><?php echo $value['guru']['nama'] ?></td>
							<td style="text-align: center;"><?php echo ($value['is_jadwal'] == 0) ? "Tidak ada jadwal" : ((!empty($value['presensi_guru']['jam_masuk']) && $value['presensi_guru']['jam_masuk'] !== '00:00:00' ) ? "<b class='text-success'>".$value['presensi_guru']['jam_masuk']."</b>" : "<b class='text-danger'><i class='icon-close2'></i></b>"); ?></td>
							<td style="text-align: center;"><?php echo ($value['is_jadwal'] == 0) ? "Tidak ada jadwal" : ((!empty($value['presensi_guru']['jam_keluar']) && $value['presensi_guru']['jam_keluar'] !== '00:00:00' ) ? "<b class='text-success'>".$value['presensi_guru']['jam_keluar']."</b>" : "<b class='text-danger'><i class='icon-close2'></i></b>") ?></td>
						</tr>
					<?php endforeach ?>
				</tbody>
			</table>
		</div>
	</div>
</div>