<?php foreach($data_get['transaksi'] as $val){
    ?>

        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-body">
                    <table style="width: 100%;">
                        <tr>
                            <td>Tanggal</td>
                            <td>:</td>
                            <td style="padding-left: 3%;"><?php echo date_format(date_create($val['tanggal']), "d-M-Y")?></td>
                        </tr>
                        <tr>
                            <td>Jumlah</td>
                            <td>:</td>
                            <td style="padding-left: 3%;">Rp. <?php echo number_format($val['jumlah'], 0, '.', '.')?></td>
                        </tr>
                        <tr>
                            <td>Order ID</td>
                            <td>:</td>
                            <td style="padding-left: 3%;"><?php echo $val['order_id']?></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    <?php
} ?>


<a class="btn btn-danger btn-block app-item" href="Dashboard/get_data">Kembali</a>