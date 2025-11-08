<?php
// Laporan Izin Keluar Bulanan - Bootstrap 3 + SPA (my_view)
?>
<div class="row">
  <div class="col-md-12">
    <div class="panel panel-primary">
      <div class="panel-heading">
        <i class="fa fa-calendar"></i> Laporan Izin Keluar Bulanan
      </div>
      <div class="panel-body">
        <form class="form-horizontal" onsubmit="return false;">
          <div class="form-group">
            <label class="col-sm-2 control-label">Bulan</label>
            <div class="col-sm-4">
              <input type="month" class="form-control" id="bulan" value="<?php echo date('Y-m'); ?>">
            </div>
            <label class="col-sm-2 control-label">Kelas</label>
            <div class="col-sm-4">
              <select id="kelas" class="form-control">
                <option value="">-- Pilih Kelas --</option>
                <?php foreach ($data_get['kelas'] as $k): ?>
                <option value="<?php echo $k['id_kelas']; ?>"><?php echo $k['kelas']; ?></option>
                <?php endforeach; ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <div class="col-sm-12">
              <button type="button" onclick="get_izin_keluar_bulanan();" class="btn btn-primary btn-block">
                <i class="fa fa-search"></i> Tampilkan
              </button>
            </div>
          </div>
        </form>

        <div class="table-responsive">
          <table class="table table-bordered table-striped">
            <thead>
              <tr>
                <th style="width:60px;">No</th>
                <th>Nama Santri</th>
                <th style="width:120px;">Kelas</th>
                <th style="width:120px;">Jumlah Izin</th>
                <th style="width:140px;">Sudah Kembali</th>
                <th style="width:140px;">Belum Kembali</th>
                <th style="width:160px;">Total Durasi</th>
                <th style="width:160px;">Rata-rata Durasi</th>
              </tr>
            </thead>
            <tbody class="content-izin-keluar-bulanan">
              <tr>
                <td colspan="8" class="text-center text-muted">Silakan pilih bulan dan kelas kemudian klik Tampilkan.</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>
