<script src="<?php echo base_url('include/template/limitless/')?>global_assets/js/plugins/forms/inputs/passy.js"></script>
<script src="<?php echo base_url('include/template/limitless/')?>global_assets/js/plugins/forms/inputs/maxlength.min.js"></script>
<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/simpan_data" id="app-submit" method="POST">
  <div class="row">
    <div class="col-md-10">
      <!-- Basic legend -->
      <div class="panel panel-flat">
        <div class="panel-heading">
          <h5 class="panel-title">Tambah Data <?php echo  ucwords(str_replace('_', ' ', $data_get['param']['title'])) ?> (<i>Add Data</i>)<a class="heading-elements-toggle"><i class="icon-more"></i></a></h5>
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
            <?php foreach ($data_get['param']['column'] as $key => $value): ?>
            <div class="form-group">
              <label class="col-lg-2 control-label"><?php echo ucwords(str_replace('_', ' ', $value)) ?></label>
              <div class="col-lg-6">
                <input type="text" name="<?php echo $value ?>" class="form-control" required placeholder="Input here......">
              </div>
            </div>
            <?php endforeach ?>
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