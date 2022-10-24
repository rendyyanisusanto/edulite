<ul class="navigation navigation-main navigation-accordion">
  <!-- Main -->
  <li class="navigation-header"><span>Main</span> <i class="icon-menu" title="Main pages"></i></li>
  <li><a href="Dashboard/get_data" class="app-item"><i class="icon-home4"></i> <span>Dashboard</span></a></li>
  
 
  <!-- Page kits -->
  <li class="navigation-header"><span>Role Management</span> <i class="icon-menu" title="Page kits"></i></li>
  <li>
      <a href="#"><i class="icon-collaboration"></i> <span>Sosialisasi</span></a>
      <ul>
        <li><a href="Sosialisasi/get_data" class="app-item">Daftar Sosialisasi</a></li>
        <?php if ($user_account['c'] == 1): ?>
          <li><a href="Sosialisasi/add_page" class="app-item">Tambah Sosialisasi</a></li>
        <?php endif ?>
      </ul>
  </li>
  <li>
      <a href="#"><i class="icon-office"></i> <span>Hubungan Industri</span></a>
      <ul>
        <li><a href="Dudi/get_data" class="app-item">DU/DI</a></li>
        <li><a href="Kerjasama_dudi/get_data" class="app-item">Kerjasama DU/DI</a></li>
        <li><a href="Jenis_kerjasama/get_data" class="app-item">Jenis Kerjasama</a></li>
        <li><a href="Lowongan/get_data" class="app-item">Lowongan</a></li>
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
      
  </li>
  <!-- /page kits -->
</ul>