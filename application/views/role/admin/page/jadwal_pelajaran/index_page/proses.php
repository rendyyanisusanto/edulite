<div class="panel panel-body">
	<center>
		<h3>Jadwal Pelajaran Kelas <?php echo $data_get['kelas']['kelas'] ?> Tahun Ajaran <?php echo $data_get['tahun_ajaran']['tahun_ajaran'] ?></h3>
	</center>
	<table class="table table-bordered table-framed">
		<thead>
			<tr>
				<th class="bg-primary">Jam Pelajaran</th>
				<?php foreach ($data_get['hari'] as $key => $value): ?>
				<th class="bg-primary"><?php echo $value['hari'] ?></th>
				<?php endforeach ?>
			</tr>
		</thead>
		<tbody>
			<?php foreach ($data_get['jadwal'] as $key => $value): ?>
			<tr>
				<td class="text-center"><b>Jam ke-<?php echo $value['jam_pelajaran']['nama'] ?></b> (<?php echo $value['jam_pelajaran']['jam_mulai'].'-'.$value['jam_pelajaran']['jam_selesai'] ?>)</td>
				<?php foreach ($data_get['hari'] as $key_hari => $value_hari): ?>
				<td class="text-center"><?php echo ($value['jadwal'][$key_hari]) ? "<a data-idjadwal='".$value['jadwal'][$key_hari]['id_jadwal_pelajaran']."' data-idmapel='".$value['jadwal'][$key_hari]['idgurumapel_fk']."' data-hari='".$value_hari['hari']."' data-idhari='".$value_hari['id_hari']."' data-jam_ke='".$value['jam_pelajaran']['nama']."' data-idjam='".$value['jam_pelajaran']['id_jam_pelajaran']."' class='btn-edit-proses'>".'('.$value['jadwal'][$key_hari]['nip'].') '.$value['jadwal'][$key_hari]['kode_pelajaran']."</a>" : "<button data-hari='".$value_hari['hari']."' data-idhari='".$value_hari['id_hari']."' data-jam_ke='".$value['jam_pelajaran']['nama']."' data-idjam='".$value['jam_pelajaran']['id_jam_pelajaran']."' class='btn btn-add-proses btn-success btn-xs'><i class='icon-plus3'></i></button>" ; ?></td>
				<?php endforeach ?>
				
			</tr>
			<?php endforeach ?>
		</tbody>
	</table>
</div>