<form class="form-horizontal" action="Presensi_guru/proses_rekap" id="app-submit" method="POST">
<div class="row">
	<div class="col-md-6">
		<div class="panel panel-body">
			<label>Pilih Bulan</label>
			<select name="bulan" class="form-control">
				<option value="1">Januari</option>
				<option value="2">Februari</option>
				<option value="3">Maret</option>
				<option value="4">April</option>
				<option value="5">Mei</option>
				<option value="6">Juni</option>
				<option value="7">Juli</option>
				<option value="8">Agustus</option>
				<option value="9">September</option>
				<option value="10">Oktober</option>
				<option value="11">November</option>
				<option value="12">Desember</option>
			</select>

			<br>
			<button class="btn btn-success " type="submit"><i class="icon-spinner"></i> Proses</button>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<div class="panel-proses"></div>
	</div>
</div>
</form>