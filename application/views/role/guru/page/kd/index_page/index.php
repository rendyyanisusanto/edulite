<div class="row">
	<div class="col-md-5">
		<div class="panel panel-body">
			<table class="table table-bordered table-framed">
				<thead>
					<tr>
						<td>Kls</td>
						<td>Mapel</td>
						<td width="2%">#</td>
					</tr>
				</thead>
				<tbody>
					<?php foreach ($data_get['dt_guru']['mapel'] as $key => $value): ?>
						<tr>
							<td><?php echo $value['kelas'] ?></td>
							<td><?php echo $value['mata_pelajaran'] ?></td>
							<td><button class="btn btn-sm btn-success btn-act" 
								data-id_mapel="<?php echo $value['id_mata_pelajaran'] ?>" 
								data-id_kelas="<?php echo $value['id_kelas'] ?>" 
								data-id_tahun_ajaran="<?php echo $value['id_tahun_ajaran'] ?>" 
								data-id_guru="<?php echo $value['id_guru'] ?>" 
								type="button"><i class="icon-circle-right2"></i></button></td>
						</tr>
					<?php endforeach ?>
				</tbody>
			</table>
			
		</div>
	</div>
	<div class="col-md-7">
		<div class="panel-kd"></div>
	</div>
</div>