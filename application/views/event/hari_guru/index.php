<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><?php echo $profil_website['nama_website'] ?></title>
    <!-- Global stylesheets -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900" rel="stylesheet" type="text/css">
    <link href="<?php echo base_url('include/template/dashboard/icomoon/styles.css')?>" rel="stylesheet" type="text/css">
    <link href="<?php echo base_url('include/template/dashboard/css')?>/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="<?php echo base_url('include/template/dashboard/css')?>/core.min.css" rel="stylesheet" type="text/css">
    <link href="<?php echo base_url('include/template/dashboard/css')?>/components.min.css" rel="stylesheet" type="text/css">
    <link href="<?php echo base_url('include/template/dashboard/css')?>/colors.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="<?php echo base_url('include/template/toastr/toastr.css')?>">
    <!-- /global stylesheets -->
    <script src="<?php echo base_url('include/template/dashboard/js')?>/plugins/loaders/pace.min.js"></script>
    <script src="<?php echo base_url('include/template/dashboard/js')?>/core/libraries/jquery.min.js"></script>
    <script src="<?php echo base_url('include/template/dashboard/js')?>/core/libraries/bootstrap.min.js"></script>
    <script src="<?php echo base_url('include/template/dashboard/js')?>/plugins/loaders/blockui.min.js"></script>
    
    <!-- Theme JS files -->
    <script src="<?php echo base_url('include/template/dashboard/js/app.js')?>"></script>
    <link rel="stylesheet" href="<?php echo base_url('include/template/toastr/toastr.css')?>">
    <script src="<?php echo base_url('include/template/dashboard/js/')?>plugins/ui/ripple.min.js"></script>
    <link rel="stylesheet" href="<?php echo base_url('include/core/core.css')?>">
    <script src="<?php echo base_url('include/core/core.js')?>"></script>
    
    <script src="<?php echo base_url('include/template/toastr/toastr.min.js')?>"></script>
    <script src="<?php echo base_url('include/template/keys/jquery.key.js')?>"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAz51lKipef50F9xznI-1g_O0GQt0JR7h0"></script>
    <!-- /theme JS files -->
  </head>
  <body>
    <div class="page-container">
      <!-- Page content -->
      <div class="page-content">
        <div class="content-wrapper" style="padding-bottom: 10px; ">
          <div class="content">
            <div class="row">
              <?php foreach ($guru as $key => $value): ?>
                
                <div class="col-md-2" >
                  <div class="thumbnail no-padding">
                    <div class="thumb">
                      <img src="<?php echo base_url('include/media/hariguru/') ?><?php echo $value["foto_gv"] ?>" alt="">
                      
                    </div>
                  
                      <div class="caption text-center">
                        <h6 class="text-semibold no-margin"><?php echo $value['nama'] ?> <small class="display-block">SMK IT Asy-Syadzili</small></h6>
                        <br>
                        <button onclick="choose(<?php echo $value['id_guru'] ?>, '<?php echo $value['nama'] ?>');" type="button" class="btn btn-choose btn-block btn-success">Pilih Guru</button>

                        <button style="display:none;" type="button" class="btn btn-idle btn-block btn-danger">Terimakasih sudah memilih!</button>
                      </div>
                    </div>
                </div>
              <?php endforeach ?>

             

            </div>
          </div>
        </div>
      </div>
    </div>

    <script type="text/javascript">
      function choose(id, nama){
       if (confirm("Apakah anda yakin ingin memilih "+nama+" ini sebagai guru favorit")) {
          send_ajax("<?php echo base_url('event/hari_guru/hari_guru/proses');?>", {id:id}).then(function(data){
            console.log(data);
            $('.btn-choose').css('display', 'none');
            $('.btn-idle').css('display', '');
            // $('.btn-choose').text("Tunggu Sebentar");
            setTimeout(function() {
              $('.btn-choose').css('display','');
              $('.btn-idle').css('display', 'none');
            }, 7000);
          })
        } else {
          txt = "You pressed Cancel!";
        }
      }
    </script>
  </body>
</html>