
			<table class="table table-bordered table-framed table-xxs">
				<thead>
					<tr>
						<td width="2%">No</td>
						<td>Tanggal</td>
						<td>Tindakan</td>
					</tr>
				</thead>
				<tbody>
					<?php $no = 0; ?>
					<?php if (count($data_get['tindakan'])>0){ ?>
						
						<?php foreach ($data_get['tindakan'] as $key => $value): ?>

							<tr>
								<td><?php echo ++$no; ?></td>
								<td><?php echo $value['tanggal'] ?></td>
								<td><?php echo $value['tindakan'] ?></td>
							</tr>
						<?php endforeach ?>
					
					<?php }else{
						echo "<tr><td colspan='3'><center>Tidak ada data</center></td></tr>";
					} ?>
				</tbody>
			</table>