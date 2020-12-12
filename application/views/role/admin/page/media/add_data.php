<script src="<?php echo base_url('include/template/limitless/')?>global_assets/js/plugins/uploaders/fileinput/plugins/purify.min.js"></script>
<script src="<?php echo base_url('include/template/limitless/')?>global_assets/js/plugins/uploaders/fileinput/plugins/sortable.min.js"></script>
<script src="<?php echo base_url('include/template/limitless/')?>global_assets/js/plugins/uploaders/fileinput/fileinput.min.js"></script>
<script src="<?php echo base_url('include/template/limitless/')?>global_assets/js/plugins/forms/tags/tagsinput.min.js"></script>
  <script src="<?php echo base_url('include/template/limitless/')?>global_assets/js/plugins/forms/tags/tokenfield.min.js"></script>
  <script src="<?php echo base_url('include/template/limitless/')?>global_assets/js/plugins/ui/prism.min.js"></script>
<form class="form-horizontal" action="media/simpan_data" id="app-submit" method="POST">
  <div class="row">
    <div class="col-md-12">
      <!-- Basic legend -->
      <div class="panel panel-flat">
        <div class="panel-heading">
          <h5 class="panel-title">Tambah Media(<i>Add Data</i>)<a class="heading-elements-toggle"><i class="icon-more"></i></a></h5>
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
              <label class="col-lg-2 control-label">Judul:<br><i>(Title)</i></label>
              <div class="col-lg-10">
                <input type="text" name="nama" required class="form-control" placeholder="Ivony Zakaria">
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-2 control-label text-semibold">Media:<br><i>(Media)</i></label>
              <div class="col-lg-10">
                <input type="file" class="file-input">
                <span class="help-block">Pilih gambar</span>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-2 control-label">Tag:<br><i>(Tag)</i></label>
              <div class="col-lg-10">
               <input type="text" class="form-control tokenfield" value="" placeholder="Add Tag">
              </div>
            </div>
          </fieldset>
        </div>
      </div>
    </div>
    
  </div>
  
  <div class="panel panel-flat">
    <div class="panel-body">
      <div class="row">
        <div class="col-md-12">
          <div class="content-group">
            
            <p class="content-group-sm"></p>
            <div class="text-right">
              <a href="siswa/get_data" class="btn app-item btn-danger legitRipple">Batal<i class="icon-close2 position-right"></i></a>
              <button type="submit" class="btn btn-success legitRipple">Simpan<i class="icon-floppy-disk position-right"></i></button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</form>