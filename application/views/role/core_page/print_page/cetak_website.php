
<button class="btn btn-primary btn-cetak-web btn-sm" type="button"><i class="icon-printer"></i> Cetak</button>
<div id="DivIdToPrint">
    <style type="text/css">
    .tbl thead{
        text-align: center;
        font-weight: bold;
    }
    .tbl{
        margin-top: 2%;
    }

            table {
              border-collapse: collapse;
              /*font-family: consolas;*/
              font-size: 10px;
            }
            table tbody tr td{
                padding-left: 10px;
            }
            table thead{
                text-align: center;
            }
</style>
<center><h3>Cetak Data <?php echo $data_get['filename'] ?></h3></center>
<table class="table tbl table-bordered table-xxs table-framed">
    <thead>
        <tr>
            <td width="1%">No</td>
            <?php
                foreach ($data_get['header_table'] as $key => $value) {
                    echo '<td>'.ucwords(str_replace('_', ' ', $value)).'</td>';
                }
            ?>
        </tr>
    </thead>
    <tbody>
        <?php
        $no = 0;
            foreach ($data_get['data_obj'] as $key => $value) {
            ?>
            <tr>
                <td><?php echo ++$no; ?></td>
                <?php
                    foreach ($data_get['header_table'] as $key_obj => $value_obj) {
                        ?>
                        <td><?php echo $value[$value_obj] ?></td>
                        <?php
                    }
                ?>
            </tr>
            <?php
            }
        ?>
    </tbody>
</table>
</div>