<div class="panel panel-body">
  <center><h4><b>Jadwal pada minggu ke <?= $data_get['week'] ?></b></h4></center>
  <div class="table-responsive">
    
  <table class="table table-framed table-bordered">
          <thead>
            <tr>
              <th rowspan="2">Jam</th>
              <th class="text-table text-center" colspan="<?php echo iterator_count($data_get['tg']) ?>">Tanggal</th>
            </tr>
            <tr>
            <?php foreach ($data_get['tg'] as $key => $value) { 
              echo "<th class='text-table text-center' width='2%'>".$value->format("d")."</th>";
            } ?>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($data_get['jadwal'] as $value): ?>
              <tr>
                <td><?= $value['jam_pelajaran']['nama'].'('.$value['jam_pelajaran']['jam_mulai'].' - '.$value['jam_pelajaran']['jam_selesai'].')' ?></td>
                <?php foreach ($value['jadwal'] as $key_jadwal => $value_jadwal) { 
                  if (!empty($value_jadwal)) {
                    if ($value_jadwal['accept'] > 0) {
                      echo '<td style="background:red;"></td>';
                    }elseif ($value_jadwal['all'] > 0) {
                      echo '<td style="background:yellow;">'.$value_jadwal['all'].'</td>';
                    }else{
                      echo '<td></td>';
                    }
                    
                  }else{
                    echo '<td></td>';
                  }
                } ?>
              </tr>
            <?php endforeach ?>
          </tbody>
  </table>
  </div>
</div>