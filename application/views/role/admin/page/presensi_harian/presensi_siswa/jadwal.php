<?php if (count($data_get['mapel_hari_ini']) > 0): ?>
	
<div class="row">
	<div class="col-md-12">
			<div class="panel panel-body">
				<center><b><u>Tugas anda hari ini</u></b></center>

				<table class="table table-bordered table-xxs table-framed">
					<thead>
						<tr>
							<th width="1%">No</th>
							<th>KLS</th>
							<th>MAPEL</th>
							<th width="1%">JAM</th>
							<th width="1%">Abs</th>
							<th width="1%">#</th>
						</tr>
					</thead>
					<tbody>
						<?php $no = 0; ?>
						<?php foreach ($data_get['mapel_hari_ini'] as $value): ?>
							<tr>
								<td><?= (++$no); ?></td>
								<td><?php echo $value['mapel']['kelas']; ?></td>
								<td><?php echo $value['mapel']['kode_pelajaran']; ?></td>
								<td><?php echo $value['mapel']['nama'] ?></td>
								<!-- <td><a href="Jurnal_guru/jurnal/<?= $value['mapel']['id_jadwal_pelajaran'] ?>" class="app-item"><?= '<b>'.$value['mapel']['kode_pelajaran'].'<b> Kelas <b>'.$value['mapel']['kelas'].'</b> Jam Ke-'.$value['mapel']['nama'] ?></a></td> -->
								<td><b class="<?php echo ($value['absen']>0) ? 'text-success icon-checkmark2' : 'text-danger icon-close2'; ?>"></b></td>
								
								<td><button class="btn btn-success btn-sm btn-absen" data-idmapel="<?= $value['mapel']['id_jadwal_pelajaran'] ?>" type="button" ><i class="icon-eye"></i></button></td>
							</tr>
						<?php endforeach ?>
					</tbody>
				</table>
			</div>
		</div>
</div>

<?php endif ?>