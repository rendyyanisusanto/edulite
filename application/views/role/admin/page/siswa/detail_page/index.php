<style type="text/css">
	.tbl {
		font-size: 18px;
	}
</style>
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">
			

							<center><b style="font-size: 20px;"><u>KETERANGAN TENTANG DIRI SISWA</u></b></center>
						<div class="col-md-9">

						<br>
					<table class="table table-xxs table-borderless tbl" width="100%">
						<tr>
							<td width="43%"><b>1. Nama Siswa(Lengkap)</b></td>
							<td width="2%">:</td>
							<td width="55%"><?php echo strtoupper($data_get['siswa']['nama']) ?></td>
						</tr>
						<tr>
							<td><b>2. NIS</b></td>
							<td>:</td>
							<td><?php echo (!empty($data_get['siswa']['nis'])) ? $data_get['siswa']['nis'] : '-'; ?></td>
						</tr>
						<tr>
							<td><b>3. NISN</b></td>
							<td>:</td>
							<td><?php echo (!empty($data_get['siswa']['nisn'])) ? $data_get['siswa']['nisn'] : '-'; ?></td>
						</tr>
						<tr>
							<td><b>4. Tempat/Tanggal Lahir</b></td>
							<td>:</td>
							<td><?php echo (!empty($data_get['siswa']['tempat_lahir'])) ? strtoupper($data_get['siswa']['tempat_lahir']) : '-'; ?> / <?php echo (!empty($data_get['siswa']['tanggal_lahir'])) ? $data_get['siswa']['tanggal_lahir'] : '-'; ?></td>
						</tr>
						<tr>
							<td><b>5. Jenis Kelamin</b></td>
							<td>:</td>
							<td><?php echo (!empty($data_get['siswa']['jenis_kelamin'])) ? strtoupper($data_get['siswa']['jenis_kelamin']) : '-'; ?></td>
						</tr>
						<tr>
							<td><b>6. Agama</b></td>
							<td>:</td>
							<td><?php echo (!empty($data_get['siswa']['agama'])) ? strtoupper($data_get['siswa']['agama']) : '-'; ?></td>
						</tr>
						<tr>
							<td><b>7. Alamat</b></td>
							<td>:</td>
							<td><?php echo (!empty($data_get['siswa']['alamat'])) ? strtoupper($data_get['siswa']['alamat']) : '-'; ?></td>
						</tr>
						<tr>
							<td><b>8. Dusun</b></td>
							<td>:</td>
							<td><?php echo (!empty($data_get['siswa']['dusun'])) ? strtoupper($data_get['siswa']['dusun']) : '-'; ?></td>
						</tr>
						<tr>
							<td><b>9. Kelurahan</b></td>
							<td>:</td>
							<td><?php echo (!empty($data_get['siswa']['kelurahan'])) ? strtoupper($data_get['siswa']['kelurahan']) : '-'; ?></td>
						</tr>
						<tr>
							<td><b>10. RT/RW</b></td>
							<td>:</td>
							<td><?php echo (!empty($data_get['siswa']['rt'])) ? $data_get['siswa']['rt'] : '-'; ?> / <?php echo (!empty($data_get['siswa']['rw'])) ? $data_get['siswa']['rw'] : '-'; ?></td>
						</tr>
						<tr>
							<td><b>11. Kota/Kab</b></td>
							<td>:</td>
							<td><?php echo (!empty($data_get['city']['name'])) ? strtoupper($data_get['city']['name']) : '-'; ?></td>
						</tr>
						<tr>
							<td><b>12. Provinsi</b></td>
							<td>:</td>
							<td><?php echo (!empty($data_get['province']['name'])) ? strtoupper($data_get['province']['name']) : '-'; ?></td>
						</tr>
						<tr>
							<td><b>13. TB</b></td>
							<td>:</td>
							<td><?php echo (!empty($data_get['siswa']['tinggi_badan'])) ? strtoupper($data_get['siswa']['tinggi_badan']) : '-'; ?></td>
						</tr>
						<tr>
							<td><b>14. BB</b></td>
							<td>:</td>
							<td><?php echo (!empty($data_get['siswa']['berat_badan'])) ? $data_get['siswa']['berat_badan'] : '-'; ?></td>
						</tr>
						<tr>
							<td><b>15. Jarak ke Sekolah</b></td>
							<td>:</td>
							<td><?php echo (!empty($data_get['siswa']['jarak_ke_sekolah'])) ? $data_get['siswa']['jarak_ke_sekolah'] : '-'; ?></td>
						</tr>
						<tr>
							<td><b>16. Jumlah Saudara</b></td>
							<td>:</td>
							<td><?php echo (!empty($data_get['siswa']['jumlah_saudara'])) ? $data_get['siswa']['jumlah_saudara'] : '-'; ?></td>
						</tr>

						<!-- data ayah -->
						<tr>
							<td width="40%" colspan="3"><b>17. Data Ayah</b></td>
						</tr>
						<tr>
							<td> - Nama</td>
							<td>:</td>
							<td><?php echo strtoupper($data_get['siswa']['nama_ayah']) ?></td>
						</tr>
						<tr>
							<td> - Tempat/Tanggal Lahir</td>
							<td>:</td>
							<td><?php echo (!empty($data_get['siswa']['tempat_lahir_ayah'])) ? strtoupper($data_get['siswa']['tempat_lahir_ayah']) : '-'; ?> / <?php echo (!empty($data_get['siswa']['tanggal_lahir_ayah'])) ? $data_get['siswa']['tanggal_lahir_ayah'] : '-'; ?></td>
						</tr>
						<tr>
							<td> - Pekerjaan</td>
							<td>:</td>
							<td><?php echo (!empty($data_get['siswa']['pekerjaan_ayah'])) ? strtoupper($data_get['siswa']['pekerjaan_ayah']) : '-'; ?></td>
						</tr>
						<tr>
							<td> - Penghasilan</td>
							<td>:</td>
							<td><?php echo (!empty($data_get['siswa']['penghasilan_ayah'])) ? $data_get['siswa']['penghasilan_ayah'] : '-'; ?></td>
						</tr>

						<!-- Data  Ibu-->
						<tr>
							<td width="40%" colspan="3"><b>18. Data Ibu</b></td>
						</tr>
						<tr>
							<td> - Nama</td>
							<td>:</td>
							<td><?php echo strtoupper($data_get['siswa']['nama_ibu']) ?></td>
						</tr>
						<tr>
							<td> - Tempat/Tanggal Lahir</td>
							<td>:</td>
							<td><?php echo (!empty($data_get['siswa']['tempat_lahir_ibu'])) ? strtoupper($data_get['siswa']['tempat_lahir_ibu']) : '-'; ?> / <?php echo (!empty($data_get['siswa']['tanggal_lahir_ibu'])) ? $data_get['siswa']['tanggal_lahir_ibu'] : '-'; ?></td>
						</tr>
						<tr>
							<td> - Pekerjaan</td>
							<td>:</td>
							<td><?php echo (!empty($data_get['siswa']['pekerjaan_ibu'])) ? strtoupper($data_get['siswa']['pekerjaan_ibu']) : '-'; ?></td>
						</tr>
						<tr>
							<td> - Penghasilan</td>
							<td>:</td>
							<td><?php echo (!empty($data_get['siswa']['penghasilan_ibu'])) ? $data_get['siswa']['penghasilan_ibu'] : '-'; ?></td>
						</tr>

					</table>
						</div>
						
						<div class="col-md-3">
							<img src="<?php echo base_url(((!empty($data_get['siswa']['foto']) ? 'include/media/siswa/'.$data_get['siswa']['foto'] : 'include/media/system/no_image.jpg'))) ?>" class="img-responsive" style="width:100%;max-width: 300px;max-height: 400px" >
							<br>
							<button class="btn btn-success " type="button" id="btn-edit" data-id="<?php echo $data_get['siswa']['id_siswa'] ?>"><i class="icon-pencil"></i> Edit</button>
							<a href="<?php echo base_url('admin/siswa/cetak_page/'.$data_get['siswa']['id_siswa']) ?>" target="__blank" class="btn btn-info"><i class="icon-printer"></i> Print</a>
						</div>
				
		</div>
	</div>
</div>
