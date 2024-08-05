<script src="<?php echo base_url('include/template/dashboard/')?>js/plugins/forms/selects/select2.min.js"></script>

<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/simpan_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-6">
		<div class="panel panel-body">

			<center><h3><b>Halaman Tambah Lokasi Penitipan</b></h3></center>
			<fieldset>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Tanggal:</label>
	              <div class="col-lg-3">
	              	<input type="date" value="<?= date('Y-m-d'); ?>" required name="tanggal" class="form-control"></input>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Kode:</label>
	              <div class="col-lg-3 ">
	              	<input type="text" name="kode" value="<?= rand(0,9999999) ?>" required class="form-control"></input>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">RFID:</label>
	              <div class="col-lg-3 ">
	              	<input type="text" name="rfid" required class="form-control"></input>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Nama Barang:</label>
	              <div class="col-lg-4 ">
	              	<input type="text" name="nama_barang" required class="form-control"></input>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Table:</label>
	              <div class="col-lg-3 ">
	                <select class="form-control table" required="" name="table">
	                  <option value="">Pilih</option>
	                  <option value="siswa">Siswa</option>
	                  <option value="guru">Guru</option>
	                  <option value="operator">Operator</option>
	                </select>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">User:</label>
	              <div class="col-lg-3 ">
	                <div class="userget">
	                <select class="form-control user" required="" name="idtable_fk">
	                  <option value="">Pilih table terlebih dahulu</option>
	                </select>
	                </div>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Lokasi:</label>
	              <div class="col-lg-3 ">
	                <select required="" class="form-control idlokasipenitipan_fk" name="idlokasipenitipan_fk">
	                  <option value="">Pilih</option>
	                  <?php foreach ($data_get['lokasi_penitipan'] as $value): ?>
	                  	<option value="<?= $value['id_lokasi_penitipan'] ?>"><?= $value['lokasi'] ?></option>
	                  <?php endforeach ?>
	                </select>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Kategori:</label>
	              <div class="col-lg-3 ">
	                <select required="" class="form-control idkategoripenitipan_fk" name="idkategoripenitipan_fk">
	                  <option value="">Pilih</option>
	                  <?php foreach ($data_get['kategori_penitipan'] as $value): ?>
	                  	<option value="<?= $value['id_kategori_penitipan'] ?>"><?= $value['kategori'] ?></option>
	                  <?php endforeach ?>
	                </select>
	              </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Spesifikasi:</label>
	              <div class="col-lg-9">
	              	<input type="text" name="spesifikasi" class="form-control"></input>
	              </div>
	            </div>


	            <div class="form-group">
	              <label class="col-lg-3 control-label">Keterangan:</label>
	              <div class="col-lg-9">
	              	<input type="text" name="keterangan" class="form-control"></input>
	              </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Foto:</label>
	              <div class="col-lg-9">
	              	<input type="file" name="foto" class="form-control"></input>
	              </div>
	            </div>
				<a href="<?php echo $data_get['param']['table'] ?>/get_data" class="app-item btn btn-danger"><i class="icon-arrow-left7"></i> Kembali</a>
	            <button class="btn btn-success" type="submit"><i class="icon-floppy-disk"></i> Simpan</button>
            </fieldset>	
		</div>
	</div>
</div>
</form>