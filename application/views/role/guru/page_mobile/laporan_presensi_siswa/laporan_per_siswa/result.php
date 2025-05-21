<?php foreach ($data_get['dt_absen'] as $key => $value): ?>
    <div class="panel panel-default" style="border-radius: 8px; box-shadow: 0 2px 6px rgba(0,0,0,0.1); margin-bottom: 15px;">
        <div class="panel-body">
            <h4 class="text-center" style="margin-top: 0; font-weight: bold;">
                Tanggal: <?php echo date('d-m-Y', strtotime($key)); ?>
            </h4>

            <div class="row" style="margin-bottom: 10px;">
                <div class="col-xs-6 text-muted">Jam Masuk</div>
                <div class="col-xs-6 text-right"><strong><?php echo ($value['jam_masuk'] == "-") ?  '-' : $value['jam_masuk']['waktu']; ?></strong></div>
            </div>

            <div class="row" style="margin-bottom: 10px;">
                <div class="col-xs-6 text-muted">Jam Pulang</div>
                <div class="col-xs-6 text-right"><strong><?php echo ($value['jam_pulang'] == "-") ?  '-' : $value['jam_pulang']['waktu']; ?></strong></div>
            </div>

            <div class="row" style="margin-bottom: 10px;">
                <div class="col-xs-6 text-muted">Status</div>
                <div class="col-xs-6 text-right">
                    <?php
                        $status = strtoupper($value['absen']);
                        $label_class = 'label-default';
                        if ($status === 'MASUK') $label_class = 'label-success';
                        elseif ($status === 'TIDAK MASUK') $label_class = 'label-danger';
                        elseif ($status === 'IJIN') $label_class = 'label-warning';
                    ?>
                    <span class="label <?php echo $label_class; ?>" >
                        <?php echo $status; ?>
                    </span>
                </div>
            </div>

            <div class="row">
                <div class="col-xs-6 text-muted">Jumlah Ijin</div>
                <div class="col-xs-6 text-right"><strong><?php echo $value['jumlah_ijin']; ?></strong></div>
            </div>
        </div>
    </div>
<?php endforeach; ?>
