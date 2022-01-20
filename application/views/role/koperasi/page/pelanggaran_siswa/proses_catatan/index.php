<script src="<?php echo base_url('include/template/limitless/')?>/global_assets/js/plugins/forms/selects/select2.min.js"></script>

<form class="form-horizontal" action="pelanggaran_siswa/simpan_data_pelanggaran" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">
			<fieldset>
				 <input type="hidden"  value="<?php echo $data_get['pelanggaran_siswa']['id_catatan_siswa'] ?>" name="id">
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Tanggal</label>
	              <div class="col-lg-4">
	              	<input type="date" class="form-control" name="tanggal" value="<?php echo $data_get['pelanggaran_siswa']['tanggal'] ?>" required placeholder="Input here......">
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Siswa</label>
	              <div class="col-lg-4">
	              	<input type="text" class="form-control" disabled="" value="<?php echo $data_get['siswa']['nama'] ?>" name="">
	              	<input type="hidden" class="form-control" value="<?php echo $data_get['siswa']['id_siswa'] ?>" name="idsiswa_fk">
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Uraian pelanggaran</label>
	              <div class="col-lg-4">
	              	<textarea class="form-control" value="" name="uraian_pelanggaran" placeholder="Input here......"><?php echo $data_get['pelanggaran_siswa']['uraian'] ?></textarea>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Poin</label>
	              <div class="col-lg-4">
	              	<select data-placeholder="Pilih Poin Pelanggaran" name="idpoinpelanggaran_fk" class="select poinpelanggaran">
                     <?php foreach ($data_get['poinpelanggaran'] as $key => $value): ?>
                     	<option value="<?php echo $value['id_poin_pelanggaran'] ?>" ><?php echo $value['nama_pelanggaran'].'('.$value['poin'].')' ?></option>
                     <?php endforeach ?>
                    </select>
	              </div>
	            </div>
	            <button class="btn btn-success" type="submit">Simpan</button>
            </fieldset>	
		</div>
	</div>
</div>
</form>