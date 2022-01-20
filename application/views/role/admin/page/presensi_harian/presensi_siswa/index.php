<div class="row">
	<div class="col-md-6">
		<div class="panel panel-body panel-head">
			<form action="Presensi_harian/proses_presensi_harian_index" id="app-proses" method="POST">
				<label>Tanggal</label>
				<input type="date" class="form-control tanggal" value="<?= date('Y-m-d') ?>" name="tanggal">
				<button style="margin-top: 20px;" type="submit" required class="btn btn-success"><i class="icon-spinner2"></i> Proses</button>
			</form>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<div class="proses-absen"></div>
	</div>
</div>

<input type="hidden" class="idmapel_form" name="idmapel" value="">
<div id="modal_absen" class="modal" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h5 class="modal-title">Presensi</h5>
			</div>
			<div class="modal-body">
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>