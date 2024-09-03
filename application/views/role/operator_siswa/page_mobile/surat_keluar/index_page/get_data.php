<div class="row">
<?php foreach ($data_get['surat_keluar'] as $key => $value): ?>
	
		<div class="col-xs-12">
			<div class="panel panel-body">

				<table style="width: 100%;">
					<tr>
						<td style="padding-left: 3%;" width="30%">Kode</td>
						<td width="1%">:</td>
						<td style="padding-left: 3%;"><?php echo $value['surat_keluar']['no_surat'] ?></td>
					</tr>
					<tr>
						<td style="padding-left: 3%;" width="30%">Tanggal</td>
						<td width="1%">:</td>
						<td style="padding-left: 3%;" ><?php echo date('d-m-Y', strtotime($value['surat_keluar']['tanggal_surat'])) ?></td>
					</tr>
					<tr>
						<td style="padding-left: 3%;" width="30%">Tujuan</td>
						<td width="1%">:</td>					
						<td style="padding-left: 3%;" ><?php echo $value['surat_keluar']['tujuan'] ?></td>
					</tr>
					<tr>
						<td style="padding-left: 3%;" width="30%">Perihal</td>
						<td width="1%">:</td>
						<td style="padding-left: 3%;" ><?php echo $value['surat_keluar']['perihal'] ?></td>
					</tr>
				</table>
				<hr>
				<table style="width: 100%;">
					
					<tr>
						<td width="100%">
							<a href="<?php echo base_url('include/media/arsip_surat_keluar/'.$value['surat_keluar']['file_arsip']) ?>" target="__blank" style="background: yellow;color:black;" class="btn btn-block btn-sm btn-labeled legitRipple"><b><i class="icon-eye"></i></b> Lihat Dokumen</a>
						</td>
					</tr>
				</table>
			</div>
		</div>
	
<?php endforeach ?>
</div>