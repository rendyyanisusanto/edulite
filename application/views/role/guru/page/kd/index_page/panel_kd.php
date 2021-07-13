<script src="<?php echo base_url('include/template/limitless/')?>/global_assets/js/core/libraries/jquery_ui/widgets.min.js"></script>
<script src="<?php echo base_url('include/template/limitless/')?>/global_assets/js/core/libraries/jquery_ui/effects.min.js"></script>
<div class="panel panel-body">
	<table class="table table-bordered table-framed">
		<tr>
			<td class="bg-blue">Mata Pelajaran</td>
			<td class="bg-info"><?php echo $data_get['mapel']['mata_pelajaran'] ?></td>
		</tr>
		<tr>
			<td class="bg-blue">Kelas</td>
			<td class="bg-info"><?php echo $data_get['kelas']['kelas'] ?><?php echo $data_get['id_tahun_ajaran'] ?></td>
		</tr>
	</table>
	<br>

	<button type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#modal_default"><i class="icon-plus3">
	</i> Tambah Materi/KD </button>
	<button type="button" class="btn btn-primary btn-duplicat pull-right btn-sm"
	data-idtingkat_fk = "<?php echo $data_get['kelas']['idtingkat_fk'] ?>"
	data-idkelas_fk = "<?php echo $data_get['kelas']['id_kelas'] ?>"
	data-idtahunajaran_fk = "<?php echo $data_get['id_tahun_ajaran'] ?>"
	data-idguru_fk = "<?php echo $data_get['id_guru']?>"
	data-idmapel_fk = "<?php echo $data_get['mapel']['id_mata_pelajaran'] ?>"
	><i class="icon-copy">
	</i> Duplikat</button>
	<hr>
	
	<div class="p-kd">
		
	</div>

</div>
<div id="modal_default" class="modal fade" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<form class="form-horizontal" action="Kd/add_kd" id="app-submit" method="POST">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">Tambah Materi/KD</h5>
				</div>
				<div class="modal-body">
					
					<input type="hidden" name="id_mata_pelajaran" class="id_mata_pelajaran" value="<?php echo $data_get['id_mapel'] ?>">
					<input type="hidden" name="id_kelas" class="id_kelas" value="<?php echo $data_get['id_kelas'] ?>">
					<input type="hidden" name="id_guru" class="id_guru" value="<?php echo $data_get['id_guru'] ?>">
					<input type="hidden" name="id_tahun_ajaran" class="id_tahun_ajaran" value="<?php echo $data_get['id_tahun_ajaran'] ?>">
					<div class="form-group">
						<label class="col-lg-4 control-label">Nama Materi</label>
						<div class="col-lg-8">
							<input type="text" class="form-control" required name="materi" class="materi" placeholder="Input here......">
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-4 control-label">KD 3 - Pengetahuan</label>
						<div class="col-lg-8">
							<input type="text" class="form-control" required name="kdtiga" class="kdtiga" placeholder="Input here......">
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-4 control-label">KD 4 - Keterampilan</label>
						<div class="col-lg-8">
							<input type="text" class="form-control" required name="kdempat" class="kdempat" placeholder="Input here......">
						</div>
					</div>
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary">Simpan</button>
				</div>
			</form>
		</div>
	</div>
</div>

<div id="modal_edit" class="modal fade" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<form class="form-horizontal" action="Kd/update_kd" id="app-submit-update" method="POST">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">Tambah Materi/KD</h5>
				</div>
				<div class="modal-body">
					<input type="hidden" name="idmateri_fk" class="idmateri">
					<input type="hidden" name="id_mata_pelajaran" class="id_mata_pelajaran" value="<?php echo $data_get['id_mapel'] ?>">
					<input type="hidden" name="id_kelas" class="id_kelas" value="<?php echo $data_get['id_kelas'] ?>">
					<input type="hidden" name="id_guru" class="id_guru" value="<?php echo $data_get['id_guru'] ?>">
					<input type="hidden" name="id_tahun_ajaran" class="id_tahun_ajaran" value="<?php echo $data_get['id_tahun_ajaran'] ?>">
					<div class="form-group">
						<label class="col-lg-4 control-label">Nama Materi</label>
						<div class="col-lg-8">
							<input type="text" class="form-control materi" required name="materi" placeholder="Input here......">
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-4 control-label">KD 3 - Pengetahuan</label>
						<div class="col-lg-8">
							<input type="text" class="form-control kdtiga" required name="kdtiga" placeholder="Input here......">
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-4 control-label">KD 4 - Keterampilan</label>
						<div class="col-lg-8">
							<input type="text" class="form-control kdempat" required name="kdempat" placeholder="Input here......">
						</div>
					</div>
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary">Simpan</button>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- <div id="jui-dialog-form-horizontal" title="Tambah KD">
		
</div> -->
<div id="modal_cpy" class="modal fade" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<form class="form-horizontal" action="Kd/duplikat_proses" id="app-submit-duplicat" method="POST">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">Duplikat Materi/KD</h5>
				</div>
				<div class="modal-body">
					<div class="div-duplicat"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary">Proses</button>
				</div>
			</form>
		</div>
	</div>
</div>