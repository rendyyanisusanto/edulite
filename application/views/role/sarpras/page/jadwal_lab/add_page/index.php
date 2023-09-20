<script type="text/javascript" src="<?php echo base_url('include/ckeditor/ckeditor.js'); ?>"></script>

<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/simpan_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-6">
		<div class="panel panel-body">

			<center><h3><b>Halaman Tambah Peminjaman laboratorium</b></h3></center>
			<fieldset>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Tanggal:</label>
	              <div class="col-lg-4">
	                <input type="date" name="tanggal" onchange="get_jadwal();" class="form-control tanggal" required placeholder="Input here......">
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
	              <label class="col-lg-3 control-label">Jam Mulai:</label>
	              <div class="col-lg-4">
	              	<select name="idjampelajaranmulai_fk" required class="form-control">
	              		<option value="">--Pilih--</option>
	              		<?php foreach ($data_get['jam_pelajaran'] as $key => $value): ?>
	              			<option value="<?php echo $value['id_jam_pelajaran'] ?>"><?php echo $value['nama'].'('.$value['jam_mulai'].' / '.$value['jam_selesai'].')' ?></option>
	              		<?php endforeach ?>
	              	</select>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Jam Selesai:</label>
	              <div class="col-lg-4">
	              	<select name="idjampelajaranselesai_fk" required class="form-control">
	              		<option value="">--Pilih--</option>
	              		<?php foreach ($data_get['jam_pelajaran'] as $key => $value): ?>
	              			<option value="<?php echo $value['id_jam_pelajaran'] ?>"><?php echo $value['nama'].'('.$value['jam_mulai'].' / '.$value['jam_selesai'].')' ?></option>
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
	<div class="col-md-6">
		<div class="jadwal"></div>
	</div>
</div>
</form>