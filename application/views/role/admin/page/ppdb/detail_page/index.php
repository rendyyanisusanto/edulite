<style type="text/css">
	.tbl {
		font-size: 18px;
	}
</style>
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">
			

							<center><b style="font-size: 20px;"><u>KETERANGAN TENTANG PENDAFTAR</u></b></center>
						<div class="col-md-9">

						<br>
					<table class="table table-xxs table-borderless tbl" width="100%">
						
						<tr>
							<td width="43%"><b>1. Kode Pendaftaran</b></td>
							<td width="2%">:</td>
							<td width="55%"><?php echo strtoupper($data_get['ppdb']['kode_pendaftaran']) ?></td>
						</tr>
						<tr>
							<td width="43%"><b>1. Nama ppdb(Lengkap)</b></td>
							<td width="2%">:</td>
							<td width="55%"><?php echo strtoupper($data_get['ppdb']['nama']) ?></td>
						</tr>
						<tr>
							<td><b>2. NISN</b></td>
							<td>:</td>
							<td><?php echo (!empty($data_get['ppdb']['nisn'])) ? $data_get['ppdb']['nisn'] : '-'; ?></td>
						</tr>
						<tr>
							<td><b>2. NIK</b></td>
							<td>:</td>
							<td><?php echo (!empty($data_get['ppdb']['nik_ppdb'])) ? $data_get['ppdb']['nik_ppdb'] : '-'; ?></td>
						</tr>
						<tr>
							<td><b>3. Tanggal Lahir</b></td>
							<td>:</td>
							<td><?php echo (!empty($data_get['ppdb']['tanggal_lahir'])) ? $data_get['ppdb']['tanggal_lahir'] : '-'; ?></td>
						</tr>
						<tr>
							<td><b>4. Alamat</b></td>
							<td>:</td>
							<td><?php echo (!empty($data_get['ppdb']['alamat'])) ? $data_get['ppdb']['alamat'] : '-'; ?></td>
						</tr>
						<tr>
							<td><b>5. Email</b></td>
							<td>:</td>
							<td><?php echo (!empty($data_get['ppdb']['email'])) ? $data_get['ppdb']['email'] : '-'; ?></td>
						</tr>
						<tr>
							<td><b>6. No Hp</b></td>
							<td>:</td>
							<td><?php echo (!empty($data_get['ppdb']['no_hp'])) ? $data_get['ppdb']['no_hp'] : '-'; ?></td>
						</tr>
						<tr>
							<td><b>7. Tempat Lahir</b></td>
							<td>:</td>
							<td><?php echo (!empty($data_get['ppdb']['tempat_lahir'])) ? $data_get['ppdb']['tempat_lahir'] : '-'; ?></td>
						</tr>
						<tr>
							<td><b>8. Kode Pos</b></td>
							<td>:</td>
							<td><?php echo (!empty($data_get['ppdb']['kode_pos'])) ? $data_get['ppdb']['kode_pos'] : '-'; ?></td>
						</tr>
						<tr>
							<td><b>9. Tinggi Badan</b></td>
							<td>:</td>
							<td><?php echo (!empty($data_get['ppdb']['tinggi_badan'])) ? $data_get['ppdb']['tinggi_badan'] : '-'; ?></td>
						</tr>
						<tr>
							<td><b>10. Berat Badan</b></td>
							<td>:</td>
							<td><?php echo (!empty($data_get['ppdb']['berat_badan'])) ? $data_get['ppdb']['berat_badan'] : '-'; ?></td>
						</tr>
						<tr>
							<td><b>11. Jenis Kelamin</b></td>
							<td>:</td>
							<td><?php echo (!empty($data_get['ppdb']['jenis_kelamin'])) ? $data_get['ppdb']['jenis_kelamin'] : '-'; ?></td>
						</tr>
						
						<!-- data ayah -->
						<tr>
							<td width="40%" colspan="3"><b>17. Data Ayah</b></td>
						</tr>
						<tr>
							<td> - NIK</td>
							<td>:</td>
							<td><?php echo strtoupper($data_get['ppdb']['nik_ayah']) ?></td>
						</tr>
						<tr>
							<td> - Nama</td>
							<td>:</td>
							<td><?php echo strtoupper($data_get['ppdb']['nama_ayah']) ?></td>
						</tr>
						<tr>
							<td> - Tahun Lahir</td>
							<td>:</td>
							<td><?php echo (!empty($data_get['ppdb']['tahun_lahir_ayah'])) ? $data_get['ppdb']['tahun_lahir_ayah'] : '-'; ?></td>
						</tr>
						<tr>
							<td> - No. HP</td>
							<td>:</td>
							<td><?php echo (!empty($data_get['ppdb']['no_hp_ayah'])) ? $data_get['ppdb']['no_hp_ayah'] : '-'; ?></td>
						</tr>
						<tr>
							<td> - Pekerjaan</td>
							<td>:</td>
							<td><?php echo (!empty($data_get['ppdb']['pekerjaan_ayah'])) ? strtoupper($data_get['ppdb']['pekerjaan_ayah']) : '-'; ?></td>
						</tr>
						<tr>
							<td> - Penghasilan</td>
							<td>:</td>
							<td><?php echo (!empty($data_get['ppdb']['penghasilan_ayah'])) ? $data_get['ppdb']['penghasilan_ayah'] : '-'; ?></td>
						</tr>
						<tr>
							<td> - Pendidikan</td>
							<td>:</td>
							<td><?php echo (!empty($data_get['ppdb']['pendidikan_terakhir_ayah'])) ? $data_get['ppdb']['pendidikan_terakhir_ayah'] : '-'; ?></td>
						</tr>
						<!-- Data  Ibu-->
						<tr>
							<td width="40%" colspan="3"><b>18. Data Ibu</b></td>
						</tr>
						<tr>
							<td> - NIK</td>
							<td>:</td>
							<td><?php echo $data_get['ppdb']['nik_ibu'] ?></td>
						</tr>
						<tr>
							<td> - Nama</td>
							<td>:</td>
							<td><?php echo strtoupper($data_get['ppdb']['nama_ibu']) ?></td>
						</tr>
						<tr>
							<td> - Tahun Lahir</td>
							<td>:</td>
							<td><?php echo (!empty($data_get['ppdb']['tahun_lahir_ibu'])) ? $data_get['ppdb']['tahun_lahir_ibu'] : '-'; ?></td>
						</tr>
						<tr>
							<td> - No. HP</td>
							<td>:</td>
							<td><?php echo (!empty($data_get['ppdb']['no_hp_ibu'])) ? $data_get['ppdb']['no_hp_ibu'] : '-'; ?></td>
						</tr>
						<tr>
							<td> - Pekerjaan</td>
							<td>:</td>
							<td><?php echo (!empty($data_get['ppdb']['pekerjaan_ibu'])) ? strtoupper($data_get['ppdb']['pekerjaan_ibu']) : '-'; ?></td>
						</tr>
						<tr>
							<td> - Penghasilan</td>
							<td>:</td>
							<td><?php echo (!empty($data_get['ppdb']['penghasilan_ibu'])) ? $data_get['ppdb']['penghasilan_ibu'] : '-'; ?></td>
						</tr>
						<tr>
							<td> - Pendidikan </td>
							<td>:</td>
							<td><?php echo (!empty($data_get['ppdb']['pendidikan_terakhir_ibu'])) ? $data_get['ppdb']['pendidikan_terakhir_ibu'] : '-'; ?></td>
						</tr>
					</table>
						</div>
						
						<div class="col-md-3">
							<button class="btn btn-success " type="button" id="btn-edit" data-id="<?php echo $data_get['ppdb']['id_ppdb'] ?>"><i class="icon-pencil"></i> Verifikasi Data</button>
							<a href="<?php echo base_url('admin/ppdb/cetak_page/'.$data_get['ppdb']['id_ppdb']) ?>" target="__blank" class="btn btn-info"><i class="icon-printer"></i> Print</a>
						</div>
				
		</div>
	</div>
</div>
