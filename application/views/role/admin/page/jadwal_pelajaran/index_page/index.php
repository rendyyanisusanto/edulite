<script src="<?php echo base_url('include/template/limitless/')?>/global_assets/js/plugins/forms/selects/select2.min.js"></script>
<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/simpan_data" id="app-submit" method="POST">
<div class="row">
	<div class="col-md-12">
		
			<div class="row">
				<div class="col-md-6">
					<div class="panel panel-body panel-head">
						<fieldset>
							<div class="form-group">
			                  <label class="col-lg-4 control-label">Tahun Ajaran</label>
			                  <div class="col-lg-8">
			                  	<select data-placeholder="Pilih Tahun Ajaran" name="idtahunajaran_fk" class="select tahun_ajaran">
			                      <?php foreach ($data_get['tahun_ajaran'] as $key => $value): ?>
			                      <option <?php echo ($value['is_active']==1) ? "selected" : "" ; ?> value="<?php echo $value['id_tahun_ajaran'] ?>"><?php echo $value['tahun_ajaran'] ?></option>
			                      <?php endforeach ?>
			                    </select>
			                  </div>
			                </div>

			                <div class="form-group">
			                  <label class="col-lg-4 control-label">Kelas</label>
			                  <div class="col-lg-8">
			                  	<select data-placeholder="Pilih kelas" name="idkelas_fk" class="select kelas">
			                      <?php foreach ($data_get['kelas'] as $key => $value): ?>
			                      <option value="<?php echo $value['id_kelas'] ?>"><?php echo $value['kelas'] ?></option>
			                      <?php endforeach ?>
			                    </select>
			                  </div>
			                </div>
			                
			                <button type="button" class="btn btn-success btn-proses">Proses</button>
						</fieldset>
					</div>
				</div>
			</div>
		
	</div>
</div>
</form>
<div class="row">
	<div class="col-md-12">
		<div class="panel-proses"></div>
	</div>
</div>