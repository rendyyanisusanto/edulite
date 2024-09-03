<div class="row">
<?php foreach ($data_get['ijin_siswa'] as $key => $value): ?>
	
		<div class="col-xs-12">
			<div class="panel panel-body">

				<table style="width: 100%;">
					<tr>
						<td style="padding-left: 3%;" width="30%">Nama</td>
						<td width="1%">:</td>
						<td style="padding-left: 3%;"><?php echo $value['siswa']['nama'] ?></td>
					</tr>
					<tr>
						<td style="padding-left: 3%;" width="30%">Jenis Ijin</td>
						<td width="1%">:</td>
						<td style="padding-left: 3%;" ><?php echo $value['jenis_ijin']['jenis_ijin'] ?></td>
					</tr>
					<tr>
						<td style="padding-left: 3%;" width="30%">Keterangan</td>
						<td width="1%">:</td>					
						<td style="padding-left: 3%;" ><?php echo $value['ijin_siswa']['keterangan'] ?></td>
					</tr>
				</table>
				<hr>
				<table style="width: 100%;">
					
					<tr>
						<td width="70%">
							<a href="Ijin_siswa/edit_page/<?php echo $value['ijin_siswa']['id_ijin_siswa'] ?>" class="app-item btn btn-success btn-block btn-sm btn-labeled legitRipple"><b><i class="icon-pencil3"></i></b> Edit</a>
						</td>
						<td width="30%" style="padding-left: 1%;">
							<button onclick="hapus_data(<?php echo $value['ijin_siswa']['id_ijin_siswa'] ?>);" class=" btn btn-danger btn-block btn-sm btn-labeled legitRipple"><b><i class="icon-close2"></i></b> Hapus</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
	
<?php endforeach ?>
</div>