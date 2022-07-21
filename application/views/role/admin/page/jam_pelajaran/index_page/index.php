<script src="<?php echo base_url('include/template/dashboard/')?>/js/plugins/forms/selects/select2.min.js"></script>
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
			                      <option <?php echo ($value['is_active']==1) ? "selected" : "" ; ?>  value="<?php echo $value['id_tahun_ajaran'] ?>"><?php echo $value['tahun_ajaran'] ?></option>
			                      <?php endforeach ?>
			                    </select>
			                  </div>
			                </div>

			                
			                
			                <button type="button" class="btn btn-success btn-proses">Proses</button>
						</fieldset>
					</div>
				</div>
				<div class="col-md-12">
					<div class="panel-jam"></div>
				</div>
			</div>
		
	</div>
</div>
</form>