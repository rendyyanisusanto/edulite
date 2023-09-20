<div class="row">
  <div class="col-md-4">
    <div class="panel panel-body">
      
        <label>Minggu</label>
        <input type="week" class="form-control nweek" value="<?php echo date('Y').'-W'.date('W');?>"  name="tanggal">

        <button style="margin-top: 20px;" type="button" onclick="get_jadwal();" required class="btn btn-success"><i class="icon-spinner2"></i> Proses</button>
        <button style="margin-top: 20px;" type="button" onclick="get_jadwal_rilis();" required class="btn btn-primary"><i class="icon-calendar"></i> Rilis Jadwal</button>
    </div>
  </div>
  <div class="col-md-12">
    <div class="panel panel-body">
      <div class="content-jadwal"></div>
    </div>
  </div>
</div>


<div class="modal modal-jadwal" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <form class="form-horizontal" action="Jadwal_lab/update_jadwal" id="app-submit-modal" method="POST">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="content-detail"></div>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-primary btn-save-modal"><i class="icon-spinner2"></i> Update</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="icon-close2"></i> Tutup</button>
        </div>
      </form>
    </div>
  </div>
</div>