<div class="panel panel-body">
			<table class="table table-bordered table-framed">
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
										<?php echo $value['silabus']['file']; ?>
								<?php }else{
									echo "<b class='text-danger'>Belum ada file</b>";
								} ?>
									
							</td>
							<td><button class="btn btn-sm btn-<?php echo (!empty($value['silabus'])) ? "success" : "danger" ; ?> btn-act" 
								 
								type="button"><i class="icon-circle-right2"></i></button></td>
						</tr>
					<?php endforeach ?>
				</tbody>
			</table>
			
		</div>