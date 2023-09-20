<script src="<?php echo base_url('include/template/dashboard/')?>/js/plugins/forms/selects/select2.min.js"></script>
<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/simpan_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">
			<fieldset>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Kode</label>
	              <div class="col-lg-4">
	              	<input type="text" class="form-control kode" required name="kode" placeholder="Input here......">
	              </div>
	              <div class="col-lg-3">
	                  <button class="btn btn-xs btn-success" data-toggle="tooltip" onclick="reload_table('operator','kode','kode');" data-placement="top" title="Reload Kode" type="button"><i class="icon-pencil7"></i></button>
	                  <button class="btn btn-xs btn-info" type="button" onclick="setting_table('operator','kode');" data-toggle="tooltip" data-placement="top" title="Setting Kode" ><i class="icon-cog3"></i></button>
	               </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Nama:</label>
	              <div class="col-lg-9">
	                <input type="text" name="nama" class="form-control" required placeholder="Input here......">
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">No. HP:</label>
	              <div class="col-lg-9">
	                <input type="text" name="no_hp" class="form-control" required placeholder="Input here......">
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Keterangan:</label>
	              <div class="col-lg-9">
	                <input type="text" name="keterangan" class="form-control" required placeholder="Input here......">
	              </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Lokasi</label>
	              <div class="col-lg-4">
	              	<select class="select lokasi" required name="idlokasi_fk">
	              		<option value="">Pilih</option>
		              	<?php foreach ($data_get['lokasi'] as $key => $value): ?>
		              		<option value="<?php echo $value['id_lokasi'] ?>"><?php echo $value['lokasi'] ?></option>
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