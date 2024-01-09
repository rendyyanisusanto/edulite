<ul class="navigation navigation-main navigation-accordion">
  <!-- Main -->
  <li class="navigation-header"><span>Main</span> <i class="icon-menu" title="Main pages"></i></li>
  <li><a href="Dashboard/get_data" class="app-item"><i class="icon-home4"></i> <span>Dashboard</span></a></li>
  
 
  <!-- Page kits -->
  <li class="navigation-header"><span>Role Management</span> <i class="icon-menu" title="Page kits"></i></li>
  <li>
    <a href="#"><i class="icon-magazine"></i> <span>Administrasi</span></a>
    <ul>
      <li><a href="Buku_tamu/get_data" class="app-item">Buku Tamu</a></li>
      <li><a href="Surat_masuk/get_data" class="app-item">Surat Masuk</a></li>
      <li><a href="Surat_keluar/get_data" class="app-item">Surat Keluar</a></li>
      <li><a href="Kepegawaian/get_data" class="app-item">Buku Induk Kepegawaian</a></li>
    </ul>
  </li>
  <li>
    <a href="#"><i class="icon-archive"></i> <span>PPDB</span></a>
    <ul>
      <li><a href="PPDB/get_data" class="app-item">Pendaftar Baru</a></li>
      <li><a href="Calon_siswa/get_data" class="app-item">Calon Siswa</a></li>
    </ul>
  </li>
  <?php if (!empty($user_modul)): ?>
    <li class="navigation-header"><span>Additional Feature</span> <i class="icon-menu" title="Page kits"></i></li>
  <?php endif ?>

  <?php foreach ($user_modul as $value): ?>
    <li>
      <a href="#"><i class="<?= $value['modul']['icon'] ?>"></i> <span><?= $value['modul']['modul'] ?></span></a>
        <ul>
        <?php foreach ($value['submodul'] as $value_sub): ?>
          <li><a href="Alumni/get_data" class="app-item"><?= $value_sub['submodul'] ?></a></li>
        <?php endforeach ?>
        </ul>
    </li>
  <?php endforeach ?>
  <li class="navigation-header"><span>Setting kits</span> <i class="icon-menu" title="Page kits"></i></li>
  
  <li>
    <a href="#"><i class="icon-users2"></i> <span>Account</span></a>
    
    <ul>
      <li><a href="users/get_data" class="app-item">User</a></li>
      <li><a href="Profil_website/get_data" class="app-item">Role</a></li>
      
  </li>
  <!-- /page kits -->
</ul>