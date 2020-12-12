<script src="<?php echo base_url('include/template/limitless/')?>global_assets/js/plugins/tables/datatables/datatables.min.js"></script>
<div class="row">
  <div class="col-md-6">
    <div class="panel panel-body bg-success-400 has-bg-image panel-stats-all">
      <div class="media no-margin">
        <div class="media-left media-middle">
          <i class="icon-books icon-3x opacity-75"></i>
        </div>
        <div class="media-body text-right">
          <h3 class="no-margin txt-total"></h3>
          <span class="text-uppercase text-size-mini">Total Data</span>
        </div>
      </div>
    </div>
  </div>
  <div class="col-md-6">
    <div class="panel panel-body bg-success-400 has-bg-image panel-stats-today">
      <div class="media no-margin">
        <div class="media-left media-middle">
          <i class="icon-copy2 icon-3x opacity-75"></i>
        </div>
        <div class="media-body text-right">
          <h3 class="no-margin txt-today"></h3>
          <span class="text-uppercase text-size-mini">Total Data Hari Ini</span>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="row">
  <div class="col-md-12">
    <div class="panel panel-flat">
      <div class="panel-heading">
        <h6 class="panel-title"><?php echo ucwords(str_replace('_', ' ', $data_get['param']['title'])) ?><a class="heading-elements-toggle"><i class="icon-more"></i></a></h6>
        <div class="heading-elements">
          <ul class="icons-list">
            <li><a data-action="collapse"></a></li>
            <li><a data-action="reload"></a></li>
            <li><a data-action="close"></a></li>
          </ul>
        </div>
      </div>
      <div class="panel-body">
        <a href="<?php echo $data_get['param']['table'] ?>/add_page" class="btn app-item bg-teal-400 btn-labeled legitRipple"><b><i class="icon-plus3"></i></b> Tambah (<i>add</i>)</a>
        <a class="btn bg-success-400 btn-labeled legitRipple" id="edit-btn"><b><i class="icon-pencil4"></i></b> Edit</a>
        <a class="btn bg-danger-400 btn-labeled legitRipple" id="del-btn"><b><i class="icon-bin"></i></b> Hapus</a>
        <a class="btn bg-info-400 btn-labeled legitRipple" id="import-btn"><b><i class="icon-file-upload"></i></b> Import Data</a>
        <a class="btn bg-purple-400 btn-labeled legitRipple" id="cetak-btn"><b><i class="icon-printer"></i></b> Print</a>
        <hr>
        <div class="table-responsive">
          <table class="table" width="100%" id="tabel-data">
            <thead>
              <tr>
                <th width="1%">#</th>
                <?php foreach ($data_get['param']['column'] as $key => $value): ?>
                <th><?php echo ucwords(str_replace('_', ' ', $value)) ?></th>
                <?php endforeach ?>
              </tr>
            </thead>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>