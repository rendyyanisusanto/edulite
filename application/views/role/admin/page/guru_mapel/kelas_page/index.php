<script src="<?php echo base_url('include/template/dashboard/')?>/js/plugins/forms/selects/select2.min.js"></script>
<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/simpan_data" id="app-submit" method="POST">
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body panel-head">
			<div class="row">
				<div class="col-md-6">
					<div class="panel panel-body">
						<fieldset>
							<div class="form-group">
			                  <label class="col-lg-4 control-label">Tahun Ajaran</label>
			                  <div class="col-lg-8">
			                  	<select data-placeholder="Pilih Tahun Ajaran" name="idtahunajaran_fk" required="" class="select tahun_ajaran">
			                      <?php foreach ($data_get['tahun_ajaran'] as $key => $value): ?>
			                      <option <?php echo ($value['is_active']==1) ? "selected" : "" ; ?>  value="<?php echo $value['id_tahun_ajaran'] ?>"><?php echo $value['tahun_ajaran'] ?></option>
			                      <?php endforeach ?>
			                    </select>
			                  </div>
			                </div>
			                <div class="form-group">
			                <label class="col-lg-4 control-label">Kelas</label>
			                  <div class="col-lg-8">
			                    <select data-placeholder="Pilih Kelas" name="idkelas_fk" required="" class="select kelas">
			                      <?php foreach ($data_get['kelas'] as $key => $value): ?>
			                      <option value="<?php echo $value['id_kelas'] ?>"><?php echo $value['kelas'] ?></option>
			                      <?php endforeach ?>
			                    </select>
			                  </div>
			                </div>
			                <button type="button" class="btn btn-success btn-proses">Proses</button>
						</fieldset>
					</div>
				</div>
				<div class="col-md-6">
					<div class="alert alert-info">
						INFO !, Mohon isi dan pastikan Mata Pelajaran telah sesuai. jika belum mengisi data Mata pelajaran maka tidak akan bisa mengisi jadwal pelajaran per guru/kelas

						<br>
						<a href="Mata_pelajaran/get_data" class="app-item btn btn-warning"><i class="icon-pencil3"></i> Mata Pelajaran</a>
					</div>
				</div>
				<div class="col-md-12">
					<div class="panel-kelas"></div>
				</div>
			</div>
		</div>
	</div>
</div>
</form>