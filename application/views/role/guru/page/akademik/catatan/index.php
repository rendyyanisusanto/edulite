<div class="row">
  <div class="col-md-6">
    <div class="panel panel-body panel-head">
      <form action="Akademik/proses_catatan" id="app-proses" method="POST">
        <label>Mata Pelajaran</label>
        <select required="" name="idmatapelajaran_fk" class="form-control">
          <?php foreach ($data_get['mapel'] as $key => $value): ?>
          <option value="<?php echo $value['id_guru_mapel'] ?>"><?php echo $value['kelas'] ?>-<?php echo $value['mata_pelajaran'] ?></option>
          <?php endforeach ?>
        </select>
        <br>
        <label>Tanggal</label>
        <input type="date" class="form-control" value="<?= date('Y-m-d') ?>" name="tanggal">
        <button style="margin-top: 20px;" type="submit" required class="btn btn-success"><i class="icon-spinner2"></i> Proses</button>
      </form>
    </div>
  </div>
</div>
<div class="row">
  <div class="col-md-12">
    <div class="proses-catatan"></div>
  </div>
</div>