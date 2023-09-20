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
              <label class="col-lg-3 control-label">Table:</label>
              <div class="col-lg-9">
                <select class="form-control table" name="table">
                  <option value="">Pilih</option>
                  <option value="siswa">Siswa</option>
                  <option value="guru">Guru</option>
                  <option value="operator">Operator</option>
                </select>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-3 control-label">User:</label>
              <div class="col-lg-9">
                <div class="userget">
                <select class="form-control user" name="user">
                  <option value="">Pilih table terlebih dahulu</option>
                </select>
                </div>
              </div>
            </div>
            <div class="start-user" style="display: none;">
            <div class="form-group">
              <label class="col-lg-3 control-label">Identity Name:</label>
              <div class="col-lg-9">
                <input type="text" required="" name="identity_name" class="form-control identity_name">
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-3 control-label">Username:</label>
              <div class="col-lg-9">
                <input type="text" required="" name="username" value="<?php echo $data_get['random_username'] ?>" class="form-control">
              </div>
            </div>

            <div class="form-group">
              <label class="col-lg-3 control-label">Password:</label>
              <div class="col-lg-9">
                <input type="password" required="" name="password" value="<?php echo $data_get['random_username'] ?>" class="form-control">
              </div>
            </div>


            <div class="form-group">
              <label class="col-lg-3 control-label">Hak Akses:</label>
              <div class="col-lg-9">
                <select class="form-control" required="" name="hak_akses">
                  <option value="">Pilih Hak Akses</option>
                  <?php foreach ($data_get['groups'] as $key => $value): ?>
                    <option value="<?php echo $value['id'] ?>"><?php echo ucfirst($value['name']) ?></option>
                  <?php endforeach ?>
                </select>
              </div>
            </div>

            <div class="form-group">
              <label class="col-lg-3 control-label">Fitur:</label>
              <div class="col-lg-9">
                <input type="checkbox" name="c" class="" checked> Create <br>
                <input type="checkbox" name="r" class="" checked> Read <br>
                <input type="checkbox" name="u" class="" checked> Update <br>
                <input type="checkbox" name="d" class="" checked> Delete <br>
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