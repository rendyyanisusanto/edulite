<script src="<?php echo base_url('include/template/limitless/')?>global_assets/js/plugins/tables/datatables/datatables.min.js"></script>
<div class="row">
  <div class="col-md-12">
    <div class="panel panel-flat">
      <div class="panel-heading">
        <h6 class="panel-title">Surat Ijin Sekolah<a class="heading-elements-toggle"><i class="icon-more"></i></a></h6>
        <div class="heading-elements stats-nav" >
        </div>
      </div>
      <div class="panel-body">
        <div class="table-responsive">
        <table class="table table-framed table-xxs" width="100%" id="tabel-data">
          <thead>
            <tr>
              <th width="1%">#</th>
              <th>Kode</th>
              <th>No Surat</th>
              <th width="10%">Tanggal Surat</th>
              <th width="10%">Tanggal Deadline</th>
              <th width="10%">Tujuan</th>
              <th width="50%">Perihal</th>
              <th width="15%">Arsip</th>
            </tr>
          </thead>
        </table>
        </div>
      </div>
      <div class="panel-footer"><a class="heading-elements-toggle"><i class="icon-more"></i></a>
      <div class="heading-elements pull-right">
        <span class="heading-text text-semibold">Range Tanggal:</span>
        <form class="heading-form" action="#">
          <div class="form-group">
            <input type="date" class="form-control tanggal_mulai" placeholder="Search...">
          </div>
          
          <div class="form-group">
            <input type="date" class="form-control tanggal_selesai" placeholder="Search...">
          </div>
        </form>
      </div>
    </div>
    </div>
  </div>
</div>