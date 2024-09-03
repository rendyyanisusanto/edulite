<div class="row">
<?php foreach ($data_get['tugas'] as $key => $value): ?>
	
		<div class="col-xs-12">
			<div class="panel ">
				<div class="panel-body">
					<table border="0" style="width: 100%;">
						<tr>
							<td style="padding-left: 3%;" width="30%">Tanggal</td>
							<td width="1%">:</td>
							<td style="padding-left: 3%;"><?php echo date('d-m-Y', strtotime($value['tanggal'])) ?></td>
						</tr>
						<tr>
							<td style="padding-left: 3%;" width="30%">Judul</td>
							<td width="1%">:</td>
							<td style="padding-left: 3%;" ><?php echo $value['judul']; ?></td>
						</tr>
						<tr>
							<td style="padding-left: 3%;" width="30%">Deskripsi</td>
							<td width="1%">:</td>
							<td style="padding-left: 3%;" ><?php echo $value['deskripsi']; ?></td>
						</tr>
						
					</table>
				</div>
				<div class="panel-footer">
					<div class="col-md-12"><a href="Tugas/pengumpulan/<?php echo $value['id_tugas'] ?>"  class="btn btn-primary app-item btn-block btn-sm btn-labeled legitRipple"><b><i class="icon-eye"></i></b> Lihat Pengumpulan</a></div>
				</div>
			</div>
		</div>
	
<?php endforeach ?>
</div>