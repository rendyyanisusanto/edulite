<style type="text/css">
  
</style>
<div class="row">
  <div class="col-md-6">
    <div class="panel panel-body panel-head">
      <form action="Presensi_harian/proses_rekap" id="app-proses" method="POST">
        <table class="table table-framed table-bordered">
          <tr>
            <td class="bg-blue-800">Kelas</td>
            <td class="bg-teal">
              <select class="form-control" name="idkelas_fk">
                <?php foreach ($data_get['kelas'] as $key => $value): ?>
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
            <option  <?php echo ($value['is_active']==1) ? "selected" : "" ; ?> value="<?php echo $value['id_tahun_ajaran'] ?>"><?php echo $value['tahun_ajaran'].' - '.$value['semester'] ?></option>
            <?php endforeach ?>
          </select>
        <label>Rekap</label>
        <select class="form-control tipe" required="" name="tipe">
          <option value="">Pilih Tipe Laporan</option>
          <option value="0">Laporan Presensi Harian</option>
          <option value="3">Laporan Presensi Mingguan</option>
          <option value="2">Laporan Presensi Bulanan</option>
          <!-- <option value="3">Laporan Per Mapel Bulanan</option> -->
          <option value="1">Laporan Total Presensi Mingguan(Hitungan Jam Pelajaran)</option>
          <option value="4">Laporan Total Presensi Bulanan(Hitungan Jam Pelajaran)</option>
          <option value="5">Laporan Total Presensi Bulanan(Hitungan Hari)</option>
          <option value="8">Laporan Presensi Harian (Masuk-Pulang)</option>
          <option value="9">Laporan Presensi Mingguan (Masuk-Pulang)</option>
        </select>

        <div class="p-next">
          
        </div>
        <button style="margin-top: 20px;" type="submit" required class="btn btn-success"><i class="icon-spinner2"></i> Proses</button>
      </form>
    </div>
  </div>
</div>
<div class="row">
  <div class="col-md-12">
    <div class="panel panel-body panel-option" style="display: none;">
      <button class="btn btn-primary btn-prt" type="button"><i class="icon-printer"></i> Cetak</button>
    </div>
    <div id="proses-absen" class="proses-absen"></div>
  </div>
</div>