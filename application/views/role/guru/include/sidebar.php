<ul class="navigation navigation-main navigation-accordion">
  <!-- Main -->
  <li class="navigation-header"><span>Main</span> <i class="icon-menu" title="Main pages"></i></li>
  <li><a href="Dashboard/get_data" class="app-item"><i class="icon-home4"></i> <span>Dashboard</span></a></li>
  <li>
    <a href="#"><i class="icon-book"></i> <span>Akademik</span></a>
    <ul>
      <li><a href="Pembelajaran/get_data" class="app-item">Pembelajaran</a></li>
      <li><a href="Absensi/get_data" class="app-item">Absensi</a></li>
      <li><a href="Uts/get_data" class="app-item">UTS</a></li>
    </ul>
  </li>
  <?php if (!empty($user_account['is_walas'])): ?>
    <li>
      <a href="#"><i class="icon-book"></i> <span>Wali Kelas</span></a>
      <ul>
        <li><a href="Siswa/get_data" class="app-item">Data Siswa</a></li>
        <li><a href="Absensi/get_data" class="app-item">Presensi</a></li>
        <li><a href="Mapel/get_data" class="app-item">Nilai Mapel</a></li>
      </ul>
    </li>
  <?php endif ?>
  <li>
    <a href="#"><i class="icon-pencil3"></i> <span>Blog</span></a>
    <ul>
      <li><a href="Blog/profil" class="app-item">Profil</a></li>
      <li><a href="Blog/biografi" class="app-item">Biografi</a></li>
      <li><a href="Blog/add_artikel" class="app-item">Post Artikel</a></li>
    </ul>
  </li>

  <!-- Page kits -->
  <li class="navigation-header"><span>Setting kits</span> <i class="icon-menu" title="Page kits"></i></li>
  <li>
    <a href="#"><i class="icon-stack2"></i> <span>Master</span></a>
    <ul>
      <li><a href="Siswa/get_data" class="app-item">Siswa</a></li>
      <li><a href="Siswa_kelas/get_data" class="app-item">Daftar Siswa Kelas</a></li>
      <li><a href="Guru/get_data" class="app-item">Guru</a></li>
      <li><a href="Kelas/get_data" class="app-item">Kelas</a></li>
      <li><a href="Jurusan/get_data" class="app-item">Jurusan</a></li>
      <li><a href="Mata_pelajaran/get_data" class="app-item">Mata Pelajaran</a></li>
      <li><a href="Tahun_ajaran/get_data" class="app-item">Tahun ajaran</a></li>
      <li><a href="Guru_mapel/get_data" class="app-item">Guru Mapel</a></li>
    </ul>
  </li>
  <li>
    <a href="#"><i class="icon-users2"></i> <span>Account</span></a>
    
    <ul>
      <li><a href="users/get_data" class="app-item">User</a></li>
      <li><a href="Profil_website/get_data" class="app-item">Role</a></li>
  </li>
  <li><a href="Media/get_data" class="app-item"><i class="icon-stack-picture"></i> <span>Media</span></a></li>
  <!-- /page kits -->
</ul>