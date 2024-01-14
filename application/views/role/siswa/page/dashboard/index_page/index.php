
<div class="row">
	<div class="alert alert-success">
		<marquee>Hallo <b><?php echo $data_get['siswa']['nama'] ?></b>, Selamat datang di aplikasi EDULITE milik SMK IT ASY SYADZILI. Hak akses anda saat ini adalah sebagai <b>Siswa</b></marquee>
	</div>
</div>

<div class="row">
	<div class="col-md-12">
		<h4 style="font-weight:bold; text-align: center;">Event Sekolah</h4>

		<div class="row">
			<!-- <div class="col-md-3">

				<div class="thumbnail">
			      <img src="<?php echo base_url('include/media/Selamat-Hari-Guru.jpeg'); ?>" class="img img-responsive">
			      <div class="caption">
			        <h3>Aspirasi Siswa</h3>
			        <p>Sistem Informasi Aspirasi Siswa (SIAS) adalah platform digital yang dirancang khusus untuk memfasilitasi siswa dalam menyampaikan pendapat, aspirasi, dan masukan terkait berbagai aspek kehidupan di lingkungan sekolah atau institusi pendidikan.</p>
			        <button type="button" disabled="" class="btn btn-primary btn-block" >Masuk</button>
			      </div>
			    </div>
			</div> -->
			<?php if ($data_get['prakerin']>0): ?>
				
			<div class="col-md-3">
				<!-- <a href="Event/aspirasi" class="app-item">Aspirasi siswa</a> -->

				<div class="thumbnail">
			      <img src="<?php echo base_url('include/media/bgpsg.jpg'); ?>" class="img img-responsive">
			      <div class="caption">
			        <h3>Prakerin APP</h3>
			        <p>Fitur ini digunakan untuk siswa yang sedang mengikuti program praktek kerja industri. fitur ini digunakan untuk input laporan harian siswa.</p>
			        <a href="Prakerin/jurnal_harian" class="app-item btn btn-primary btn-block" >Jurnal Harian</a>
			      </div>
			    </div>
			</div>
			<?php endif ?>
			
		</div>
	</div>
</div>
