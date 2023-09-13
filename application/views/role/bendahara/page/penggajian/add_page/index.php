<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/simpan_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-4">
		<div class="panel panel-body">

			<center><h3><b>Halaman Penggajian</b></h3></center>
			<fieldset>
	            
	            <div class="form-group">
	              <label class="col-lg-4 control-label">Bulan/tahun</label>
	              <div class="col-lg-8">
	              	<input type="month" class="form-control bulan" name="bulan" required placeholder="Input here......">
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-4 control-label">Keterangan</label>
	              <div class="col-lg-8">
	              	<input type="text" class="form-control" name="keterangan" required placeholder="Input here......">
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-4 control-label">Template</label>
	              <div class="col-lg-6">
	              	<select class="form-control template_penggajian" name="idtemplatepenggajian_fk">
	              		<?php foreach ($data_get['template_penggajian'] as $value): ?>
	              			<option value="<?= $value['id_template_penggajian'] ?>"><?= $value['nama'] ?></option>

	              		<?php endforeach ?>
	              	</select>
	              </div>
	            </div>
	            <button class="btn btn-success" type="button" onclick="proses_penggajian()"><i class="icon-floppy-disk"></i> Proses</button>
	            <button class="btn btn-success" type="submit"><i class="icon-floppy-disk"></i> Simpan</button>
            </fieldset>	
		</div>
	</div>
</div>

<div class="row">
	<div class="content-penggajian">
		
	</div>
</div>
</form>