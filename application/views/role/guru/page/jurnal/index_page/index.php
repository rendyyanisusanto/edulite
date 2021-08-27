<script src="<?php echo base_url('include/template/limitless/')?>/global_assets/js/plugins/forms/selects/select2.min.js"></script>

<div class="row">
	<div class="col-md-6">
		<div class="panel panel-body">
			<table class="table table-xxs table-framed table-bordered">
				<tr>
					<td class="bg-primary">Nama</td>
					<td class="bg-info"><?= $data_get['guru']['nama'] ?></td>
				</tr>
				<tr>
					<td class="bg-primary">Mapel</td>
					<td class="bg-info"><?= $data_get['mapel_hari_ini']['mata_pelajaran'] ?></td>
				</tr>
				<tr>
					<td class="bg-primary">Kelas</td>
					<td class="bg-info"><?= $data_get['mapel_hari_ini']['kelas'] ?></td>
				</tr>
				<tr>
					<td class="bg-primary">Jam Ke-</td>
					<td class="bg-info"><?= $data_get['mapel_hari_ini']['nama'] ?> (<?= $data_get['mapel_hari_ini']['jam_mulai'] ?> - <?= $data_get['mapel_hari_ini']['jam_selesai'] ?>)</td>

				</tr>
			</table>
			<input type="hidden" class="idmapel_set" value="<?php echo $data_get['mapel_hari_ini']['id_jadwal_pelajaran'] ?>" name="idmapel">
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">
			<div class="tabbable nav-tabs-vertical nav-tabs-left">
				<ul class="nav nav-tabs nav-tabs-highlight">
					<li class="active"><a href="#left-tab1" class="tb" data-set="absen" data-toggle="tab"><i class="icon-user position-left"></i> Absen Siswa</a></li>
					<li><a href="#left-tab2" class="tb" data-set="jurnal_guru_set" data-toggle="tab"><i class="icon-book position-left"></i> Jurnal Guru</a></li>
					<li><a href="#left-tab2" class="tb" data-set="catatan" data-toggle="tab"><i class="icon-mention position-left"></i> Catatan Siswa</a></li>

					
				</ul>
				<div class="tab-content">
					<div class="tab-pane active has-padding" id="left-tab1">
						<div class="content-div"></div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</div>