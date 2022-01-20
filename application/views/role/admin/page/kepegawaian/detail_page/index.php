<style type="text/css">
	.tbl {
		font-size: 18px;
	}
</style>
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">
			<center><b style="font-size: 20px;"><u>BUKU INDUK KEPEGAWAIAN</u></b></center>
			<div class="col-md-9">
				<br>
				<table class="table table-xxs table-borderless tbl" width="100%">
					<tr>
						<td width="40%" colspan="3"><b>A. Keterangan Pribadi</b></td>
					</tr>
					<tr>
						<td width="43%"><b>1. Nama (Lengkap)</b></td>
						<td width="2%">:</td>
						<td width="55%"><?php echo strtoupper($data_get['guru']['nama']) ?></td>
					</tr>
					<tr>
						<td><b>2. Jenis Kelamin</b></td>
						<td>:</td>
						<td><?php echo (!empty($data_get['guru']['jenis_kelamin'])) ? $data_get['guru']['jenis_kelamin'] : '-'; ?>
						</td>
					</tr>
					<tr>
						<td><b>3. Agama</b></td>
						<td>:</td>
						<td><?php echo (!empty($data_get['guru']['agama'])) ? $data_get['guru']['agama'] : '-'; ?></td>
					</tr>
					<tr>
						<td><b>4. Tempat/Tanggal Lahir</b></td>
						<td>:</td>
						<td><?php echo (!empty($data_get['guru']['tempat_lahir'])) ? strtoupper($data_get['guru']['tempat_lahir']) : '-'; ?>
							/
							<?php echo (!empty($data_get['guru']['tanggal_lahir'])) ? $data_get['guru']['tanggal_lahir'] : '-'; ?>
						</td>
					</tr>
					<tr>
						<td><b>5. Kewarganegaraan</b></td>
						<td>:</td>
						<td><?php echo (!empty($data_get['guru']['kewarganegaraan'])) ? strtoupper($data_get['guru']['kewarganegaraan']) : '-'; ?>
						</td>
					</tr>
					<tr>
						<td><b>6. Status Pernikahan</b></td>
						<td>:</td>
						<td><?php echo (!empty($data_get['guru']['status_pernikahan'])) ? strtoupper($data_get['guru']['status_pernikahan']) : '-'; ?>
						</td>
					</tr>
					<tr>
						<td><b>7. Suami/Istri</b></td>
						<td>:</td>
						<td><?php echo (!empty($data_get['guru']['istri'])) ? strtoupper($data_get['guru']['istri']) : '-'; ?>
						</td>
					</tr>

				</table>
			</div>
			<div class="col-md-3">
				<img src="<?php echo base_url(((!empty($data_get['guru']['foto']) ? 'include/media/foto_pegawai/'.$data_get['guru']['foto'] : 'include/media/default_image/noimage.png'))) ?>"
					class="img-responsive" style="width:100%;max-width: 300px;max-height: 400px">
				<br>
				<a class="btn btn-success app-item" href="Kepegawaian/edit_page/<?php echo $data_get['guru']['id_guru'] ?>"><i class="icon-pencil"></i> Edit</a>
				<a href="<?php echo base_url('admin/guru/cetak_page/'.$data_get['guru']['id_guru']) ?>" target="__blank"
					class="btn btn-info"><i class="icon-printer"></i> Print</a>
			</div>
		</div>
	</div>
</div>