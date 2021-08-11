<div class="panel panel-body">
			<table class="table table-xs table-bordered table-framed">
				<thead>
					<tr>
						<td>Kls</td>
						<td>Mapel</td>
						<td>File</td>
						<td width="2%">#</td>
					</tr>
				</thead>
				<tbody>
					<?php foreach ($data_get['set_guru'] as $key => $value): ?>
						<tr>
							<td><?php echo $value['dt_guru']['kelas'] ?></td>
							<td><?php echo $value['dt_guru']['mata_pelajaran'] ?></td>
							<td>
								<?php if (!empty($value['silabus'])){ ?>
										<a href="<?php echo base_url('include/media/silabus/'.$value['silabus']['file']) ?>" target="__blank">Download File</a>
								<?php }else{
									echo "<b class='text-danger'>Belum ada file</b>";
								} ?>
									
							</td>
							<td><button class="btn btn-xs btn-<?php echo (!empty($value['silabus'])) ? "success" : "danger" ; ?> btn-act" 
								data-idmapel_fk="<?php echo $value['dt_guru']['idmapel_fk'] ?>"
								data-idjurusan_fk="<?php echo $value['dt_guru']['idjurusan_fk'] ?>"
								data-idtingkat_fk="<?php echo $value['dt_guru']['idtingkat_fk'] ?>"
								data-mapel="<?php echo $value['dt_guru']['mata_pelajaran'] ?>"
								data-kelas="<?php echo $value['dt_guru']['kelas'] ?>"
								type="button"><i class="icon-circle-right2"></i></button></td>
						</tr>
					<?php endforeach ?>
				</tbody>
			</table>
			
		</div>