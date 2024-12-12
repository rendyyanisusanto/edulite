
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

	<div class="buttons">

			<div style="display: none;" class="rowabsen">
				<?php if (isset($data_get['presensi'])){ ?>
					<?php if (!empty($data_get['presensi']['jam_masuk']) && $data_get['presensi']['jam_masuk'] !== '00:00:00' ){ ?>
					<?php }else{ ?>
						<button class="btn btn-success btn-check" data-status="0" type="button">Absen Masuk</button>
					<?php } ?>
					<?php if (!empty($data_get['presensi']['jam_keluar']) && $data_get['presensi']['jam_keluar'] !== '00:00:00' ){ ?>
					<?php }else{ ?>
						<button class="btn btn-danger btn-check" data-status="1" type="button">Absen Pulang</button>
					<?php } ?>
				<?php }else{ ?>
					<button class="btn btn-success btn-check" data-status="0" type="button">Absen Masuk</button>
					<button class="btn btn-danger btn-check" data-status="1" type="button">Absen Pulang</button>
				<?php } ?>
			</div>

			
	</div>
</div>


<div class="row" style="margin-top: 15px;">
	<div class="col-xs-12">
		<center><b style="text-align: center; !important;">Fitur :</b></center>
	</div>
</div>
    <div class="row">
        <div class="col-xs-4">
            <div class="menu-card">
                <a href="Jurnal_guru/cek_jurnal" class="app-item">
                    <i class="icon-magazine"></i> 
                    <span>Presensi Siswa</span>
                </a>
            </div>
        </div>
        <div class="col-xs-4">
            <div class="menu-card">
                <a href="Presensi_guru/rekap" class="app-item">
                    <i class="icon-stack-empty"></i> 
                    <span>Log Absen Guru</span>
                </a>
            </div>
        </div>
        <div class="col-xs-4">
            <div class="menu-card">
                <a href="Penggajian/get_data" class="app-item">
                    <i class="icon-coin-dollar"></i> 
                    <span>HR</span>
                </a>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-4">
            <div class="menu-card">
                <a href="Request_absen/get_data" class="app-item">
                    <i class="icon-file-text2"></i> 
                    <span>Request Absen Guru</span>
                </a>
            </div>
        </div>
        <div class="col-xs-4">
            <div class="menu-card">
                <a href="Tugas/get_data" class="app-item">
                    <i class="icon-file-text3"></i> 
                    <span>Ijin/Tidak Masuk</span>
                </a>
            </div>
        </div>
        <div class="col-xs-4">
            <div class="menu-card logout-card">
                <a href="Logout" class="app-item">
                    <i class="icon-exit2"></i> 
                    <span>Logout</span>
                </a>
            </div>
        </div>
    </div>

<style>
    .menu-card {
        width: 100%;
        background-color: #f8f9fa; /* Gunakan warna netral terang */
        border-radius: 12px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Tambahkan bayangan lembut untuk kedalaman */
        margin: 10px;
        text-align: center;
        padding: 20px;
        transition: all 0.3s ease;
        cursor: pointer;
        flex: 1 1 30%; /* Membuat 3 elemen per baris */
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        height: 100px; /* Menyesuaikan tinggi card */
    }

    .menu-card a {
        text-decoration: none;
        color: #333;
        display: block;
    }

    .menu-card i {
        font-size: 20px;
        margin-bottom: 10px;
    }

    .menu-card span {
        display: block;
        font-size: 10px;
        font-weight: bold;
    }

    .menu-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 6px 10px rgba(0, 0, 0, 0.15);
    }

    .logout-card {
        background-color: #f8d7da;
        border: 1px solid #f5c6cb;
    }

    .logout-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 6px 10px rgba(0, 0, 0, 0.15);
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

	/* Styling tombol */
	.floating-btn {
	    background-color: #2c3e50; /* Warna latar tombol */
	    color: white;
	    font-size: 16px;
	    padding: 15px;
	    width: 90%; /* Lebar tombol 90% dari lebar layar */
	    max-width: 400px; /* Batasi lebar tombol agar tidak terlalu besar */
	    border: none;
	    border-radius: 10px; /* Membuat tombol melengkung */
	    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3); /* Memberikan efek bayangan */
	    cursor: pointer;
	    transition: background-color 0.3s ease;
	}

	/* Efek hover */
	.floating-btn:hover {
	    background-color: #2980b9; /* Warna ketika tombol disentuh */
	}


	/* Main Container */
	.container-t {
		margin-top: 10px;
	    background-color: #2c3e50; /* Warna biru */
	    padding: 20px;
	    border-radius: 10px;
	    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
	    width: 106%;
	    max-width: 600px;
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
	    background-color: #2c3e50;
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
	    background-color: #2c3e50;
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

	
<div class="floating-btn-container">
    <button class="floating-btn">Request Absen Guru</button>
</div>