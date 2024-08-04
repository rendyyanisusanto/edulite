<script src="<?php echo base_url('include/template/limitless/')?>global_assets/js/plugins/tables/datatables/datatables.min.js"></script>
<div class="row">
  <div class="col-md-12">
    <div class="panel panel-flat">
      <div class="panel-heading">
        <h6 class="panel-title"><?php echo ucwords(str_replace('_', ' ', $data_get['param']['title'])) ?><a class="heading-elements-toggle"><i class="icon-more"></i></a></h6>
        <div class="heading-elements">
          <ul class="icons-list">
            <li>
              <a href="<?php echo $data_get['param']['table'] ?>/print_semua" class="btn btn-primary" style="color: white;" target="blank"><b><i class="icon-printer"></i></b> Print (<i>Semua</i>)</a>
            </li>
            <li>
              <a href="<?php echo $data_get['param']['table'] ?>/print_hari_ini" class="btn btn-primary" style="color: white;" target="blank"><b><i class="icon-printer"></i></b> Print (<i>Hari Ini</i>)</a>
            </li>
            <li>
              <a href="<?php echo $data_get['param']['table'] ?>/print_per_bulan" class="btn btn-primary" style="color: white;" target="blank"><b><i class="icon-printer"></i></b> Print (<i>Per Bulan</i>)</a>
              </li>
            <li>
              <select class="form-control input-sm status" >
                <option value="">Filter</option>
                <option value="belum_kembali">Belum Kembali</option>
                <option value="sudah_kembali">Sudah Kembali</option>
              </select>
            </li>
            <li>
              <input type="date" class="tanggal form-control input-sm" name="">
            </li>
          </ul>
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
              <th>Tanggal</th>
              <th>Penitip</th>
              <th>Nama Barang</th>
              <th>Pinjam</th>
              <th>Kembali</th>
            </tr>
          </thead>
        </table>
        </div>
      </div>
    </div>
  </div>
</div>