<div class="row">
  <?php foreach ($data_get['jadwal_lab'] as $key => $value): ?>
    <div class="col-xs-12 col-sm-6 col-md-4">
      <div class="panel panel-default" style="box-shadow: 0 2px 6px rgba(0,0,0,0.1);">
        <div class="panel-body">
          <ul class="list-group" style="margin-bottom: 0;">
            <li class="list-group-item">
              <strong>Tanggal:</strong><br>
              <?php echo date('d-m-Y', strtotime($value['tanggal'])) ?>
            </li>
            <li class="list-group-item">
              <strong>Laboratorium:</strong><br>
              <?php echo $value['nama']; ?>
            </li>
            <li class="list-group-item">
              <strong>Keterangan:</strong><br>
              <?php echo $value['keterangan']; ?>
            </li>
          </ul>
        </div>
        <div class="panel-footer text-center">
          <?php
            $statusClass = 'default';
            $statusText  = 'Unknown';

            if ($value['status'] == 0) {
                $statusClass = 'danger';
                $statusText  = 'Belum Dikonfirmasi';
            } elseif ($value['status'] == 1) {
                $statusClass = 'success';
                $statusText  = 'Diterima';
            } elseif ($value['status'] == 2) {
                $statusClass = 'warning';
                $statusText  = 'Ditolak';
            }
            ?>

            <span class="label label-<?php echo $statusClass; ?>">
                <?php echo $statusText; ?>
            </span>
        </div>
      </div>
    </div>
  <?php endforeach ?>
</div>
