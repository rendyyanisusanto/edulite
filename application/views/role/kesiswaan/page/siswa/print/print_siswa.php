<!DOCTYPE html>
<html>
	<head>
		<title></title>
	</head>
	<body onload="print();">
		<center><h2><b>Keterangan Diri Siswa</b></h2></center>
		<br>
		<table border="0" width="100%">
			<tr>
				<td width="30%"><b>1. Nama Siswa (Lengkap)</b></td>
				<td width="5%">:</td>
				<td><?php echo (!empty($siswa['nama'])) ? strtoupper($siswa['nama']) : '-'; ?></td>
			</tr>
			<tr>
				<td><b>2. NIS</b></td>
				<td>:</td>
				<td><?php echo (!empty($siswa['nis'])) ? $siswa['nis'] : '-'; ?></td>
			</tr>
			<tr>
				<td><b>3. NISN</b></td>
				<td>:</td>
				<td><?php echo (!empty($siswa['nisn'])) ? $siswa['nisn'] : '-'; ?></td>
			</tr>
			<tr>
				<td><b>4. Tempat/Tanggal Lahir</b></td>
				<td>:</td>
				<td><?php echo (!empty($siswa['tempat_lahir'])) ? strtoupper($siswa['tempat_lahir']) : '-'; ?> / <?php echo (!empty($siswa['tanggal_lahir'])) ? $siswa['tanggal_lahir'] : '-'; ?></td>
			</tr>
			<tr>
				<td><b>5. Jenis Kelamin</b></td>
				<td>:</td>
				<td><?php echo (!empty($siswa['jenis_kelamin'])) ? strtoupper($siswa['jenis_kelamin']) : '-'; ?></td>
			</tr>
			<tr>
				<td><b>6. Agama</b></td>
				<td>:</td>
				<td><?php echo (!empty($siswa['agama'])) ? strtoupper($siswa['agama']) : '-'; ?></td>
			</tr>
			<tr>
				<td><b>7. Alamat</b></td>
				<td>:</td>
				<td><?php echo (!empty($siswa['alamat'])) ? strtoupper($siswa['alamat']) : '-'; ?></td>
			</tr>
			<tr>
				<td><b>8. Dusun</b></td>
				<td>:</td>
				<td><?php echo (!empty($siswa['dusun'])) ? strtoupper($siswa['dusun']) : '-'; ?></td>
			</tr>
			<tr>
				<td><b>9. Kelurahan</b></td>
				<td>:</td>
				<td><?php echo (!empty($siswa['kelurahan'])) ? strtoupper($siswa['kelurahan']) : '-'; ?></td>
			</tr>
			<tr>
				<td><b>10. RT/RW</b></td>
				<td>:</td>
				<td><?php echo (!empty($siswa['rt'])) ? $siswa['rt'] : '-'; ?> / <?php echo (!empty($siswa['rw'])) ? $siswa['rw'] : '-'; ?></td>
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
				<td><?php echo (!empty($siswa['tinggi_badan'])) ? strtoupper($siswa['tinggi_badan']) : '-'; ?></td>
			</tr>
			<tr>
				<td><b>14. BB</b></td>
				<td>:</td>
				<td><?php echo (!empty($siswa['berat_badan'])) ? $siswa['berat_badan'] : '-'; ?></td>
			</tr>
			<tr>
				<td><b>15. Jarak ke Sekolah</b></td>
				<td>:</td>
				<td><?php echo (!empty($siswa['jarak_ke_sekolah'])) ? $siswa['jarak_ke_sekolah'] : '-'; ?></td>
			</tr>
			<tr>
				<td><b>16. Jumlah Saudara</b></td>
				<td>:</td>
				<td><?php echo (!empty($siswa['jumlah_saudara'])) ? $siswa['jumlah_saudara'] : '-'; ?></td>
			</tr>
			<tr>
				<td colspan="3"><b>17. Data Ayah</b></td>
			</tr>
			<tr>
				<td> - Nama</td>
				<td>:</td>
				<td><?php echo strtoupper($siswa['nama_ayah']) ?></td>
			</tr>
			<tr>
				<td> - Tempat/Tanggal Lahir</td>
				<td>:</td>
				<td><?php echo (!empty($siswa['tempat_lahir_ayah'])) ? strtoupper($siswa['tempat_lahir_ayah']) : '-'; ?> / <?php echo (!empty($siswa['tanggal_lahir_ayah'])) ? $siswa['tanggal_lahir_ayah'] : '-'; ?></td>
			</tr>
			<tr>
				<td> - Pekerjaan</td>
				<td>:</td>
				<td><?php echo (!empty($siswa['pekerjaan_ayah'])) ? strtoupper($siswa['pekerjaan_ayah']) : '-'; ?></td>
			</tr>
			<tr>
				<td> - Penghasilan</td>
				<td>:</td>
				<td><?php echo (!empty($siswa['penghasilan_ayah'])) ? $siswa['penghasilan_ayah'] : '-'; ?></td>
			</tr>
			<!-- Data  Ibu-->
			<tr>
				<td  colspan="3"><b>18. Data Ibu</b></td>
			</tr>
			<tr>
				<td> - Nama</td>
				<td>:</td>
				<td><?php echo strtoupper($siswa['nama_ibu']) ?></td>
			</tr>
			<tr>
				<td> - Tempat/Tanggal Lahir</td>
				<td>:</td>
				<td><?php echo (!empty($siswa['tempat_lahir_ibu'])) ? strtoupper($siswa['tempat_lahir_ibu']) : '-'; ?> / <?php echo (!empty($siswa['tanggal_lahir_ibu'])) ? $siswa['tanggal_lahir_ibu'] : '-'; ?></td>
			</tr>
			<tr>
				<td> - Pekerjaan</td>
				<td>:</td>
				<td><?php echo (!empty($siswa['pekerjaan_ibu'])) ? strtoupper($siswa['pekerjaan_ibu']) : '-'; ?></td>
			</tr>
			<tr>
				<td> - Penghasilan</td>
				<td>:</td>
				<td><?php echo (!empty($siswa['penghasilan_ibu'])) ? $siswa['penghasilan_ibu'] : '-'; ?></td>
			</tr>
		</table>
	</body>
</html>