<script src="<?php echo base_url('include/template/limitless/')?>global_assets/js/plugins/tables/datatables/datatables.min.js"></script>

<div class="row">
  <div class="col-md-12">
    <div class="panel panel-flat">
      <div class="panel-heading">
        <h6 class="panel-title"><?php echo ucwords(str_replace('_', ' ', $data_get['param']['title'])) ?><a class="heading-elements-toggle"><i class="icon-more"></i></a></h6>
        <div class="heading-elements">
          <div class="stats-nav"></div>
        </div>
      </div>
      <div class="panel-body">
        <a href="<?php echo $data_get['param']['table'] ?>/add_page" class="btn app-item bg-teal-400 btn-labeled legitRipple"><b><i class="icon-plus3"></i></b> Tambah (<i>add</i>)</a>
        <a class="btn bg-success-400 btn-labeled legitRipple" id="edit-btn"><b><i class="icon-pencil4"></i></b> Edit</a>
        <a class="btn bg-danger-400 btn-labeled legitRipple" id="del-btn"><b><i class="icon-bin"></i></b> Hapus</a>
        <hr>
        <div class="table-responsive">
        <table class="table table-framed table-xxs" width="100%" id="tabel-data">
          <thead>
            <tr>
              <th width="1%">#</th>
              <th>Invoice</th>
              <th>Pemohon</th>
              <th>Masa Pinjam</th>
              <th>Tujuan</th>
              <th>Status</th>
              <th width="10%">#</th>
              <!-- <th width="1%">#</th> -->
            </tr>
          </thead>
        </table>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Disabled animation -->
          <div id="modal-detail" class="modal" tabindex="-1">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                  <h5 class="modal-title">Detail Peminjaman Sarana</h5>
                </div>

                <div class="modal-body">
                  <div class="body-detail"></div>
                </div>

                <div class="modal-footer">
                  <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="icon-close2"></i> Close</button>
                </div>
              </div>
            </div>
          </div>
<!-- /disabled animation -->
