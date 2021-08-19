<div class="row">
	<div class="col-md-12">
		<center><h3><b><u>Menu Silabus</u></b></h3></center>
	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<div class="panel-silabus"></div>
	</div>
</div>

<div class="modal" id="modal_silabus">
	<div class="modal-dialog">
		<div class="modal-content">
			<form class="frm-silabus" id="app-submit" method="POST" action="silabus/save_file">
			<div class="modal-header">
				<div class="modal-title"></div>
			</div>
			<div class="modal-body">
				
					<label>File Silabus *:</label>
					<br>
					<input type="hidden" class="idmapel_fk" name="idmatapelajaran_fk">
					<input type="hidden" class="idtingkat_fk" name="idtingkat_fk">
					<input type="hidden" class="idjurusan_fk" name="idjurusan_fk">
					<input required="" type="file" class="form-control file-silabus" name="silabus">
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger btn-close" ><i class="icon-close2"></i> Tutup</button>
				<button type="submit" class="btn-success btn btn-submit">Simpan</button>
			</div>
			</form>
		</div>
	</div>
</div>