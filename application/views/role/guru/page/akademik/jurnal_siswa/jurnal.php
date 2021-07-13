<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">
			<div class="col-md-12">
				<div class="panel panel-body">
					<form  action="Akademik/save_jurnal_harian" id="app-jurnal-save" method="POST">
						<input type="hidden" class="id_jurnal_guru" name="id_jurnal_guru">
						<input type="hidden" name="idmapel" value="<?php echo $data_get['mapel'] ?>">
						<input type="hidden" name="tanggal" value="<?php echo $data_get['tanggal'] ?>">
						<label>Uraian Kegiatan</label>
						<textarea class="form-control uraian_jurnal" name="uraian"></textarea>
						<br>
						<button type="submit" class="btn btn-jurnal-submit btn-success"><i class="icon-floppy-disk"></i> Simpan</button>
						<button class="btn btn-danger btn-batal" type="button" style="display: none;"><i class="icon-close2"></i> Batal</button>
					</form>
				</div>
			</div>
			<div class="col-md-12">
				<table class="table table-bordered table-framed table-xxs">
					<thead>
						<tr>
							<th width="1%">No</th>
							<th>Uraian</th>
							<th width="2%">#</th>
							<th width="2%">#</th>
						</tr>
					</thead>
					<tbody>
						<?php $no = 0; ?>
						<?php if (!empty($data_get['jurnal_guru'])){ ?>
							<?php foreach ($data_get['jurnal_guru'] as $key => $value): ?>
								<tr>
									<td><?php echo ++$no ?></td>
									<td><?php echo $value['uraian'] ?></td>
									<td><button class="btn btn-xs btn-success btn-edit-jurnal" data-uraian="<?php echo $value['uraian'] ?>" data-id="<?php echo $value['id_jurnal_guru'] ?>"><i class="icon-pencil3"></i></button></td>
									<td><button class="btn btn-xs btn-danger btn-del-jurnal" data-idmapel="<?php echo $data_get['mapel'] ?>" data-tanggal="<?php echo $data_get['tanggal'] ?>" data-id="<?php echo $value['id_jurnal_guru'] ?>"><i class="icon-trash"></i></button> </td>
								</tr>
							<?php endforeach ?>
							
						<?php }else{
							echo "<tr><td colspan='2'><b><center>Belum ada data</center></b></td></tr>";
						} ?>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
</div>