<ul class="navigation navigation-main navigation-accordion">
  <!-- Main -->
  <li class="navigation-header"><span>Main</span> <i class="icon-menu" title="Main pages"></i></li>
  <li><a href="Dashboard/get_data" class="app-item"><i class="icon-home4"></i> <span>Dashboard</span></a></li>
  <li>
    <a href="#"><i class="icon-book"></i> <span>Kepegawaian</span></a>
    <ul>
      <li><a href="Presensi_guru/get_data" class="app-item">Presensi Guru</a></li>
      <li><a href="Presensi_guru/history" class="app-item">Rekap Presensi</a></li>
    </ul>
  </li>
  <li>
    <a href="#"><i class="icon-book"></i> <span>Akademik</span></a>
    <ul>
      <!-- <li><a href="Pembelajaran/get_data" class="app-item">Pembelajaran</a></li> -->
      <li><a href="Presensi_guru/get_data" class="app-item">Presensi Guru</a></li>
      <li><a href="Uts/get_data" class="app-item">Input Nilai</a></li>
    </ul>
  </li>
  <?php if (!empty($user_account['is_walas'])): ?>
    <li class="navigation-header"><span>Wali Kelas</span> <i class="icon-menu" title="Page kits"></i></li>
    <li>
      <a href="#"><i class="icon-book"></i> <span>Rapor</span></a>
      <ul>
        <li><a href="Absensi/get_data" class="app-item">Presensi Rapor</a></li><!-- 
        <li><a href="Absensi/get_data" class="app-item">Catatan Akademik</a></li>
        <li><a href="Absensi/get_data" class="app-item">Pengembangan Karakter</a></li> -->
        <li><a href="Rapor/rapor_index" class="app-item">Rapor</a></li>
        <li><a href="Rapor/rapor_online_index" class="app-item">Rapor Online</a></li>
      </ul>
    </li>
    <li>
      <a href="#"><i class="icon-book"></i> <span>Presensi Harian</span></a>
      <ul>
        <li><a href="Presensi_harian/get_data" class="app-item">Presensi Harian</a></li>
        <li><a href="Presensi_harian/get_data" class="app-item">Rekap Presensi Harian</a></li>
      </ul>
    </li>
    <li>
      <a href="#"><i class="icon-book"></i> <span>Data Siswa</span></a>
      <ul>
        <li><a href="Siswa/get_data" class="app-item">List Siswa</a></li>
      </ul>
    </li>
  <?php endif ?>
  <!-- <li>
    <a href="#"><i class="icon-pencil3"></i> <span>Blog</span></a>
    <ul>
      <li><a href="Blog/profil" class="app-item">Profil</a></li>
      <li><a href="Blog/biografi" class="app-item">Biografi</a></li>
      <li><a href="Blog/add_artikel" class="app-item">Post Artikel</a></li>
    </ul>
  </li> -->

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
      <li><a href="Profil_website/get_data" class="app-item">Role</a></li>
  </li>
  <li><a href="Media/get_data" class="app-item"><i class="icon-stack-picture"></i> <span>Media</span></a></li>
  <!-- /page kits -->
</ul>