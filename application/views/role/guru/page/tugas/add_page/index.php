<script type="text/javascript" src="<?php echo base_url('include/ckeditor/ckeditor.js'); ?>"></script>

<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/simpan_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-6">
		<div class="panel panel-body">

			<center><h3><b>Halaman Tambah Tugas Siswa</b></h3></center>
			<fieldset>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Kode:</label>
	              <div class="col-lg-4">
	                <input type="text" name="kode" class="form-control" value="<?php echo rand(0, 999999) ?>" required placeholder="Input here......">
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Tanggal:</label>
	              <div class="col-lg-4">
	                <input type="date" name="tanggal" value="<?php echo date("Y-m-d") ?>" class="form-control tanggal" required placeholder="Input here......">
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Deadline Tugas:</label>
	              <div class="col-lg-4">
	                <input type="date" name="deadline" class="form-control" required placeholder="Input here......">
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Kelas:</label>
	              <div class="col-lg-4">
	              	<select name="idkelas_fk" required class="form-control">
	              		<option value="">--Pilih--</option>
	              		<?php foreach ($data_get['kelas'] as $key => $value): ?>
	              			<option value="<?php echo $value['id_kelas'] ?>"><?php echo $value['kelas'] ?></option>
	              		<?php endforeach ?>
	              	</select>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Mata Pelajaran:</label>
	              <div class="col-lg-4">
	              	<select name="idmapel_fk" required class="form-control">
	              		<option value="">--Pilih--</option>
	              		<?php foreach ($data_get['mata_pelajaran'] as $key => $value): ?>
	              			<option value="<?php echo $value['id_mata_pelajaran'] ?>"><?php echo $value['mata_pelajaran'] ?></option>
	              		<?php endforeach ?>
	              	</select>
	              </div>
	            </div>
	           
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Judul Tugas:</label>
	              <div class="col-lg-9">
	              	<input type="text" name="judul" class="form-control">
	              </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Deskripsi:</label>
	              <div class="col-lg-9">
	              	<textarea name="deskripsi" id="deskripsi" class="form-control" ></textarea>
	                
	              </div>
	            </div>
	            
                <div class="form-group">
                  <label class="col-lg-3 control-label">Foto/dokumen Tugas:</label>
                  <div class="col-lg-9">
                    <input type="file" class="form-control" name="foto">
                  </div>
                </div>
				<a href="<?php echo $data_get['param']['table'] ?>/get_data" class="app-item btn btn-danger"><i class="icon-arrow-left7"></i> Kembali</a>
	            <button class="btn btn-success" type="submit"><i class="icon-floppy-disk"></i> Simpan</button>
            </fieldset>	
		</div>
	</div>
	
</div>
</form>