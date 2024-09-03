<div class="row">
	<div class="col-xs-12">
		<center><h4>Mapel Anda Hari Ini</h4></center>
	</div>
</div>
<div class="row" style="margin-top: 5%;">
	<div class="col-xs-12">
		<a href="dashboard/get_data" class="btn app-item bg-warning-400 btn-labeled legitRipple"><b><i class="icon-home"></i></b> Home (<i>Home</i>)</a>
		<hr>
	</div>
</div>
<div class="row">
	<?php if (count($data_get['mapel_hari_ini']) == 0){ ?>
		<center><b>Tidak ada mata pelajaran yang anda ampu hari ini</b></center>
	<?php }else{ ?>
<?php foreach ($data_get['mapel_hari_ini'] as $key => $value): ?>
	
		<div class="col-xs-12">
			<div class="panel panel-body">

				<table style="width: 100%;">
					<tr>
						<td style="padding-left: 3%;" width="30%">Mapel</td>
						<td width="1%">:</td>
						<td style="padding-left: 3%;"><a href="Jurnal_guru/jurnal/<?= $value['mapel']['id_jadwal_pelajaran'] ?>" class="app-item"><?= '<b>'.$value['mapel']['mata_pelajaran'].'('.$value['mapel']['kode_pelajaran'].')'?></a></td>
					</tr>

					<tr>
						<td style="padding-left: 3%;" width="30%">Kelas</td>
						<td width="1%">:</td>
						<td style="padding-left: 3%;"><?php echo $value['mapel']['kelas'] ?></td>
					</tr>
					<tr>
						<td style="padding-left: 3%;" width="30%">Jam Ke -</td>
						<td width="1%">:</td>
						<td style="padding-left: 3%;"><?php echo $value['mapel']['nama'] ?></td>
					</tr>
					<tr>
						<td style="padding-left: 3%;" width="30%">Presensi</td>
						<td width="1%">:</td>					
						<td style="padding-left: 3%;" ><b class="<?php echo ($value['absen']>0) ? 'text-success icon-checkmark2' : 'text-danger icon-close2'; ?>"></b> </td>
					</tr>
					<tr>
						<td style="padding-left: 3%;" width="30%">Jurnal</td>
						<td width="1%">:</td>					
						<td style="padding-left: 3%;" ><b class="<?php echo ($value['jurnal_guru']>0) ? 'text-success icon-checkmark2' : 'text-danger icon-close2'; ?>"></b></td>
					</tr>
					<tr>
						<td style="padding-left: 3%;" width="30%">Catatan</td>
						<td width="1%">:</td>					
						<td style="padding-left: 3%;" ><b class="<?php echo ($value['catatan_siswa']>0) ? 'text-success icon-checkmark2' : 'text-danger icon-close2'; ?>"></b></td>
					</tr>
				</table>
				<hr>
				<table style="width: 100%;">
					
					<tr>
						<td width="100%">
							<a href="Jurnal_guru/jurnal/<?= $value['mapel']['id_jadwal_pelajaran'] ?>" class="app-item btn btn-block btn-sm btn-primary btn-labeled legitRipple"><b><i class="icon-spinner2"></i></b> Proses</a>
						</td>
					</tr>
				</table>
			</div>
		</div>
	
<?php endforeach ?>
	<?php } ?>
</div>

