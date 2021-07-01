<script src="<?php echo base_url('include/template/limitless/')?>/global_assets/js/plugins/forms/selects/select2.min.js"></script>

<form class="form-horizontal" action="buku_pemanggilan_siswa/update_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">
			<fieldset>
				<input type="hidden" value="<?php echo $data_get['buku_pemanggilan_siswa']['id_buku_pemanggilan_siswa'] ?>" name="id_buku_pemanggilan_siswa">
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Kode : </label>
	              <div class="col-lg-4">
	              	<input type="text" class="form-control" value="<?php echo $data_get['buku_pemanggilan_siswa']['kode_pemanggilan'] ?>" required name="kode_pemanggilan"  placeholder="Input here......">
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Tanggal</label>
	              <div class="col-lg-4">
	              	<input type="date" class="form-control" value="<?php echo $data_get['buku_pemanggilan_siswa']['tanggal'] ?>" name="tanggal" required placeholder="Input here......">
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Masalah</label>
	              <div class="col-lg-4">
	              	<textarea class="form-control" value="" required="" name="masalah" placeholder="Input here......"><?php echo $data_get['buku_pemanggilan_siswa']['masalah'] ?></textarea>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Pemecahan</label>
	              <div class="col-lg-4">
	              	<textarea class="form-control" value="" required="" name="pemecahan" placeholder="Input here......"><?php echo $data_get['buku_pemanggilan_siswa']['pemecahan'] ?></textarea>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Tindak lanjut</label>
	              <div class="col-lg-4">
	              	<textarea class="form-control" value="" required="" name="tindak_lanjut" placeholder="Input here......"><?php echo $data_get['buku_pemanggilan_siswa']['tindak_lanjut'] ?></textarea>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Keterangan</label>
	              <div class="col-lg-4">
	              	<textarea class="form-control" required="" value="<?php echo $data_get['buku_pemanggilan_siswa']['keterangan'] ?>" name="keterangan" placeholder="Input here......"><?php echo $data_get['buku_pemanggilan_siswa']['keterangan'] ?></textarea>
	              </div>
	            </div>


	            

	            <button class="btn btn-success" type="submit">Update</button>
            </fieldset>	
		</div>
	</div>
</div>
</form>