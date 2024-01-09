<div class="row">
	<div class="col-md-3">
		<div class="panel panel-body">
			<button style="text-align:left;" <?php echo ($data_get['sekolah'] > 0) ? "disabled" : "" ; ?> onclick="get_event_sekolah();" data class="btn btn-<?php echo ($data_get['sekolah'] > 0) ? "success" : "default" ; ?> btn-block">Sekolah</button>


			<?php foreach ($data_get['guru'] as $key => $value): ?>
				<button style="text-align:left;" <?php echo ($value['c_guru'] > 0) ? "disabled" : "" ; ?> onclick="get_event(<?php echo $value['id_guru'] ?>);" data class="btn btn-<?php echo ($value['c_guru'] > 0) ? "success" : "default" ; ?> btn-block"><?php echo $value['nama'] ?></button>
			<?php endforeach ?>
		</div>
	</div>
	<div class="col-md-9">
		<div class="content-ev">
			<div class="panel panel-body">
				<center>
					<h4><b>Aspirasi Siswa</b></h4>
				</center>
				<br>
				<p>Sistem Informasi Aspirasi Siswa (SIAS) adalah platform digital yang dirancang khusus untuk memfasilitasi siswa dalam menyampaikan pendapat, aspirasi, dan masukan terkait berbagai aspek kehidupan di lingkungan sekolah atau institusi pendidikan. Tujuan utama dari SIAS adalah menciptakan saluran komunikasi yang efektif antara siswa dan pihak sekolah, memungkinkan mereka untuk berpartisipasi aktif dalam pengambilan keputusan dan meningkatkan kualitas lingkungan belajar.</p>

				<div class="alert alert-info">
					<b>INFO : </b>
					<p>Masing-masing akun hanya bisa mengisi kolom aspirasi terhadap guru sebanyak 1x, aturan yang harus dijalankan adalah siswa boleh mengkritik dan memberikan saran terhadap guru yang bersangkutan tetapi tetap menjunjung asas kesopanan. dan perlu diingat <b>KRITIK BUKAN HINAAN</b></p>
					<b>Tata Cara Penggunaan : </b>
					<ol>
						<li>Pilih guru di panel sebelah kiri</li>
						<li>Pilih nilai yang sesuai dengan guru ada 3 ketentuan yaitu TP (Tidak Pernah), KD (Kadang-kadang), SL (Selalu)</li>
						<li>Pada kolom paling bawah tuliskan kritik dan saran terhadap guru</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
</div>
