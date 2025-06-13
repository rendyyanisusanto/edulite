
<div class="container-t">
    <div class="header">
        <div class="time-box">
            <span class="status">Masuk</span>
            <span class="time"><?php echo (!empty($data_get['presensi']['jam_masuk']) && $data_get['presensi']['jam_masuk'] !== '00:00:00' ) ?  $data_get['presensi']['jam_masuk'] : "Belum Absen"; ?></span>
        </div>
        <div class="icon">
            <b class=" icon-watch2"></b>
        </div>
        <div class="time-box">
            <span class="status">Pulang</span>
            <span class="time"><?php echo (!empty($data_get['presensi']['jam_keluar']) && $data_get['presensi']['jam_keluar'] !== '00:00:00' ) ?  $data_get['presensi']['jam_keluar'] : "Belum Absen"; ?></span>
        </div>


    </div>
    <center>
	    <p style='margin-top: 15px;text-align:center;color:red;font-size:10px;' id="mesJadwal"></p>
	</center>

	<!-- <div class="buttons"> -->

			<div style="display: none;" class="rowabsen buttons">
				<?php if (isset($data_get['presensi'])){ ?>
					<?php if (!empty($data_get['presensi']['jam_masuk']) && $data_get['presensi']['jam_masuk'] !== '00:00:00' ){ ?>
					<?php }else{ ?>
						<button class="btn btn-masuk btn-check" data-status="0" type="button">Absen Masuk</button>
						<button class="btn btn-pulang " disabled type="button">Absen Pulang</button>
					<?php } ?>
					<?php if (!empty($data_get['presensi']['jam_keluar']) && $data_get['presensi']['jam_keluar'] !== '00:00:00' ){ ?>
					<?php }else{ ?>
						<button class="btn btn-masuk btn-check" disabled type="button">Absen Masuk</button>
						<button class="btn btn-pulang btn-check" data-status="1" type="button">Absen Pulang</button>
					<?php } ?>
				<?php }else{ ?>
					<button class="btn btn-pulang btn-check" data-status="0" type="button">Absen Masuk</button>
					<button class="btn btn-masuk btn-check" data-status="1" type="button">Absen Pulang</button>
				<?php } ?>
			</div>

			
	<!-- </div> -->
</div>


<div class="row" style="margin-top: 15px;">
	<div class="col-xs-12">
		<center><b style="text-align: center; !important;">Fitur :</b></center>
	</div>
</div>
<div class="menu-grid">
    <div class="menu-card">
        <a href="Laporan_presensi_siswa/get_data" class="app-item">
            <i class="icon-magazine"></i>
            <span>Laporan Presensi Siswa</span>
        </a>
    </div>
    <div class="menu-card">
        <a href="Presensi_guru/rekap" class="app-item">
            <i class="icon-stack-empty"></i>
            <span>Log Absen Guru</span>
        </a>
    </div>
    <div class="menu-card">
        <a href="Penggajian/get_data" class="app-item">
            <i class="icon-coin-dollar"></i>
            <span>HR</span>
        </a>
    </div>
    <div class="menu-card">
        <a href="Request_absen/get_data" class="app-item">
            <i class="icon-file-text2"></i>
            <span>Request Absen Guru</span>
        </a>
    </div>
    <div class="menu-card">
        <a href="Laporan_presensi_siswa/laporan_per_siswa" class="app-item">
            <i class="icon-file-text3"></i>
            <span>Laporan Presensi Siswa</span>
        </a>
    </div>
    <div class="menu-card logout-card">
        <a href="Logout" class="app-item">
            <i class="icon-exit2"></i>
            <span>Logout</span>
        </a>
    </div>
</div>

	
<div class="floating-btn-container">
    <a href="Request_absen/get_data"  class="floating-btn app-item">Request Absen Guru</a>
</div>
<style>
    .menu-grid {
		display: grid;
		grid-template-columns: repeat(auto-fit, minmax(120px, 1fr));
		gap: 15px;
		margin: 10px 0;
	}

