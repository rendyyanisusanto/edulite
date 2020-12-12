<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">
			<table style ="border: 1px solid black;" class="table table-bordered">
				<thead>
					<tr>
						<th rowspan="2">No</th>
						<th rowspan="2">Nama Siswa</th>
						<th colspan="3">Nilai Tugas</th>
						<th colspan="3">Nilai Ulangan</th>
						<th rowspan="2">UTS</th>
					</tr>
					
					<tr>
						<td>1</td>
						<td>2</td>
						<td>3</td>


						<td>1</td>
						<td>2</td>
						<td>3</td>
					</tr>
				</thead>
				<tbody>
					<?php 
					$no = 0;
					foreach ($data_get['siswa'] as $key => $value): ?>
						<tr>
							<td><?php echo ++$no ?></td>
							<td><?php echo $value['nama'] ?></td>
							<td><input type="number" name="" class="form-control"></td>
							<td><input type="number" name="" class="form-control"></td>
							<td><input type="number" name="" class="form-control"></td>
							<td><input type="number" name="" class="form-control"></td>
							<td><input type="number" name="" class="form-control"></td>
							<td><input type="number" name="" class="form-control"></td>
							<td><input type="number" name="" class="form-control"></td>
						</tr>
					<?php endforeach ?>
				</tbody>
			</table>
		</div>
	</div>
</div>