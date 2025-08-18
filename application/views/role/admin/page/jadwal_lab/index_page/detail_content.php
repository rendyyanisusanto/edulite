<input type="hidden" name="id_jadwal_lab" value="<?= $data_get['jadwal_lab']['id_jadwal_lab'] ?>">

<div class="panel panel-default" style="border-radius:8px; box-shadow:0 4px 12px rgba(0,0,0,0.1); border:0;">
  <div class="panel-body" style="padding:20px;">

    <ul class="list-unstyled detail-list">
      <li><i class="icon-office text-info"></i> <strong>Laboratorium:</strong> <?= $data_get['laboratorium']['nama'] ?></li>
      <li><i class="icon-calendar text-success"></i> <strong>Tanggal:</strong> <?= date('d-m-Y', strtotime($data_get['jadwal_lab']['tanggal'])) ?></li>
      <li><i class="icon-user text-warning"></i> <strong>Guru:</strong> <?= $data_get['guru']['nama'] ?></li>
      <li><i class="icon-users text-primary"></i> <strong>Kelas:</strong> <?= $data_get['kelas']['kelas'] ?></li>
      <li><i class="icon-book text-danger"></i> <strong>Mapel:</strong> <?= $data_get['mata_pelajaran']['mata_pelajaran'] ?></li>
      <li><i class="icon-file-text text-muted"></i> <strong>Keterangan:</strong> <?= $data_get['jadwal_lab']['keterangan'] ?></li>
      <li>
        <i class="icon-watch text-success"></i> <strong>Jam ke:</strong>
        <ul class="list-unstyled" style="margin:8px 0 0 22px;">
          <?php foreach ($data_get['detail'] as $value): ?>
            <li>• <?= $value['nama'].' ('.$value['jam_mulai'].' / '.$value['jam_selesai'].')' ?></li>
          <?php endforeach ?>
        </ul>
      </li>
      <li style="margin-top:10px;">
        <i class="icon-checkmark2 text-info"></i> <strong>Status:</strong>
        <select class="form-control input-sm" name="status" style="margin-top:6px; max-width:220px;">
          <option <?= ($data_get['jadwal_lab']['status'] == 0 ) ? "selected" : ''; ?> value="0">Belum dikonfirmasi</option>
          <option <?= ($data_get['jadwal_lab']['status'] == 1 ) ? "selected" : ''; ?> value="1">Diterima</option>
          <option <?= ($data_get['jadwal_lab']['status'] == 2 ) ? "selected" : ''; ?> value="2">Ditolak</option>
        </select>
      </li>
    </ul>

  </div>
</div>

<style>
  .detail-list li {
    padding: 6px 0;
    font-size: 13px;
    border-bottom: 1px solid #f1f1f1;
  }
  .detail-list li:last-child {
    border-bottom: none;
  }
  .detail-list i {
    margin-right: 6px;
    font-size: 14px;
  }
</style>
