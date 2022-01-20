<div id="modal_animation" class="modal" tabindex="-1">
	<div class="modal-dialog">
		<form class="form-horizontal" action="erapor/simpan_data" id="app-submit" method="POST">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">Upload File</h5>
				</div>
				<div class="modal-body">

					<input type="hidden" class="idsiswa" name="id_siswa">
					<label>Status Kenaikan</label>
					<br>
					<select name="status" class="form-control">
						<option value="1">Naik Kelas</option>
						<option value="0">Tidak Naik Kelas</option>
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
		<form class="form-horizontal" action="erapor/ubah_data" id="app-submit-ubah" method="POST">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">Upload File</h5>
				</div>
				<div class="modal-body">

					<input type="hidden" class="iderapor" name="id_file_rapor_online">
					<label>Status Naik</label>
					<br>
					<select name="status" class="form-control status_lulus">
						<option value="1">Naik</option>
						<option value="0">Tidak Naik</option>
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