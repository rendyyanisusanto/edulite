<center><h4><b>Tanggungan Sekolah</b></h4></center>
<br>
<?php
    foreach($data_get['spp'] as $value){
        ?>

        <div class="row">
            <div class="col-sm-12">
                <a class="app-item" href="Transaksi/bayar_spp/<?php echo $value['bulan'].'/'.$value['tahun'];?>">
                <div class="panel panel-body">
                    <b>Tanggungan SPP <?php echo $value['bulan'].'/'.$value['tahun'];?>, Total : Rp. 200.000</b>
                    <br>
                    <i class=" label label-<?php echo ($value['data_set']>0) ? 'success' : 'danger' ;?>"><?php echo ($value['data_set']>0) ? 'LUNAS' : 'BELUM LUNAS' ;?></i>
                </div>
                </a>
            </div>
        </div>
        <?php
    }
?>


<a class="btn btn-danger btn-block app-item" href="Dashboard/get_data">Kembali</a>
