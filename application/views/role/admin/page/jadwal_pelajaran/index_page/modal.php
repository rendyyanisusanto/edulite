<div id="modal_add_jadwal" class="modal" tabindex="-1">
	<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/proses_add_jadwal" id="app-submit-modal" method="POST">
	<div class="modal-dialog  modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h5 class="modal-title">Jadwal Pelajaran</h5>
			</div>
			<div class="modal-body">
				
					<div class="form-group">
						<label class="col-lg-4 control-label">Guru/Mapel</label>
						<div class="col-lg-8">
							<select data-placeholder="Pilih Mata Pelajaran" name="idgurumapel_fk" class="select idmapelguru_fk">
								<?php foreach ($data_get['mapel_guru'] as $key => $value): ?>
								<option value="<?php echo $value['id_guru_mapel'] ?>"><?php echo $value['kode_pegawai'].' - '.$value['kode'].' ('.$value['nama'].')' ?></option>
								<?php endforeach ?>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label class="col-lg-4 control-label">Hari</label>
						<div class="col-lg-8">
							<input type="hidden" class="form-control idhari_modal" name="idhari_fk">
							<input type="text" disabled="" class="form-control hari_modal" >
						</div>
					</div>

					<div class="form-group">
						<label class="col-lg-4 control-label">Jam Ke</label>
						<div class="col-lg-3">
							<input class="form-control idjam_modal" type="hidden" name="idjampelajaran_fk" >
							<input class="form-control jam_modal" name="" disabled="">
						</div>
						<div class="col-lg-1">S/D</div>
						<div class="col-lg-4">
							<select data-placeholder="Pilih Jam Pelajaran" name="idjamsampai" class="select">
								<?php foreach ($data_get['jam_pelajaran'] as $key => $value): ?>
								<option value="<?php echo $value['id_jam_pelajaran'] ?>"><?php echo $value['nama'] ?></option>
								<?php endforeach ?>
							</select>
						</div>
					</div>
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
				<button type="submit" class="btn btn-primary">Save changes</button>
			</div>
		</div>
	</div>
	</form>
</div>

<div id="modal_ubah_jadwal" class="modal" tabindex="-1">
	<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/proses_ubah_jadwal" id="app-edit-modal" method="POST">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" style="background: red !important;color: white !important;padding:10px;" class="close btn btn-danger btn-del-jadwal" ><i class="icon-trash"></i> Hapus</button>
				<h5 class="modal-title">Jadwal Pelajaran</h5>
			</div>
			<div class="modal-body">
					<input type="hidden" name="id_jadwal_pelajaran" class="id_jadwal_pelajaran">
					<div class="form-group">
						<label class="col-lg-4 control-label">Guru/Mapel</label>
						<div class="col-lg-8">
							<select data-placeholder="Pilih Mata Pelajaran" name="idgurumapel_fk" class="select idmapelguruedit_fk">
								<?php foreach ($data_get['mapel_guru'] as $key => $value): ?>
								<option value="<?php echo $value['id_guru_mapel'] ?>"><?php echo $value['kode'].' ('.$value['nama'].')' ?></option>
								<?php endforeach ?>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label class="col-lg-4 control-label">Hari</label>
						<div class="col-lg-8">
							<input type="hidden" class="form-control idhari_modal" name="idhari_fk">
							<input type="text" disabled="" class="form-control hari_modal" >
						</div>
					</div>

					<div class="form-group">
						<label class="col-lg-4 control-label">Jam Ke</label>
						<div class="col-lg-3">
							<input class="form-control idjam_modal" type="hidden" name="idjampelajaran_fk" >
							<input class="form-control jam_modal" name="" disabled="">
						</div>
						
					</div>
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
				<button type="submit" class="btn btn-primary">Save changes</button>
			</div>
		</div>
	</div>
	</form>
</div>
<script type="text/javascript">
	$('.select').select2();
</script>