<ul class="navigation navigation-main navigation-accordion">
  <!-- Main -->
  <li class="navigation-header"><span>Main</span> <i class="icon-menu" title="Main pages"></i></li>
  <li><a href="Dashboard/get_data" class="app-item"><i class="icon-home4"></i> <span>Dashboard</span></a></li>
  <li>
    <a href="#"><i class="icon-book"></i> <span>Kepegawaian </span></a>
    <ul>
      <li><a href="Presensi_guru/history" class="app-item">Rekap Presensi</a></li>
      <li><a href="Penggajian/get_data" class="app-item">HR</a></li>
    </ul>
  </li>

  <?php if (!empty($user_account['pembimbing_prakerin'])): ?>
    <!-- <li>
      <a href="#"><i class="icon-people"></i> <span>PRAKERIN </span></a>
      <ul>
        <li><a href="Presensi_guru/history" class="app-item">Rekap Presensi</a></li>
      </ul>
    </li> -->
  <?php endif ?>
  <?php if (!empty($user_account['is_walas'])): ?>
    <li class="navigation-header"><span>Wali Kelas</span> <i class="icon-menu" title="Page kits"></i></li>
    <!-- <li>
      <a href="#"><i class="icon-book"></i> <span>Rapor</span></a>
      <ul>
        <li><a href="Absensi/get_data" class="app-item">Presensi Rapor</a></li>
        <li><a href="Absensi/get_data" class="app-item">Catatan Akademik</a></li>
        <li><a href="Absensi/get_data" class="app-item">Pengembangan Karakter</a></li>
        <li><a href="Rapor/rapor_index" class="app-item">Rapor</a></li>
        <li><a href="Rapor/rapor_online_index" class="app-item">Rapor Online</a></li>
      </ul>
    </li> -->
    <li>
      <a href="#"><i class="icon-book"></i> <span>Presensi Harian</span></a>
      <ul>
        <!-- <li><a href="Presensi_harian/get_data" class="app-item">Presensi Harian</a></li> -->
        <li><a href="Presensi_harian/rekap" class="app-item">Rekap Presensi Harian</a></li>
      </ul>
    </li>
    <li>
      <a href="#"><i class="icon-book"></i> <span>Data Siswa</span></a>
      <ul>
        <li><a href="Siswa/get_data" class="app-item">List Siswa</a></li>
      </ul>
    </li>
    <li><a href="Catatan_siswa/get_data" class="app-item"><i class="icon-book"></i> <span>Catatan Siswa</span></a></li>
  <?php endif ?>
  <li><a href="jadwal_lab/get_data" class="app-item"><i class="icon-notebook"></i> <span>Peminjaman Laboratorium</span></a></li>
  <li class="navigation-header"><span>Custom Fitur</span> <i class="icon-menu" title="Page kits"></i></li>
  <li><a href="tugas/get_data" class="app-item"><i class="icon-book"></i> <span>Penugasan Siswa</span></a></li>
  <!-- Page kits -->
  <li class="navigation-header"><span>Setting kits</span> <i class="icon-menu" title="Page kits"></i></li>
  <li>
    <a href="#"><i class="icon-stack2"></i> <span>Master</span></a>
    <ul>
      <li><a href="Kd/get_data" class="app-item">Deskripsi KD</a></li>
    </ul>
  </li>
  <li>
    <a href="#"><i class="icon-users2"></i> <span>Account</span></a>
    
    <ul>
      <li><a href="Data_profil/get_data" class="app-item">Data Profil</a></li>
      <li><a href="Data_profil/akun" class="app-item">Data Akun</a></li>
  </li>
  <!-- /page kits -->
</ul>