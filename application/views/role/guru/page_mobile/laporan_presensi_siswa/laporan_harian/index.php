<script src="<?php echo base_url('include/template/dashboard/') ?>js/plugins/forms/selects/select2.min.js"></script>
<div class="row">
	<div class="col-xs-12">
		<center><h4>Laporan Presensi Siswa</h4></center>
	</div>
</div>
<div class="row" style="margin-top: 5%;">
	<div class="col-xs-12">
		<a href="dashboard/get_data" class="btn app-item bg-warning-400 btn-labeled legitRipple"><b><i class="icon-home"></i></b> Home (<i>Home</i>)</a>
		<hr>
	</div>
</div>
<div class="row">
  <div class="col-md-12">
    <div class="panel panel-body">
      <form class="form-horizontal" action="laporan_presensi_siswa/proses_laporan_harian" id="app-submit" method="POST">
      
        <div class="form-group">
            <label class="col-lg-3 control-label">Kelas:</label>
            <div class="col-lg-9">
                <select data-placeholder="Pilih Kelas" name="idkelas_fk" class="select kelas">
                </select>
            </div>
            </div>
            <div class="form-group">
            <label class="col-lg-3 control-label">Tanggal:</label>
            <div class="col-lg-4">
                <input type="date" name="tanggal" class="form-control" value="<?= date('Y-m-d')?>" required placeholder="Input here......">
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