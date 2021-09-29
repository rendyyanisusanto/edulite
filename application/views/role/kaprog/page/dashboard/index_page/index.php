
	<script src="<?php echo base_url('include/template/limitless/') ?>global_assets/js/plugins/visualization/echarts/echarts.min.js"></script>
<div class="row">
					<div class="col-sm-6 col-md-4">
						<div class="panel panel-body bg-blue-400">
							<div class="media no-margin">
								<div class="media-body">
									<h3 class="no-margin"><?php echo $data_get['total_siswa'] ?></h3>
									<span class="text-uppercase text-size-mini">Total Siswa SMK</span>
								</div>

								<div class="media-right media-middle">
									<i class="icon-users icon-3x opacity-75"></i>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-md-4">
						<div class="panel panel-body bg-danger-400">
							<div class="media no-margin">
								<div class="media-body">
									<h3 class="no-margin">54,390</h3>
									<span class="text-uppercase text-size-mini">total comments</span>
								</div>

								<div class="media-right media-middle">
									<i class="icon-bubbles4 icon-3x opacity-75"></i>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-md-4">
						<div class="panel panel-body bg-warning-400">
							<div class="media no-margin">
								<div class="media-body">
									<h3 class="no-margin">54,390</h3>
									<span class="text-uppercase text-size-mini">total comments</span>
								</div>

								<div class="media-right media-middle">
									<i class="icon-bubbles4 icon-3x opacity-75"></i>
								</div>
							</div>
						</div>
					</div>
</div>
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-flat">
					<div class="panel-heading">
						<h5 class="panel-title">Show values</h5>
						<div class="heading-elements">
							<ul class="icons-list">
		                		<li><a data-action="collapse"></a></li>
		                		<li><a data-action="reload"></a></li>
		                		<li><a data-action="close"></a></li>
		                	</ul>
	                	</div>
					</div>

					<div class="panel-body">
						<div class="chart-container">
							<div class="chart has-fixed-height" id="line_values"></div>
						</div>
					</div>
				</div>
	</div>
</div>
<div class="row">
	<?php foreach ($data_get['detail_kaprog'] as $key => $value): ?>
		
	
		<div class="col-md-6">
			<div class="panel panel-body">
				<b><?php echo $value['program_keahlian']['jurusan'] ?></b> :

				<br>
				<table class="table table-framed table-bordered table-xxs">
					<tr>
						<td>Jumlah Siswa</td>
						<td><?php echo $value['jumlah_siswa'] ?></td>
					</tr>
					<tr>
						<td>Jumlah Kelas</td>
						<td><?php echo $value['jumlah_kelas'] ?></td>
					</tr>
					<?php foreach ($value['jumlah_siswa_tingkat'] as $key_tingkat => $value_tingkat): ?>
						<tr>
							<td>Jumlah Siswa <?php echo $value_tingkat['nama_tingkat'] ?></td>
							<td><?php echo $value_tingkat['jumlah'] ?></td>
						</tr>
					<?php endforeach ?>
				</table> 
			</div>
		</div>

	<?php endforeach ?>
</div>