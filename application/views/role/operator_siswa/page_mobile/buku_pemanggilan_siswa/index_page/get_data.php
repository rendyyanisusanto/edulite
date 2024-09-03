<div class="row">
<?php foreach ($data_get['buku_pemanggilan_siswa'] as $key => $value): ?>
	
		<div class="col-xs-12">
			<div class="panel panel-body">

				<table style="width: 100%;">
					<tr>
						<td style="padding-left: 3%;" width="30%">Nama</td>
						<td width="1%">:</td>
						<td style="padding-left: 3%;"><?php echo $value['siswa']['nama'] ?></td>
					</tr>
					<tr>
						<td style="padding-left: 3%;" width="30%">Tanggal</td>
						<td width="1%">:</td>
						<td style="padding-left: 3%;" ><?php echo $value['buku_pemanggilan_siswa']['tanggal'] ?></td>
					</tr>
					<tr>
						<td style="padding-left: 3%;" width="30%">Masalah</td>
						<td width="1%">:</td>					
						<td style="padding-left: 3%;" ><?php echo $value['buku_pemanggilan_siswa']['masalah'] ?></td>
					</tr>
					<tr>
						<td style="padding-left: 3%;" width="30%">Pemecahan</td>
						<td width="1%">:</td>
						<td style="padding-left: 3%;" ><?php echo $value['buku_pemanggilan_siswa']['pemecahan'] ?></td>
					</tr>
				</table>
				<hr>
				<table style="width: 100%;">
					
					<tr>
						<td width="100%">
							<a href="<?php echo base_url('include/media/buku_pemanggilan_siswa/'.$value['buku_pemanggilan_siswa']['dokumen']) ?>" target="__blank" style="background: yellow;color:black;" class="btn btn-block btn-sm btn-labeled legitRipple"><b><i class="icon-eye"></i></b> Lihat Dokumen</a>
						</td>
					</tr>
				</table>
			</div>
		</div>
	
<?php endforeach ?>
</div>