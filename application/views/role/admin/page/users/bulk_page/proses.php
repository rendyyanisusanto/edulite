<div class="panel panel-body">
	
	<h4><b>Kelas : <?php echo $data_get['kelas']['kelas'] ?></b></h4>

	<table class="table table-framed table-bordered table-xxs">
		<thead>
			<tr>
				<th>Nama</th>
				<th>Username</th>
				<th>Password</th>
			</tr>
		</thead>
		<tbody>
			<?php foreach ($data_get['siswa'] as $key => $value): 

				$usr = explode(' ', $value['nama'])[0].rand(0, 100000);
				?>
				<tr>
					<td><?php echo $value['nama'] ?><input type="hidden" class="form-control" name="data[<?php echo $key ?>][id_siswa]" value="<?php echo $value['id_siswa'] ?>"></td>
					<td><input type="text" class="form-control" name="data[<?php echo $key ?>][username]" value="<?php echo $usr ?>"></td>
					<td><input type="text" class="form-control" name="data[<?php echo $key ?>][password]" value="<?php echo $usr ?>"></td>
				</tr>
			<?php endforeach ?>
		</tbody>
	</table>

	<hr>
	<button type="submit" class="btn btn-block btn-success legitRipple">Simpan <i class="icon-floppy-disk position-right"></i></button>
</div>