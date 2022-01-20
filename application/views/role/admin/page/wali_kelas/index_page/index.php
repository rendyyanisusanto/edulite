<div class="row">
	<div class="panel panel-body">
		<center><h3>Data Wali Kelas Tahun Pelajaran <?php echo $data_get['tahun_ajaran']['tahun_ajaran'] ?></h3></center>
		<table class="table table-framed table-bordered table-sm">
			<thead>
				<tr>
					<th width="1%">No</th>
					<th>Kelas</th>
					<th>Walas</th>
					<th width="3%">#</th>
				</tr>
			</thead>
			<tbody>
				<?php 
				$no=0;
				foreach ($data_get['kelas'] as $key => $value): ?>
					<tr>
						<td><?php echo ++$no ?></td>
						<td><?php echo $value['kelas']['kelas'] ?></td>
						<td><?php echo (!empty($value['guru'])) ? '<b class="text-success">'.$value['guru']['nama'].'</b>' : '<b class="text-danger" style="font-weight : bold;"> Belum Disetting </b>'; ?></td>
						<td><button type="button" data-kelas="<?php echo $value['kelas']['kelas'] ?>" data-id="<?php echo $value['kelas']['id_kelas'] ?>" class="btn btn-sm btn-config btn-primary"><i class="icon-pencil3"></i></button></td>
					</tr>
				<?php endforeach ?>
			</tbody>
		</table>
	</div>
</div>

<div class="modal">
	<div class="modal-dialog">
		<div class="modal-content">
			<form action="Wali_kelas/simpan_data" class="frm-wali" method="POST">
			<div class="modal-header">
				<b><h3 class="modal-title"></h3></b>
			</div>
			<div class="modal-body">
				<input type="hidden" class="id_kelas" name="id_kelas">
				<label>Guru</label>
				<br>
				<select class="form-control" name="id_guru">
					<?php foreach ($data_get['guru'] as $key => $value): ?>
						<option value="<?php echo $value['id_guru'] ?>"><?php echo $value['nama'] ?></option>
					<?php endforeach ?>
				</select>
			</div>
			<div class="modal-footer">
				<button class="btn btn-danger" type="button" data-dismiss="modal"><i class="icon-close2"></i> Tutup</button>
				<button class="btn btn-primary" type="submit"><i class="icon-floppy-disk"></i> Simpan</button>
			</div>
			</form>
		</div>
	</div>
</div>