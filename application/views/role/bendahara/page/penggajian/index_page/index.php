<div class="row">
  <div class="col-md-6">
    <div class="panel panel-body panel-head">
      <form action="Presensi_harian/proses_presensi_harian_index" id="app-proses" method="POST">
        <label>Bulan</label>
        <input type="month" class="form-control bulan" value="<?= date('Y-m') ?>" name="bulan">
        <button style="margin-top: 20px;" type="button" onclick="proses();" required class="btn btn-success"><i class="icon-spinner2"></i> Proses</button>
      </form>
    </div>
  </div>
</div>
<div class="row">
  <div class="col-md-12">
    <div class="proses-absen"  style="background: gray; padding: 1%;min-height: 200px;">
      
    </div>
  </div>
</div>
<div id="modal_proses" class="modal" tabindex="-1">
  <div class="modal-dialog modal-full">
    
    <div class="modal-content">
      <form action="Penggajian/simpan_data" id="app-submit" method="POST">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h5 class="modal-title">Penggajian</h5>
      </div>
      <div class="modal-body modal-proses">
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="icon-close2"></i> Close</button>
        <button type="submit" class="btn btn-success"><i class="icon-floppy-disk"></i> Simpan</button>
      </div>
    </form>
    </div>
  </div>
</div>