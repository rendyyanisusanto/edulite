<div class="row">
<?php foreach ($data_get['request_absen'] as $key => $value): ?>
	
		<div class="col-xs-12">
			<div class="panel ">
				<div class="panel-body">
					<table border="0" style="width: 100%;">
						<tr>
							<td width="8%" rowspan="6">
								<img style="width: 50px ; height: 50px;" src="<?php echo base_url('include/media/foto_request_absen/'.$value['foto']) ?>">
							</td>
						</tr>
						<tr>
							<td style="padding-left: 3%;" width="30%">Tanggal</td>
							<td width="1%">:</td>
							<td style="padding-left: 3%;"><?php echo date('d-m-Y', strtotime($value['tanggal'])) ?></td>
						</tr>
						<tr>
							<td style="padding-left: 3%;" width="30%">Request</td>
							<td width="1%">:</td>
							<td style="padding-left: 3%;" >
								<?php
									if ($value['status_request'] == "MASUK_PULANG") {
										echo "Masuk dan Pulang";
									}elseif ($value['status_request'] == "MASUK"){
										echo "Masuk";
									} else{
										echo "Pulang";
									}
								?>		
							</td>
						</tr>
						<tr>
							<td style="padding-left: 3%;" width="30%">Jam Masuk</td>
							<td width="1%">:</td>
							<td style="padding-left: 3%;" ><?php echo $value['jam_masuk']; ?></td>
						</tr>
						<tr>
							<td style="padding-left: 3%;" width="30%">Jam Pulang</td>
							<td width="1%">:</td>
							<td style="padding-left: 3%;" ><?php echo $value['jam_pulang']; ?></td>
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