
<div class="row">
	<div class="col-xs-12">
		<center><h4>Laporan Presensi Siswa</h4></center>
	</div>
</div>
<div class="row" style="margin-top: 5%;">
	<div class="col-xs-12">
		<a href="dashboard/get_data" class="btn app-item bg-warning-400 btn-labeled legitRipple"><b><i class="icon-home"></i></b> Home (<i>Home</i>)</a>
		<hr>
	</div>
</div>

<div class="menu-grid">
    <div class="menu-card">
        <a href="Laporan_presensi_siswa/laporan_harian" class="app-item">
            <i class="icon-magazine"></i>
            <span>Laporan Harian</span>
        </a>
    </div>
    <div class="menu-card">
        <a href="Laporan_presensi_siswa/laporan_per_siswa" class="app-item">
            <i class="icon-stack-empty"></i>
            <span>Laporan Per Siswa</span>
        </a>
    </div>
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
</style>