/* Menu Card */
	.menu-card {
		background: #ffffff; /* Latar belakang putih */
		border-radius: 12px;
		box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1); /* Shadow lembut */
		padding: 20px;
		text-align: center;
		transition: all 0.3s ease-in-out; /* Animasi transisi */
		color: #34495e; /* Teks berwarna abu-abu gelap */
		position: relative;
		overflow: hidden;
	}

	/* Gradasi Animasi */
	.menu-card::after {
		content: '';
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background: linear-gradient(45deg, rgba(52, 152, 219, 0.1), rgba(231, 76, 60, 0.1)); /* Gradasi lembut */
		transition: opacity 0.3s ease;
		opacity: 0;
		pointer-events: none;
	}

	/* Hover Effect - Animasi Gradasi */
	.menu-card:hover::after {
		opacity: 1; /* Menampilkan gradasi saat hover */
	}

	.menu-card:hover {
		transform: translateY(-8px); /* Efek angkat lebih besar saat hover */
		box-shadow: 0 18px 40px rgba(0, 0, 0, 0.2); /* Shadow lebih dramatis */
	}

	/* Icon inside Menu Card */
	.menu-card i {
		font-size: 32px;
		margin-bottom: 10px;
		color: #34495e; /* Warna ikon yang lebih gelap */
	}

	/* Menu Card Text */
	.menu-card span {
		font-size: 14px;
		font-weight: bold;
		display: block;
		color: #34495e; /* Teks abu-abu gelap untuk kontras */
	}

		.logout-card {
			background: #dc3545;
		}

		.logout-card:hover {
			background: #a71d2a;
		}


    .row {
	    display: flex;
	    flex-wrap: wrap;
	    justify-content: space-between;
	}
	/* Menyusun tombol agar berada di bawah */
	.floating-btn-container {
	    position: fixed;
	    bottom: 20px; /* Jarak dari bawah */
	    left: 0;
	    width: 100%; /* Lebar penuh */
	    display: flex;
	    justify-content: center; /* Menempatkan tombol di tengah */
	    z-index: 1000; /* Menjaga agar tombol selalu berada di atas */
	}
	.floating-btn {
	    display: inline-block; /* Agar elemen <a> diperlakukan seperti tombol */
	    text-align: center; /* Pusatkan teks */
	    text-decoration: none; /* Hilangkan garis bawah */
	    background-color: #341f97; /* Warna latar tombol */
	    color: white; /* Warna teks */
	    font-size: 16px;
	    font-weight: bold;
	    padding: 15px 20px; /* Memberikan padding untuk kenyamanan */
	    width: 90%; /* Lebar tombol 90% dari lebar layar */
	    max-width: 400px; /* Batasi lebar tombol agar tidak terlalu besar */
	    border: none;
	    border-radius: 10px; /* Membuat sudut membulat */
	    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3); /* Memberikan efek bayangan */
	    cursor: pointer;
	    transition: background-color 0.3s ease;
	}

	/* Efek hover */
	.floating-btn:hover {
	    background-color: #2980b9; /* Warna ketika tombol disentuh */
	    text-decoration: none; /* Pastikan tidak ada underline saat hover */
	}

	/* Main Container */
	.container-t {
		margin-top: 10px;
		background-color: #341f97; /* Warna putih cerah, lebih elegan */
		padding: 20px;
		border-radius: 15px;
		box-shadow: 0 8px 30px rgba(0, 0, 0, 0.1); /* Shadow lebih tebal dan elegan */
		width: 100%;
		max-width: 600px;
		transition: transform 0.3s ease, box-shadow 0.3s ease; /* Animasi saat hover */
	}

	/* Header Section */
	.header {
	    display: flex;
	    justify-content: space-between;
	    margin-bottom: 0;
	}

	.time-box {
	    display: flex;
	    flex-direction: column;
	    align-items: center;
		background-color: #341f97; /* Warna putih cerah, lebih elegan */
	    
	    padding: 19px;
	    border-radius: 8px;
	    min-width: 100px;
	    text-align: center;
	}

	.status {
	    font-size: 12px;
	    font-weight: bold;
	    color: #fff;
	    margin-bottom: 5px;
	}

	.time {
	    font-size: 16px;
	    font-weight: bold;
	    color: #fff;
	}
	.icon {
		padding-top: 15%;
	    display: flex;
	    justify-content: center; /* Menyusun konten di tengah secara horizontal */
	    align-items: center; /* Menyusun konten di tengah secara vertikal */
	    width: 40px;
	    height: 40px;
	    background-color: #341f97;
	    border-radius: 50%;
	    box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
	}

	.icon b.icon-watch2 {
	    font-size: 50px; /* Sesuaikan ukuran ikon */
	    color: #fff; /* Sesuaikan warna ikon */
	}

	/* Button Styling */
	.buttons {
	    display: flex;
	    justify-content: space-between;
	    gap: 10px;
	    margin-top: 20px; /* Menambahkan jarak antara panel dan tombol */
	}

	.btn {
	    padding: 8px 20px;
	    font-size: 11px;
	    font-weight: bold;
	    border-radius: 5px;
	    color: #fff;
	    cursor: pointer;
	    border: none;
	    transition: background-color 0.3s;
	    width: 48%;
	}

	.btn-masuk {
	    background-color: #00bcd4; /* Biru Muda */
	}

	.btn-pulang {
	    background-color: #ff9800; /* Oranye Cerah */
	}

	.btn:hover {
	    opacity: 0.8;
	}
</style>
