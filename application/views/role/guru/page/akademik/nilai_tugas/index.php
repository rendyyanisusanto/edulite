<div class="row">
  <div class="col-md-6">
    <div class="panel panel-body panel-head">
      <form action="Akademik/proses_get_kelas" id="app-proses" method="POST">
        <label>Mata Pelajaran</label>
        <select required="" name="id_guru_mapel" class="form-control">
          <?php foreach ($data_get['mapel'] as $key => $value): ?>
          <option value="<?php echo $value['id_guru_mapel'] ?>"><?php echo $value['kelas'] ?>-<?php echo $value['mata_pelajaran'] ?></option>
          <?php endforeach ?>
        </select>
        <button style="margin-top: 20px;" type="submit" required class="btn btn-success"><i class="icon-spinner2"></i> Proses</button>
      </form>
    </div>
  </div>
</div>
<div class="row">
  <div class="col-md-12">
    <div class="proses-input-pengetahuan"></div>
  </div>
</div>