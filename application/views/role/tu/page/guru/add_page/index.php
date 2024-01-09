<script src="<?php echo base_url('include/core/media.js')?>"></script>

  <script src="<?php echo base_url('include/template/limitless/')?>/global_assets/js/plugins/forms/selects/select2.min.js"></script>
<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/simpan_data" id="app-submit" method="POST">
  <div class="row">
    <div class="col-md-10">
      <div class="panel panel-flat">
        <div class="panel-heading">
          <h5 class="panel-title">Tambah Data Guru (<i>Add Data</i>)<a class="heading-elements-toggle"><i class="icon-more"></i></a></h5>
          <div class="heading-elements">
            <ul class="icons-list">
              <li><a data-action="collapse"></a></li>
              <li><a data-action="reload"></a></li>
              <li><a data-action="close"></a></li>
            </ul>
          </div>
        </div>
        <div class="panel-body">
          <fieldset>
            <div class="form-group">
              <label class="col-lg-3 control-label">Nama:</label>
              <div class="col-lg-9">
                <input type="text" name="nama" class="form-control" required placeholder="Input here......">
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-3 control-label">NIP:</label>
              <div class="col-lg-9">
                <input type="text" name="nip" class="form-control" required placeholder="Input here......">
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-3 control-label">Alamat:</label>
              <div class="col-lg-9">
                <input type="text" name="alamat" class="form-control" required placeholder="Input here......">
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-3 control-label">Mata Pelajaran:</label>
              <div class="col-lg-9">
                 <select data-placeholder="Pilih Mata Pelajaran Guru" name="idmapel_fk" class="select">
                  <?php foreach ($data_get['mapel'] as $key => $value): ?>
                    <option value="<?php echo $value['id_mata_pelajaran'] ?>"><?php echo $value['mata_pelajaran'] ?></option>
                  <?php endforeach ?>
                </select>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-3 control-label">Agama:</label>
              <div class="col-lg-9">
                <select data-placeholder="Pilih Agama" name="agama" class="select">
                  <option value="Islam">Islam</option>
                  <option value="Kristen">Kristen</option>
                  <option value="Hindu">Hindu</option>
                  <option value="Budha">Budha</option>
                </select>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-3 control-label">Foto:</label>
              <div class="col-lg-9">
                <div class="call-media"></div>
              </div>
            </div>
          </fieldset>
        </div>
      </div>
    </div>
    <div class="col-md-2">
      <div class="panel panel-flat">
        <div class="panel-body">
          <button type="submit" class="btn btn-block btn-success legitRipple">Simpan<i class="icon-floppy-disk position-right"></i></button>
          <a href="<?php echo $data_get['param']['table'] ?>/get_data" class="btn btn-block app-item btn-danger legitRipple">Batal<i class="icon-close2 position-right"></i></a><br>
        </div>
      </div>
    </div>
  </div>
</form>
