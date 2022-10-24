<script src="<?php echo base_url('include/template/limitless/')?>global_assets/js/plugins/tables/datatables/datatables.min.js"></script>
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
        
        <!-- <a class="btn bg-purple-400 btn-labeled legitRipple" id="cetak-btn"><b><i class="icon-printer"></i></b> Print</a>
        <a class="btn bg-info-400 btn-labeled legitRipple" target="__blank" href="<?php echo $data_get['param']['table'] ?>/print_hari_ini"><b><i class="icon-printer2"></i></b> Print hari ini</a> -->
        <hr>
        <div class="table-responsive">
        <table class="table table-framed table-xxs" width="100%" id="tabel-data">
          <thead>
            <tr>
              <th width="1%">#</th>
              <th>DU/DI</th>
              <th>Jenis Kerjasama</th>
              <th>Keterangan</th>
              <th width="15%">Berkas</th>
            </tr>
          </thead>
        </table>
        </div>
      </div>
    </div>
  </div>
</div>