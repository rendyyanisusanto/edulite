<script src="<?php echo base_url('include/template/limitless/')?>/global_assets/js/plugins/forms/selects/select2.min.js"></script>

<div class="row">
	<div class="col-md-5">
		<div class="panel panel-body">
			<form action="Nilai/proses_nilai_keterampilan" id="app-proses" method="POST">
				<table class="table table-framed table-bordered">
					<tr>
						<td class="bg-blue-800">Kelas</td>
						<td class="bg-teal"><?php echo $data_get['kelas']['kelas'] ?></td>
					</tr>
					<tr>
						<td class="bg-blue-800">Mata Pelajaran</td>
						<td class="bg-teal"><?php echo $data_get['mata_pelajaran']['mata_pelajaran'] ?></td>
					</tr>
				</table>
				<input type="hidden" value="<?php echo $data_get['tahun_ajaran']['id_tahun_ajaran'] ?>"  class= "idtahunajaran_fk" name="idtahunajaran_fk">
				<input type="hidden" value="<?php echo $data_get['kelas']['id_kelas'] ?>"  class= "idkelas_fk" name="idkelas_fk">
				<input type="hidden" value="<?php echo $data_get['mata_pelajaran']['id_mata_pelajaran'] ?>"  class= "idmatapelajaran_fk" name="idmatapelajaran_fk">
				<hr>
				<label>Pilih KD/Materi</label>
				<select data-placeholder="Pilih KD/Materi" required="" name="idkd_fk" class="select kd">
                     
                </select>
                <br>
                <label>Jenis Penilaian</label>
                <select class="form-control" name="idjenisketerampilan_fk">
                	<?php foreach ($data_get['jenis_nilai'] as $key => $value): ?>
                		<option value="<?php echo $value['id_jenis_keterampilan'] ?>"><?php echo $value['kode'].' - '.$value['jenis_keterampilan'] ?></option>
                	<?php endforeach ?>
                </select>
                <button style="margin-top: 20px;" type="submit" class="btn btn-success"><i class="icon-spinner2"></i> Proses</button>
			</form>
		</div>
	</div>
	<div class="col-md-7">
			<div class="alert alert-danger">
				PETUNJUK PENGISIAN :
				<ul>
					<li>Pastikan anda sudah mengisi KI/KD dan Materi pada mata pelajaran <?php echo $data_get['mata_pelajaran']['mata_pelajaran'] ?></li>
					<li>Pilih KD/Materi pada kotak disamping</li>
					<li>Pilih jenis Penilaian, apakah anda ingin memberikan nilai tugas atau nilai ulangan harian</li>
					<li>Klik Tombol PROSES</li>
					<li>Pilih tombol download untuk mendownload format excel</li>
					<li>Buka File yang telah anda download</li>
					<li>Isi data sesuai kotak</li>
					<li><b>JANGAN MENGUBAH TEMPAT/FORMAT YANG ADA PADA EXCEL</b></li>
					<li>Simpan file excel yang anda edit</li>
					<li>Klik <b>Choose File</b> pada browser</li>
					<li>Pilih File anda</li>
					<li>Klik Import</li>
				</ul>
			</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="proses-nilai"></div>
		</div>
	</div>
	
</div>