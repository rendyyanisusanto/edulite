<div id="modal_animation" class="modal" tabindex="-1">
	<div class="modal-dialog">
		<form class="form-horizontal" action="Oas/simpan_data" id="app-submit" method="POST">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">Upload File</h5>
				</div>
				<div class="modal-body">

					<input type="hidden" class="idsiswa" name="id_siswa">
					<label>Status Kelulusan</label>
					<br>
					<select name="status" class="form-control">
						<option value="1">Lulus</option>
						<option value="0">Tidak Lulus</option>
					</select>
					<br>
					<label>File</label>
					<br>
					<input type="file" name="pdf_file" class="form-control">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</form>
	</div>
</div>

<div id="modal_ubah_status" class="modal" tabindex="-1">
	<div class="modal-dialog">
		<form class="form-horizontal" action="Oas/ubah_data" id="app-submit-ubah" method="POST">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">Upload File</h5>
				</div>
				<div class="modal-body">

					<input type="hidden" class="idoas" name="id_file_oas">
					<label>Status Kelulusan</label>
					<br>
					<select name="status" class="form-control status_lulus">
						<option value="1">Lulus</option>
						<option value="0">Tidak Lulus</option>
					</select>
					<br>
					<label>Status Pembayaran</label>
					<select name="is_active" class="form-control is_active">
						<option value="1">Sudah Bayar</option>
						<option value="0">Belum Bayar</option>
					</select>
					<br>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</form>
	</div>
</div>