<script src="<?php echo base_url('include/template/dashboard/')?>/js/plugins/forms/selects/select2.min.js"></script>

<form class="form-horizontal" action="Jenis_penerimaan/simpan_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">
			<fieldset>
	            
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Nama</label>
	              <div class="col-lg-4">
	              	<input type="nama" class="form-control" name="nama" required placeholder="Input here......">
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Kas</label>
	              <div class="col-lg-4">
	              	<select class="form-control" name="kas">
	              	<?php foreach ($data_get['kas'] as $key => $value): ?>
	              		<option value="<?php echo $value['id_akun'] ?>"><?php echo $value['nama'] ?></option>
	              	<?php endforeach ?>
	              	</select>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Pendapatan</label>
	              <div class="col-lg-4">

	              	<select class="form-control" name="pendapatan">
	              	<?php foreach ($data_get['pendapatan'] as $key => $value): ?>
	              		<option value="<?php echo $value['id_akun'] ?>"><?php echo $value['nama'] ?></option>
	              	<?php endforeach ?>
	              	</select>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Diskon</label>
	              <div class="col-lg-4">

	              	<select class="form-control" name="diskon">
	              	<?php foreach ($data_get['diskon'] as $key => $value): ?>
	              		<option value="<?php echo $value['id_akun'] ?>"><?php echo $value['nama'] ?></option>
	              	<?php endforeach ?>
	              	</select>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Piutang</label>
	              <div class="col-lg-4">

	              	<select class="form-control" name="piutang">
	              	<?php foreach ($data_get['piutang'] as $key => $value): ?>
	              		<option value="<?php echo $value['id_akun'] ?>"><?php echo $value['nama'] ?></option>
	              	<?php endforeach ?>
	              	</select>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Template Nota</label>
	              <div class="col-lg-4">
	              	<input type="text" value="INV/BYR/{date}/{rand}" class="form-control" name="template_nota" required placeholder="Input here......">
	              </div>
	            </div>
	            <div class="form-group">
			                  <label class="col-lg-3 control-label">Tahun Ajaran</label>
			                  <div class="col-lg-4">
			                  	<select data-placeholder="Pilih Tahun Ajaran" name="idtahunajaran_fk" class="select tahun_ajaran">
			                      <?php foreach ($data_get['tahun_ajaran'] as $key => $value): ?>
			                      <option <?php echo ($value['is_active']==1) ? "selected" : "" ; ?>  value="<?php echo $value['id_tahun_ajaran'] ?>"><?php echo $value['tahun_ajaran'] ?></option>
			                      <?php endforeach ?>
			                    </select>
			                  </div>
			                </div>

	            
				<a href="<?php echo $data_get['param']['table'] ?>/get_data" class="app-item btn btn-danger"><i class="icon-arrow-left7"></i> Kembali</a>
	            <button class="btn btn-success" type="submit"><i class="icon-floppy-disk"></i> Simpan</button>
            </fieldset>	
		</div>
	</div>
</div>
</form>