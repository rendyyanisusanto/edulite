<script src="<?php echo base_url('include/template/limitless/')?>global_assets/js/plugins/tables/datatables/datatables.min.js"></script>
<div class="row">
  <div class="col-md-6">
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
        <div class="table-responsive">
        <table class="table table-framed table-xs" width="100%" id="tabel-data">
          <thead>
            <tr>
              <th width="80%">Nama</th>
              <th>Total</th>
              <th width="1%">#</th>
            </tr>
          </thead>
        </table>
        </div>
      </div>
    </div>
  </div>

  <div class="col-md-6">
    <div class="content-panel"></div>
  </div>
</div>