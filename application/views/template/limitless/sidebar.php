  <div class="page-container">

    <!-- Page content -->
    <div class="page-content">


      <div class="sidebar sidebar-main">
        <div class="sidebar-content" >

          <!-- User menu -->
          <div class="sidebar-user">
            <div class="category-content">
              <div class="media">
                <a href="#" class="media-left">
                  <!-- <img src="<?php echo ($user_account['foto'] == '') ? base_url('include/user_account/'.$user_account['foto']) : base_url('include/user_account/default.png')?>" class="img-circle img-responsive" alt=""> -->
                  <img src="<?php echo base_url('include/user_account/default.png')?>" class="img img-circle img-sm img-responsive" style="width: 36px !important;height: 36px !important;" alt="">
                </a>
                <div class="media-body" style="width: 50%;">
                  <span class="media-heading text-semibold"><?php echo ucfirst($user_account['first_name']) ?></span>
                  <div class="text-size-mini text-muted">
                    <?php echo ucfirst($user_account['username']) ?>
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

          <script type="text/javascript">
            $( ".sidebar-category" ).mouseover(function() {
              $('body').removeClass('sidebar-xs');
            });
            $( ".sidebar-category" ).mouseleave(function() {
              $('body').addClass('sidebar-xs');
            });
          </script>
          <!-- /main navigation -->

        </div>
      </div>
    