<script src="<?php echo base_url('include/template/dashboard/')?>//js/plugins/forms/selects/select2.min.js"></script>
<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/simpan_data" id="app-submit" method="POST">
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">
			<div class="row">
				<div class="col-md-4">
					<div class="panel panel-body">
						<fieldset>
							<div class="form-group">
			                  <label class="col-lg-4 control-label">Tahun Ajaran</label>
			                  <div class="col-lg-8">
			                  	<select data-placeholder="Pilih Tahun Ajaran" name="idtahunajaran_fk" class="select tahun_ajaran">
			                      <?php foreach ($data_get['tahun_ajaran'] as $key => $value): ?>
			                      <option value="<?php echo $value['id_tahun_ajaran'] ?>"><?php echo $value['tahun_ajaran'] ?></option>
			                      <?php endforeach ?>
			                    </select>
			                  </div>
			                </div>
			                <div class="form-group">
			                <label class="col-lg-4 control-label">Nama Guru</label>
			                  <div class="col-lg-8">
			                    <select data-placeholder="Pilih Kelas" name="idguru_fk" class="select guru">
			                      <?php foreach ($data_get['guru'] as $key => $value): ?>
			                      <option value="<?php echo $value['id_guru'] ?>"><?php echo $value['nama'] ?></option>
			                      <?php endforeach ?>
			                    </select>
			                  </div>
			                </div>
			                <button type="button" class="btn btn-success btn-proses">Proses</button>
						</fieldset>
					</div>
				</div>
				<div class="col-md-8">
					<div class="panel-guru"></div>
				</div>
			</div>
		</div>
	</div>
</div>
</form>