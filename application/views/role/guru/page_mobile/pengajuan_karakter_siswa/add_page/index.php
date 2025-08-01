<script type="text/javascript" src="<?php echo base_url('include/ckeditor/ckeditor.js'); ?>"></script>
<script src="<?php echo base_url('include/template/dashboard/')?>js/plugins/forms/selects/select2.min.js"></script>
<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/simpan_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-6">
		<div class="panel panel-body">

			<center><h3><b>Halaman Tambah - Sistem Aduan Siswa</b></h3></center>
			<fieldset>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Tanggal:</label>
	              <div class="col-lg-4">
	                <input type="date" value="<?= date('Y-m-d') ?>" name="tanggal" class="form-control" required placeholder="Input here......">
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Jenis:</label>
	              <div class="col-lg-4">
                    <select name="jenis" id="" class="form-control">
                        <option value="PELANGGARAN">PELANGGARAN</option>
                        <option value="KEBAIKAN">KEBAIKAN</option>
                    </select>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Nama Siswa:</label>
	              <div class="col-lg-4">
	                <input type="text" name="siswa" class="form-control siswa" placeholder="Jika lebih dari satu siswa, pisahkan dengan koma (,)" required>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Foto:</label>
	              <div class="col-lg-4">
	                <input type="file" name="foto" class="form-control" placeholder="Input here......">
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