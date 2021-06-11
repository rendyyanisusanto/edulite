<div class="panel panel-body">
	<div class="row">
		<div class="col-lg-4">
			<div class="panel panel-body">
				<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/simpan_data" id="app-submit" method="POST">
					<div class="form-group">
						<label class="col-lg-4 control-label">Nama</label>
						<div class="col-lg-8">
							<input type="hidden" name="id_jam_pelajaran" class="id_jam_pelajaran">
							<input type="text" name="nama" placeholder="Jam ke - 1, 2, 3" class="form-control nama">
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-4 control-label">Jam Mulai</label>
						<div class="col-lg-8">
							<input type="text" name="jam_mulai" placeholder="Contoh : 07.00" class="form-control jam_mulai">
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-4 control-label">Jam Selesai</label>
						<div class="col-lg-8">
							<input type="text" name="jam_selesai" placeholder="Contoh : 16.00"  class="form-control jam_selesai">
						</div>
					</div>
					<button type="submit" class="btn btn-success btn-submit"><i class="icon-floppy-disk"></i> Simpan</button>
					<button type="button" style="display: none;" class="btn btn-danger btn-batal"><i class="icon-cancel-circle2"></i> Batal</button>

				</form>
			</div>
		</div>
		<div class="col-lg-8">
			<table class="table table-framed table-bordered table-xxs">
				<thead>
					<tr>
						<th width="15%">Jam ke-</th>
						<th>Jam Mulai</th>
						<th>Jam Selesai</th>
						<th width="1%">#</th>
						<th width="1%">#</th>
					</tr>
				</thead>
				<tbody>
					<?php foreach ($data_get['jam_pelajaran'] as $key => $value): ?>
					<tr>
						<td><?php echo $value['nama'] ?></td>
						<td><?php echo $value['jam_mulai'] ?></td>
						<td><?php echo $value['jam_selesai'] ?></td>
						<td><button type="button"
							data-id_jam_pelajaran="<?php echo $value['id_jam_pelajaran'] ?>" 
							data-nama="<?php echo $value['nama'] ?>" 
							data-jam_mulai="<?php echo $value['jam_mulai'] ?>" 
							data-jam_selesai="<?php echo $value['jam_selesai'] ?>" 
							class="btn btn-success btn-xs btn-edit"><i class="icon-pencil"></i></button></td>
						<td><button type="button"
							data-id_jam_pelajaran="<?php echo $value['id_jam_pelajaran'] ?>" 
							class="btn btn-danger btn-xs btn-del"><i class="icon-trash"></i></button></td>
					</tr>
					<?php endforeach ?>
				</tbody>
			</table>
		</div>
	</div>
	
	
</div>