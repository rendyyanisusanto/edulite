<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Peminjaman Barang</title>
        <!-- Custom fonts for this template-->
        <link href="<?php echo base_url('include/sb-admin/vendor/');?>/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
            <!-- Custom styles for this template-->
            <link href="<?php echo base_url('include/sb-admin/css/');?>sb-admin-2.min.css" rel="stylesheet">
        </head>
        <body class="bg-gradient-primary">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-12 col-lg-12 col-md-12">
                        <div class="card o-hidden border-0 shadow-lg my-5">
                            <div class="card-body p-0">
                                <!-- Nested Row within Card Body -->
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="p-5">
                                            <div class="text-center">
                                                <h1 class="h4 text-gray-900 mb-4" style="font-weight: bold;">PEMINJAMAN BARANG</h1>
                                    
                                            </div>
                                                <div class="form-group">
                                                    <input type="password" class="form-control rfid form-control-user"
                                                    placeholder="SCAN KARTU PRESENSI...">
                                                </div>
                                                
                                            <hr>
                                            <div class="table-responsive">
                                                
                                                <div class="table-presence"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Modal -->
            <div id="myModal" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-body">

                            <div class="row">
                                <div class="col-lg-12" style="padding: 2%;">
                                    <div class="col-xl-12 col-md-12 ">
                                        <h3 style="text-align: center;"><b style="color: green;" class="msg-ajax">Mutasi Peminjaman</b></h3>
                                    </div>
                                    <div class="col-lg-12" style="padding: 2%;">
                                        <img class="img-ajax" src="<?= base_url('include/media/foto/1.jpeg'); ?>" style="width: 100%;border-radius: 10px;" >
                                    </div>

                                    <div class="col-lg-12" style="padding: 2%;">
                                        <table class="table  table-bordered table-hover">
                                            <tr>
                                                <td>Nama</td>
                                                <td><b class="pemilik"></b></td>
                                            </tr>
                                            <tr>
                                                <td>Nama Barang</td>
                                                <td><b class="barang"></b></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <!-- Bootstrap core JavaScript-->
            <script src="<?php echo base_url('include/sb-admin/vendor/');?>/jquery/jquery.min.js"></script>
            <script src="<?php echo base_url('include/sb-admin/vendor/');?>/bootstrap/js/bootstrap.bundle.min.js"></script>
            <!-- Core plugin JavaScript-->
            <script src="<?php echo base_url('include/sb-admin/vendor/');?>/jquery-easing/jquery.easing.min.js"></script>
            <!-- Custom scripts for all pages-->
            <script src="<?php echo base_url('include/sb-admin/js/');?>sb-admin-2.min.js"></script>

              <link rel="stylesheet" href="<?php echo base_url('include/core/core.css')?>">
              <script src="<?php echo base_url('include/core/core.js')?>"></script>
            <script type="text/javascript">
                $(".rfid").focus();
                get_table();
                function get_table(){
                    send_ajax('<?php echo base_url('Mutasi_penitipan/table_mutasi');?>').then(function(data){
                        $('.table-presence').html(data);
                    })
                }
                $(".rfid").keyup(function(event) {
                    event.stopImmediatePropagation();

                    if (event.keyCode === 13) {
                        
                        send_ajax('<?php echo base_url('Mutasi_penitipan/data_peminjam');?>', {rfid:$('.rfid').val()}).then(function(data){
                            var rsp = JSON.parse(data);

                            if (rsp.status == 200) {
                                $('.msg-ajax').text(rsp.msg);
                                $('.pemilik').text(rsp.data.penitip.nama);
                                $('.barang').text(rsp.data.penitipan_barang.nama_barang);

                                $('.img-ajax').attr('src', "<?= base_url('include/media/foto_penitipan_barang/'); ?>"+rsp.data.penitipan_barang.foto);
                                $('#myModal').modal('toggle');
                            }

                            setTimeout(function(data){
                                $('.rfid').val('');
                                $('#myModal').modal('toggle');
                                get_table();
                                $('.rfid').focus();
                            }, 1500);
                          
                        })
                    }
                });
            </script>
        </body>
    </html>