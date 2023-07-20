<table class="table table-framed table-bordered">
        <thead>
          <tr>
            <th rowspan="2">Jam</th>
            <th class="text-table text-center" colspan="<?php echo iterator_count($data_get['tg']) ?>">Tanggal</th>
          </tr>
          <tr>
          <?php foreach ($data_get['tg'] as $key => $value) { 
            echo "<th class='text-table text-center' width='25px'>".$value->format("d")."</th>";
          } ?>
          </tr>
        </thead>
        <tbody>
          <?php foreach ($data_get['jadwal'] as $value): ?>
            <tr>
              <td><?= $value['jam_pelajaran']['nama'].'('.$value['jam_pelajaran']['jam_mulai'].' - '.$value['jam_pelajaran']['jam_selesai'].')' ?></td>
              <?php foreach ($value['jadwal'] as $key_jadwal => $value_jadwal) { 
                echo '<td>'.$value_jadwal['id_jadwal_lab'].'</td>';
                // print_r($value['jadwal']);
              } ?>
            </tr>
          <?php endforeach ?>
        </tbody>
</table>