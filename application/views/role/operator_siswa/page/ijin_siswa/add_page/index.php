<script type="text/javascript" src="<?php echo base_url('include/ckeditor/ckeditor.js'); ?>"></script>
<script src="<?php echo base_url('include/template/dashboard/')?>js/plugins/forms/selects/select2.min.js"></script>
<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/simpan_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-6">
		<div class="panel panel-body">

			<center><h3><b>Halaman Tambah Ijin Siswa</b></h3></center>
			<fieldset>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Tanggal:</label>
	              <div class="col-lg-4">
	                <input type="date" name="tanggal" class="form-control" required placeholder="Input here......">
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Nama Siswa:</label>
	              <div class="col-lg-9">
	              	<div class="selectpemohon">
		              	<select class="form-control idsiswa_fk" required="" name="idsiswa_fk">
		              		<option value="">Pilih</option>
		              	</select>
	              	</div>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Alasan:</label>
	              <div class="col-lg-4">
	                <select class="form-control" name="idjenisijin_fk">
	                	<?php foreach ($data_get['jenis_ijin'] as $key => $value): ?>
	                		<option value="<?php echo $value['id_jenis_ijin'] ?>"><?php echo $value['jenis_ijin'] ?></option>
	                	<?php endforeach ?>
	                </select>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Operator:</label>
	              <div class="col-lg-4">
	                <select class="form-control" name="idoperator_fk">
	                	<?php foreach ($data_get['operator'] as $key => $value): ?>
	                		<option value="<?php echo $value['id_operator'] ?>"><?php echo $value['nama'] ?></option>
	                	<?php endforeach ?>
	                </select>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Keterangan:</label>
	              <div class="col-lg-9">
	              	<textarea name="keterangan" id="keterangan" class="form-control" ></textarea>
	                
	              </div>
	            </div>
	            
				<a href="<?php echo $data_get['param']['table'] ?>/get_data" class="app-item btn btn-danger"><i class="icon-arrow-left7"></i> Kembali</a>
	            <button class="btn btn-success" type="submit"><i class="icon-floppy-disk"></i> Simpan</button>
            </fieldset>	
		</div>
	</div>
</div>
</form>