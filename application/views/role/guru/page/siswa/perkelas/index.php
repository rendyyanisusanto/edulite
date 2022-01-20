<div class="row">
  <div class="col-md-6">
    <div class="panel panel-body panel-head">
      <form action="Siswa/proses_siswa" id="app-proses" method="POST">
        <label>Kelas</label>
        <select class="form-control" name="id_kelas">
              <?php foreach ($data_get['dt_guru']['walas'] as $key => $value): ?>
                <option value="<?php echo $value['id_kelas'] ?>"><?php echo $value['kelas'] ?></option>
              <?php endforeach ?>
              </select>
        <button style="margin-top: 20px;" type="submit" class="btn btn-success"><i class="icon-spinner2"></i> Proses</button>
      </form>
    </div>
  </div>
</div>
<div class="row">
  <div class="col-md-12">
    <div class="proses-siswa"></div>
  </div>
</div>