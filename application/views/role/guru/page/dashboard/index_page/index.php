<div class="row">
	<div class="alert alert-success">
		Hallo selamat datang <b><?php echo $data_get['guru']['nama'] ?></b>, di website SMK IT Asy-syadzili
	</div>
</div>
<div class="row">
	<div class="col-md-4">
		<div class="content-group">
			<div class="panel-body bg-blue border-radius-top text-center" style="background-image: url(http://demo.interface.club/limitless/assets/images/bg.png); background-size: contain;">
				<div class="content-group-sm">
					<h5 class="text-semibold no-margin-bottom">
					<?php echo $data_get['guru']['nama'] ?>
					</h5>
					<span class="display-block"><?php echo $data_get['guru']['jabatan'] ?></span>
				</div>
				<a href="#" class="display-inline-block content-group-sm">
					<img src="<?php echo base_url('include/media/blog/teacher/'.$data_get['guru']['foto'])?>" class="img-circle img-responsive" alt="" style="width: 120px; height: 120px;">
				</a>
				<ul class="list-inline no-margin-bottom">
					<li><a href="#" class="btn bg-blue-700 btn-rounded btn-icon"><i class="icon-phone"></i></a></li>
					<li><a href="#" class="btn bg-blue-700 btn-rounded btn-icon"><i class="icon-bubbles4"></i></a></li>
					<li><a href="#" class="btn bg-blue-700 btn-rounded btn-icon"><i class="icon-envelop4"></i></a></li>
				</ul>
			</div>
			<div class="panel panel-body no-border-top no-border-radius-top">
				<div class="form-group no-margin-bottom">
					<label class="text-semibold">NIP:</label>
					<span class="pull-right-sm"><?php echo $data_get['guru']['nip'] ?></span>
				</div>
				<div class="form-group  no-margin-bottom">
					<label class="text-semibold">Nama Lengkap:</label>
					<span class="pull-right-sm"><?php echo $data_get['guru']['nama'] ?></span>
				</div>
				<div class="form-group no-margin-bottom">
					<label class="text-semibold">No. Hp:</label>
					<span class="pull-right-sm"><?php echo $data_get['guru']['no_hp'] ?></span>
				</div>
				<div class="form-group no-margin-bottom">
					<label class="text-semibold">Corporate Email:</label>
					<span class="pull-right-sm"><a href="#"><?php echo $data_get['guru']['email'] ?></a></span>
				</div>
				
			</div>
		</div>
	</div>
	<div class="col-md-6">
		<div class="col-md-12">
			<div class="panel panel-body">
				<?php echo count($data_get['walas']) ?>
			</div>
		</div>
		<div class="col-md-12">
			<div class="panel panel-body">
			<center><b><u>Mapel yang anda ampu</u></b></center>
			<br>
			<table style ="border: 1px solid black;" class="table table-bordered">
				<thead>
					<tr>
						<th class="bg-warning">Kelas</th>
						<th class="bg-warning">Mata Pelajaran</th>
					</tr>
				</thead>
				<tbody>
					<?php foreach ($data_get['mapel'] as $key => $value): ?>
						<tr>
							<td><?php echo $value['kelas'] ?></td>
							<td><?php echo $value['mata_pelajaran'] ?></td>
						</tr>
					<?php endforeach ?>
				</tbody>
			</table>
			
		</div>
		</div>
		
	</div>
</div>