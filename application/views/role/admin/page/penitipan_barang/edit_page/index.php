<script src="<?php echo base_url('include/template/dashboard/')?>js/plugins/forms/selects/select2.min.js"></script>

<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/update_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-6">
		<div class="panel panel-body">

			<center><h3><b>Halaman Edit Penitipan</b></h3></center>
			<fieldset>
				<input type="hidden" name="id_penitipan_barang"  value="<?= $data_get['penitipan_barang']['id_penitipan_barang']; ?>">
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Tanggal:</label>
	              <div class="col-lg-3">
	              	<input type="date" value="<?= $data_get['penitipan_barang']['tanggal']; ?>" required name="tanggal" class="form-control"></input>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Kode:</label>
	              <div class="col-lg-3 ">
	              	<input type="text" name="kode" value="<?= $data_get['penitipan_barang']['kode']; ?>" required class="form-control"></input>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">RFID:</label>
	              <div class="col-lg-3 ">
	              	<input type="text" name="rfid" value="<?= $data_get['penitipan_barang']['rfid']; ?>" required class="form-control"></input>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Nama Barang:</label>
	              <div class="col-lg-4 ">
	              	<input type="text" name="nama_barang" value="<?= $data_get['penitipan_barang']['nama_barang']; ?>" required class="form-control"></input>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Lokasi:</label>
	              <div class="col-lg-3 ">
	                <select required="" class="form-control idlokasipenitipan_fk" name="idlokasipenitipan_fk">
	                  <option value="">Pilih</option>
	                  <?php foreach ($data_get['lokasi_penitipan'] as $value): ?>
	                  	<option <?php echo ($value['id_lokasi_penitipan'] == $data_get['penitipan_barang']['idlokasipenitipan_fk']) ? "selected" : ""; ?> value="<?= $value['id_lokasi_penitipan'] ?>"><?= $value['lokasi'] ?></option>
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
	                  	<option <?php echo ($value['id_kategori_penitipan'] == $data_get['penitipan_barang']['idkategoripenitipan_fk']) ? "selected" : ""; ?>  value="<?= $value['id_kategori_penitipan'] ?>"><?= $value['kategori'] ?></option>
	                  <?php endforeach ?>
	                </select>
	              </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Spesifikasi:</label>
	              <div class="col-lg-9">
	              	<input type="text" name="spesifikasi"  value="<?= $data_get['penitipan_barang']['spesifikasi']; ?>" class="form-control"></input>
	              </div>
	            </div>


	            <div class="form-group">
	              <label class="col-lg-3 control-label">Keterangan:</label>
	              <div class="col-lg-9">
	              	<input type="text" name="keterangan"  value="<?= $data_get['penitipan_barang']['keterangan']; ?>" class="form-control"></input>
	              </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Foto:</label>
	              <div class="col-lg-9">
	              	<img src="<?php echo base_url(((!empty($data_get['penitipan_barang']['foto']) ? 'include/media/foto_penitipan_barang/'.$data_get['penitipan_barang']['foto'] : 'include/media/system/no_image.jpg'))) ?>" class="img-responsive" style="width:100%;max-width: 120px;max-height: 160px" >
                    <input type="hidden" name="foto_before" value="<?php echo $data_get['penitipan_barang']['foto'] ?>">
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