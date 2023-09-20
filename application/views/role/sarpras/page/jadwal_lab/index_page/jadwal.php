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
                  echo '<td>';
                  foreach ($value_jadwal as $value_detail) {
                    $status = ($value_detail['status'] == 0) ? 'default' : (($value_detail['status'] == 1) ? "success" : "danger" );
                    echo '<a onclick="update_status('.$value_detail['id_jadwal_lab'].');"><span style="margin-top:3px;" class="label label-'.$status.'">'.$value_detail['kode'].' - '.$value_detail['nama_guru'].' ('.$value_detail['nama_kelas'].')</span><a>';
                  }
                  echo '</td>';
                }else{
                  echo '<td></td>';
                }
              } ?>
            </tr>
          <?php endforeach ?>
        </tbody>
</table>