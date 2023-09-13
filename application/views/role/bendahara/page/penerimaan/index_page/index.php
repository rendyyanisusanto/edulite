<script src="<?php echo base_url('include/template/dashboard/')?>js/plugins/tables/datatables/datatables.min.js"></script>
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
        <!-- <a class="btn bg-success-400 btn-labeled legitRipple" id="edit-btn"><b><i class="icon-pencil4"></i></b> Edit</a> -->
        <a class="btn bg-danger-400 btn-labeled legitRipple" id="del-btn"><b><i class="icon-bin"></i></b> Hapus</a>
        <a target="__blank" class="btn bg-purple-400 btn-labeled legitRipple" href="<?php echo $data_get['param']['table'] ?>/cetak_hari_ini"><b><i class="icon-printer"></i></b> Print hari ini</a>
        <hr>
        <div class="table-responsive">
        <table class="table table-xxs table-framed" width="100%" id="tabel-data">
          <thead>
            <tr>
              <th width="1%">#</th>
              <th>Tanggal</th>
              <th>Invoice</th>
              <th>Siswa</th>
              <th>Jenis</th>
              <th>Total</th>
              <th>#</th>
            </tr>
          </thead>
        </table>
        </div>
      </div>
    </div>
  </div>
</div>
<form action="<?= base_url('admin/Penerimaan/cetak_struk') ?>" method="POST" target="__blank">
<div class="modal modal-struk" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <label>Nama Penerima :</label>
        <input type="hidden" name="id_penerimaan" class="id_penerimaan">
        <input required="" type="text" class="form-control" name="penerima">
        <br>
        <label>Nama yg Mengetahui</label>
        <input required="" type="text" class="form-control" name="mengetahui">
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary">Print</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
</form>