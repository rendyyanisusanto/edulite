<div class="panel panel-body">
	<center><h3>Rapor Siswa Tahun Ajaran <?php echo $data_get['tahun_ajaran']['tahun_ajaran'].' Semester '.$data_get['tahun_ajaran']['semester'] ?></h3></center>
	<table class="table table-bordered table-framed">
		<thead>
			<tr>
				<th width="20%">NIS</th>
				<th>Nama</th>
				<th width="2%">PTS</th>
				<th width="2%">PAS</th>
			</tr>
		</thead>
		<tbody>
			<?php foreach ($data_get['siswa'] as $key => $value): ?>
				<tr>
					<td><?php echo $value['nis'] ?></td>
					<td><?php echo $value['nama'] ?></td>
					<td><a href="<?php echo base_url('guru/rapor/print_pts/'.$value['id_siswa'].'/'.$data_get['tahun_ajaran']['id_tahun_ajaran']) ?>" target="__blank" class="btn btn-success"><i class="icon-printer"></i></a></td>
					<td><a href="<?php echo base_url('guru/rapor/print_pas/'.$value['id_siswa'].'/'.$data_get['tahun_ajaran']['id_tahun_ajaran'].'/'.$data_get['kelas']['id_kelas']) ?>" target="__blank" class="btn btn-primary"><i class="icon-printer"></i></a></td>
				</tr>
			<?php endforeach ?>
		</tbody>
	</table>
</div>