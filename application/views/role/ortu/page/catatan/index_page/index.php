<?php foreach($data_get['catatan'] as $val){
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
                            <td>Uraian</td>
                            <td>:</td>
                            <td style="padding-left: 3%;"><?php echo $val['uraian_pelanggaran']?></td>
                        </tr>
                        <tr>
                            <td>Jenis Pelanggaran</td>
                            <td>:</td>
                            <td style="padding-left: 3%;"><?php echo $val['jenis_pelanggaran']?></td>
                        </tr>
                        <tr>
                            <td>Poin</td>
                            <td>:</td>
                            <td style="padding-left: 3%;"><?php echo $val['poin']?></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    <?php
} ?>


<a class="btn btn-danger btn-block app-item" href="Dashboard/get_data">Kembali</a>