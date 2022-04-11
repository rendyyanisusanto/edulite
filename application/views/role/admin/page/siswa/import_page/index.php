<script src="<?php echo base_url('include/template/limitless/')?>global_assets/js/plugins/tables/datatables/datatables.min.js"></script>

<script src="<?php echo base_url('include/template/limitless/')?>/global_assets/js/plugins/forms/selects/select2.min.js"></script>
<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/import_siswa" enctype="multipart/form-data" id="app-import" method="POST">
 
<div class="row">
	<div class="col-md-6">
		<div class="panel panel-body">
				
 				<div class="form-group">
                  <label class="col-lg-3 control-label">Jurusan:</label>
                  <div class="col-lg-6 col-md-8">

                    <select data-placeholder="Pilih Jurusan"  required="" name="idjurusan_fk" class="select jurusan">
                      <option value=""></option>
                      <?php foreach ($data_get['jurusan'] as $key => $value): ?>
                      <option value="<?php echo $value['id_jurusan'] ?>"><?php echo $value['jurusan'] ?></option>
                      <?php endforeach ?>
                    </select>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-lg-3 control-label">Kelas:</label>
                  <div class="col-lg-6 col-md-6">
                    <div class="select_kelas">
                        <select data-placeholder="Pilih Jurusan terlebih dahulu" required="" name="idkelas_fk" class="select kelas">
                          
                        </select>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                	<div class="col-lg-12">
                		<a href="" target="__blank" id="download_template"></a>
                	</div>
                </div>
                <div class="form-group">
                	<label class="col-lg-3">Pilih File : *</label>
                	<div class="col-md-6"><input type="file" required="" class="file_excel" name="file_upload"></div>
                </div>
                <hr>
                <button type="submit" class="btn btn-primary btn-submit"><i class="icon-spinner"></i> Proses File</button>
			
		</div>
	</div>
</div>
</form>
<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/import_siswa_submit" enctype="multipart/form-data" id="app-submit-form" method="POST">
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-body">
			<div class="panel-proses"></div>
		</div>
	</div>
</div>
</form>