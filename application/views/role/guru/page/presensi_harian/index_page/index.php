<div class="row">
  <div class="col-md-6">
    <div class="panel panel-body">
      <form action="Presensi_harian/proses_presensi_harian" id="app-proses" method="POST">
        <table class="table table-framed table-bordered">
          <tr>
            <td class="bg-blue-800">Kelas</td>
            <td class="bg-teal">
              <select class="form-control" name="idkelas_fk">
                <?php foreach ($data_get['dt_guru']['walas'] as $key => $value): ?>
                <option value="<?php echo $value['id_kelas'] ?>"><?php echo $value['kelas'] ?></option>
                <?php endforeach ?>
              </select>
            </td>
          </tr>
          
        </table>
        
        <hr>
        <label>Tahun Ajaran</label>
        <select required="" name="idtahunajaran_fk" class="form-control">
          <?php foreach ($data_get['tahun_ajaran'] as $key => $value): ?>
          <option value="<?php echo $value['id_tahun_ajaran'] ?>"><?php echo $value['tahun_ajaran'].' - '.$value['semester'] ?></option>
          <?php endforeach ?>
        </select>
        <br>
        <label>Mata Pelajaran</label>
        <select required="" name="idmatapelajaran_fk" class="form-control">
          <?php foreach ($data_get['mata_pelajaran'] as $key => $value): ?>
          <option value="<?php echo $value['id_mata_pelajaran'] ?>"><?php echo $value['mata_pelajaran'] ?></option>
          <?php endforeach ?>
        </select>
        <br>
        <label>Tanggal</label>
        <input type="date" class="form-control" name="tanggal">
        <button style="margin-top: 20px;" type="submit" required class="btn btn-success"><i class="icon-spinner2"></i> Proses</button>
      </form>
    </div>
  </div>
</div>
<div class="row">
  <div class="col-md-12">
    <div class="proses-absen"></div>
  </div>
</div>