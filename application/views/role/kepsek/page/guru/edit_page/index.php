<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/update_data" id="app-submit" method="POST">
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
              <input type="hidden" name="<?php echo $data_get['param']['id'] ?>" value="<?php echo $data_get['data_edit']['id_guru'] ?>">
              <label class="col-lg-3 control-label">Nama:</label>
              <div class="col-lg-9">
                <input type="text" name="nama" class="form-control" value="<?php echo $data_get['data_edit']['nama'] ?>" required placeholder="Input here......">
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-3 control-label">NIP:</label>
              <div class="col-lg-9">
                <input type="text" name="nip" class="form-control"  value="<?php echo $data_get['data_edit']['nip'] ?>" required placeholder="Input here......">
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-3 control-label">Alamat:</label>
              <div class="col-lg-9">
                <input type="text" name="alamat" class="form-control" value="<?php echo $data_get['data_edit']['alamat'] ?>" required placeholder="Input here......">
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-3 control-label">Agama:</label>
              <div class="col-lg-9">
                <select class="form-control" name="agama">
                  <option value="Islam" <?php echo ($data_get['data_edit']['agama'] == 'Islam')?"selected":""; ?>>Islam</option>
                  <option value="Kristen"  <?php echo ($data_get['data_edit']['agama'] == 'Kristen')?"selected":""; ?>>Kristen</option>
                  <option value="Hindu"  <?php echo ($data_get['data_edit']['agama'] == 'Hindu')?"selected":""; ?>>Hindu</option>
                  <option value="Budha"  <?php echo ($data_get['data_edit']['agama'] == 'Budha')?"selected":""; ?>>Budha</option>
                </select>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-3 control-label">Foto:</label>
              <div class="col-lg-9">
                <div class="panel panel-flat">
                  <div class="panel-body">
                    <div class="col-xs-4" >
                      <button class="btn btn-success" type="button" id="addmedia">Add Media</button>
                    </div>
                    <div style="min-height: 200px;background: url('<?php echo base_url('include/media/5.png') ?>');" class="col-xs-4" >
                    </div>
                    <div style="min-height: 200px;background: url('<?php echo base_url('include/media/3.png') ?>');" class="col-xs-4" >
                    </div>
                  </div>
                </div>
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