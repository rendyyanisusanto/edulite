<form class="form-horizontal" action="Presensi_guru/proses_rekap_laporan" id="app-submit" method="POST">
<div class="row">
	<div class="col-md-6">
		<div class="panel panel-body">
			<label>Pilih Rekap</label>
			<select name="rekap" class="form-control rekap" onchange="get_rekap();">
				<option value="1">Harian</option>
				<option value="3">Bulanan</option>
				<option value="4">Range Tanggal</option>
			</select>
			<div class="filter"></div>
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