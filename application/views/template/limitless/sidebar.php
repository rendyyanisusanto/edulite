  <div class="page-container">

    <!-- Page content -->
    <div class="page-content">


      <div class="sidebar sidebar-main">
        <div class="sidebar-content" >

          <!-- User menu -->
          <div class="sidebar-user">
            <div class="category-content">
              <div class="media">
                <a href="#" class="media-left"><img src="<?php echo ($user_account['foto'] == '') ? base_url('include/user_account/'.$user_account['foto']) : base_url('include/template/limitless/global_assets/images/placeholders/placeholder.jpg')?>" class="img-circle img-responsive" alt=""></a>
                <div class="media-body">
                  <span class="media-heading text-semibold"><?php echo ucfirst($user_account['username']) ?></span>
                  <div class="text-size-mini text-muted">
                    <i class="icon-pin text-size-small"></i> &nbsp;<?php echo ucfirst($user_account['email']) ?>
                  </div>
                </div>

                <div class="media-right media-middle">
                  <ul class="icons-list">
                    <li>
                      <a href="Profil_website/get_data" class="app-item"><i class="icon-cog3"></i></a>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
          <!-- /user menu -->


          <!-- Main navigation -->
          <div class="sidebar-category sidebar-category-visible">
            <div class="category-content no-padding">
              <?php $this->load->view($sidebar); ?>
              <li style="background: red;"><a href="<?php echo base_url('auth/logout') ?>"><i class="icon-exit"></i> <span>LOGOUT</span></a></li>
            </div>
          </div>
          <!-- /main navigation -->

        </div>
      </div>
    