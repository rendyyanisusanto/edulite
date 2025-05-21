<script src="<?php echo base_url('include/template/dashboard/') ?>js/plugins/forms/selects/select2.min.js"></script>
<div class="row">
	<div class="col-xs-12">
		<center><h4>Laporan Presensi Siswa</h4></center>
	</div>
</div>
<div class="row" style="margin-top: 5%;">
	<div class="col-xs-12">
		<a href="dashboard/get_data" class="btn app-item bg-warning-400 btn-labeled legitRipple"><b><i class="icon-home"></i></b> Home (<i>Home</i>)</a>
		<!-- <a href="Request_absen/add_page" class="btn app-item bg-success-400 btn-labeled legitRipple"><b><i class="icon-plus2"></i></b> Tambah (<i>add</i>)</a> -->
		<hr>
	</div>
</div>
<div class="row">
  <div class="col-md-12">
    <div class="panel panel-body">
      <form class="form-horizontal" action="laporan_presensi_siswa/proses_laporan_per_siswa" id="app-submit" method="POST">
      
        <div class="form-group">
          <label class="col-lg-3 control-label">Siswa:</label>
          <div class="col-lg-9">
            <select data-placeholder="Pilih Siswa" name="idsiswa_fk" class="select siswa">
            </select>
          </div>
        </div>
        <div class="form-group">
          <label class="col-lg-3 control-label">Tanggal Mulai:</label>
          <div class="col-lg-4">
            <input type="date" name="tanggal_mulai" class="form-control" required placeholder="Input here......">
          </div>
        </div>
        <div class="form-group">
          <label class="col-lg-3 control-label">Tanggal Sampai:</label>
          <div class="col-lg-4">
            <input type="date" name="tanggal_selesai" class="form-control" required placeholder="Input here......">
          </div>
        </div>

        <button class="btn btn-success" type="submit"><i class="icon-spinner"></i> Proses</button>
    </div>

    </form>
  </div>
  <div class="col-lg-12">
    <div class="content-laporan"></div>
  </div>
</div>