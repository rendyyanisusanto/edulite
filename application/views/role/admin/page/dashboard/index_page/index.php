<script src="<?php echo base_url('include/template/limitless/')?>global_assets/js/plugins/visualization/echarts/echarts.min.js"></script>
<div class="row">
	<div class="col-md-12">
		<div class="stats">
			<div class="col-sm-6 col-md-3 ">
			<div class="panel panel-body bg-blue-400 has-bg-image load-panel">
				<div class="media no-margin">
					<div class="media-body">
						<h3 class="no-margin text-semibold pendapatan">0</h3>
						<span class="text-uppercase text-size-mini text-muted">Pendapatan Hari Ini</span>
					</div>
					<div class="media-right media-middle">
						<i class="icon-coin-dollar icon-3x text-white-400"></i>
					</div>
				</div>
			</div>
		</div>

		<div class="col-sm-6 col-md-3 ">
			<div class="panel panel-body bg-blue-400 has-bg-image load-panel">
				<div class="media no-margin">
					<div class="media-body">
						<h3 class="no-margin text-semibold">0</h3>
						<span class="text-uppercase text-size-mini text-muted">Total Pendapatan</span>
					</div>
					<div class="media-right media-middle">
						<i class="icon-wallet icon-3x text-white-400"></i>
					</div>
				</div>
			</div>
		</div>

		<div class="col-sm-6 col-md-3 ">
			<div class="panel panel-body bg-danger-400 has-bg-image load-panel">
				<div class="media no-margin">
					<div class="media-body">
						<h3 class="no-margin text-semibold">0</h3>
						<span class="text-uppercase text-size-mini text-muted">Rekam Medis Hari Ini</span>
					</div>
					<div class="media-right media-middle">
						<i class="icon-aid-kit icon-3x text-white-400"></i>
					</div>
				</div>
			</div>
		</div>

		<div class="col-sm-6 col-md-3 ">
			<div class="panel panel-body bg-danger-400 has-bg-image load-panel">
				<div class="media no-margin">
					<div class="media-body">
						<h3 class="no-margin text-semibold">0</h3>
						<span class="text-uppercase text-size-mini text-muted">Total Rekam Medis</span>
					</div>
					<div class="media-right media-middle">
						<i class="icon-pulse2 icon-3x text-white-400"></i>
					</div>
				</div>
			</div>
		</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-stats-pasien">
			<div class="panel-heading">
				<h5 class="panel-title"><b>Grafik Rekam Medis</b></h5>
				<div class="heading-elements">
					<button class="btn-setting-pasien" type="button"><i class="icon-link"></i> Filter</button>
		       	</div>
			</div>
			<div class="panel-body">
				
				<div class="chart-container">
					<div class="chart has-fixed-height" id="line_pasien"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-stats-keuangan">
			<div class="panel-heading">
				<h5 class="panel-title"><b>Grafik Pendapatan dan Beban</b></h5>
				<div class="heading-elements">
					<button class="btn-setting-keuangan" type="button"><i class="icon-link"></i> Filter</button>
		       	</div>
			</div>
			<div class="panel-body">
				
				<div class="chart-container">
					<div class="chart has-fixed-height" id="line_keuangan"></div>
				</div>
			</div>
		</div>
	</div>
</div>


<div id="modal-pasien" class="modal" tabindex="-1">
	<div class="modal-dialog modal-sm modal-body-pasien">
		<div class="modal-content">
			<form class="form-horizontal" action="dashboard/line_rekam_medis" id="app-submit-pasien" method="POST">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h5 class="modal-title"><b>Filter</b></h5>
			</div>
			<div class="modal-body ">
				<label>Tipe</label>
				<select class="form-control tipe" name="tipe">
					<option>-- Pilih --</option>
					<option data-opt="" value="D" data-dtvalue="Y-m-d">Harian</option>
					<option data-opt="month" value="M" data-dtvalue="m">Bulanan</option>
					<option value="Y" data-opt="year" data-dtvalue="Y">Tahunan</option>
				</select>
				<br>
				<label>Mulai</label>
				<input type="date" class="form-control" name="mulai">
				<br>
				<label>Sampai</label>
				<input type="date" class="form-control" name="sampai">
				<input type="hidden" value="" name="data_tipe" class="data_tipe">
				<input type="hidden" value="" name="dtvalue" class="dtvalue">
			</div>
			<div class="modal-footer">
				<button type="button" data-id="0" class="btn btn-primary filter-setting">Filter</button>
			</div>
		</form>
		</div>
	</div>
</div>

<div id="modal-keuangan" class="modal" tabindex="-1">
	<div class="modal-dialog modal-sm modal-body-keuangan">
		<div class="modal-content">
			<form class="form-horizontal" action="dashboard/line_keuangan" id="app-submit-keuangan" method="POST">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h5 class="modal-title"><b>Filter Keuangan</b></h5>
			</div>
			<div class="modal-body ">
				<label>Tipe</label>
				<select class="form-control tipe" name="tipe">
					<option>-- Pilih --</option>
					<option data-opt="date" value="D" data-dtvalue="Y-m-d">Harian</option>
					<option data-opt="month" value="M" data-dtvalue="m">Bulanan</option>
					<option value="Y" data-opt="year" data-dtvalue="Y">Tahunan</option>
				</select>
				<br>
				<label>Mulai</label>
				<input type="date" class="form-control" name="mulai">
				<br>
				<label>Sampai</label>
				<input type="date" class="form-control" name="sampai">
				<input type="hidden" value="" name="data_tipe" class="data_tipe">
				<input type="hidden" value="" name="dtvalue" class="dtvalue">
			</div>
			<div class="modal-footer">
				<button type="button" data-id="0" class="btn btn-primary filter-setting-keuangan">Filter</button>
			</div>
		</form>
		</div>
	</div>
</div>
