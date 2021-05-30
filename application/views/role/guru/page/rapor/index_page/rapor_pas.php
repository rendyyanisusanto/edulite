<style type="text/css">
	table, th, td {
	  border: 1px solid black;
	  border-collapse: collapse;
	}
</style>

Nama Peserta Didik : <?php echo $data_get['siswa']['nama'] ?><br> 
NISN/NIS : <?php echo $data_get['siswa']['nis'] ?><br>
Kelas : <?php echo $data_get['kelas']['kelas'] ?><br>
Semester : <?php echo $data_get['tahun_ajaran']['tahun_ajaran'].' '. $data_get['tahun_ajaran']['semester'] ?><br><br>
<b>A. NILAI AKADEMIK</b>
<table width="100%" >
	<tr style="text-align: center;">

		<td>No</td>
		<td>Nama</td>
		<td>Pengetahuan</td>
		<td>Keterampilan</td>
		<td>Nilai Akhir</td>
		<td>Predikat</td>
	</tr>
	<?php $no = 0; ?>
	<?php foreach ($data_get['rapor'] as $key => $value): ?>
		
		<tr>
			<td colspan="6"><b><?php echo $value['jenis_mata_pelajaran']['jenis_mata_pelajaran'] ?></b></td>
		</tr>
		<?php foreach ($value['rapor_per_mapel'] as $key => $value_mapel): ?>
			<tr >
				<td><?php echo ++$no ?></td>
				<td style="padding: 5px;"><?php echo $value_mapel['mapel']['mata_pelajaran'] ?></td>
				<td><?php echo number_format($value_mapel['np'],2,'.','') ?></td>
				<td><?php echo number_format($value_mapel['nk'],2,'.','') ?></td>
				<td><?php echo number_format($value_mapel['na'],2,'.','') ?></td>
				<td><?php echo $value_mapel['predikat'] ?></td>
			</tr>
		<?php endforeach ?>
	<?php endforeach ?>
</table>

<!-- <?php echo $value_mapel['pts']['nilai'] ?> <?php echo $value_mapel['pas']['nilai'] ?> <?php echo $value_mapel['nt']['rata'] ?> <?php echo $value_mapel['nuh']['rata'] ?> <?php echo number_format($value_mapel['nh'],2,'.','') ?>  -->