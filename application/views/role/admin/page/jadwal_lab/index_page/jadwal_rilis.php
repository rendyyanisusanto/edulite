<table class="table table-framed table-bordered">
        <thead>
          <tr>
            <th rowspan="2">Jam</th>
            <th class="text-table text-center" colspan="<?php echo iterator_count($data_get['tg']) ?>">Tanggal</th>
          </tr>
          <tr>
          <?php foreach ($data_get['tg'] as $key => $value) { 
            echo "<th class='text-table text-center' width='15%'>".$value->format("d")."</th>";
          } ?>
          </tr>
        </thead>
        <tbody>
          <?php foreach ($data_get['jadwal'] as $value): ?>
            <tr>
              <td><?= $value['jam_pelajaran']['nama'].'('.$value['jam_pelajaran']['jam_mulai'].' - '.$value['jam_pelajaran']['jam_selesai'].')' ?></td>
              <?php foreach ($value['jadwal'] as $key_jadwal => $value_jadwal) { 
                if (!empty($value_jadwal)) {
                  $status = ($value_jadwal['status'] == 0) ? 'default' : (($value_jadwal['status'] == 1) ? "success" : "danger" );
                  echo '<td>';
                  echo '<b>'.$value_jadwal['nama_kelas'].' ('.$value_jadwal['nama_guru'].')</b>';
                  
                  echo '</td>';
                }else{
                  echo '<td></td>';
                }
              } ?>
            </tr>
          <?php endforeach ?>
        </tbody>
</table>