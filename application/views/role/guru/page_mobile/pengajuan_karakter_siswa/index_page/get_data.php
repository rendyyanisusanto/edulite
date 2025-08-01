<div class="row">
<?php foreach ($data_get['pengajuan_karakter_siswa'] as $key => $value): ?>
	
		<div class="col-xs-12">
			<div class="panel ">
				<div class="panel-body">
					<table border="0" style="width: 100%;">
						<tr>
							<td width="8%" rowspan="6">
								<img style="width: 50px ; height: 50px;" src="<?php echo $value['foto']?>">
							</td>
						</tr>
						<tr>
							<td style="padding-left: 3%;" width="30%">Tanggal</td>
							<td width="1%">:</td>
							<td style="padding-left: 3%;"><?php echo date('d-m-Y', strtotime($value['tanggal'])) ?></td>
						</tr>
						<tr>
							<td style="padding-left: 3%;" width="30%">Jenis</td>
							<td width="1%">:</td>
							<td style="padding-left: 3%;" ><?php echo $value['jam_masuk']; ?></td>
						</tr>
						<tr>
							<td style="padding-left: 3%;" width="30%">Keterangan</td>
							<td width="1%">:</td>
							<td style="padding-left: 3%;" ><?php echo $value['keterangan']; ?></td>
						</tr>
						
					</table>
				</div>
				<div class="panel-footer">
					<center>
						<span class="label label-<?php echo ($value['status'] == 0) ? 'danger' : 'success'; ?>"><?php echo ($value['status'] == 0) ? 'Belum Dikonfirmasi' : 'Terkonfirmasi'; ?></span>
					</center>
				</div>
			</div>
		</div>
	
<?php endforeach ?>
</div>