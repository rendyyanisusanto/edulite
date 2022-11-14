<body class="sidebar-xs">
  
<div class="se-pre-con" style="display: none;"></div>
  <div class="navbar navbar-default header-highlight">
    <div class="navbar-header">
      <a class="navbar-brand" style="color:white !important;" href="#"><?php echo $profil_website['nama_website'] ?></a>

      <ul class="nav navbar-nav visible-xs-block">
        <li><a data-toggle="collapse" data-target="#navbar-mobile"><i class="icon-tree5"></i></a></li>
        <li><a class="sidebar-mobile-main-toggle"><i class="icon-paragraph-justify3"></i></a></li>
      </ul>
    </div>

    <div class="navbar-collapse collapse" id="navbar-mobile">
      <ul class="nav navbar-nav">
        <li><a class="sidebar-control sidebar-main-toggle hidden-xs"><i class="icon-paragraph-justify3"></i></a></li>
      </ul>
      <div class="navbar-right">

        <ul class="nav navbar-nav">

          <li style="background: red;"><a href="<?php echo base_url('auth/logout') ?>" style="color: white !important;"><i class="icon-exit"></i> <span>LOGOUT</span></a></li>   
        </ul>
      </div>
    </div>
  </div>
  <!-- /main navbar -->
