<script src="<?php echo base_url('include/template/limitless/')?>/global_assets/js/plugins/forms/selects/select2.min.js"></script>
<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/simpan_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-4">
		<div class="panel panel-body">
			<fieldset>
                <div class="form-group">
                  <label class="col-lg-3 control-label">Tanggal</label>
                  <div class="col-lg-9">
                    <input type="date" name="tanggal" class="form-control tanggal">
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-lg-3 control-label">Kelas</label>
                  <div class="col-lg-9">
                  	<select data-placeholder="Pilih Kelas" name="idkelas_fk" class="select kelas">
                      <?php foreach ($data_get['kelas'] as $key => $value): ?>
                      <option value="<?php echo $value['id_kelas'] ?>"><?php echo $value['kelas'] ?></option>
                      <?php endforeach ?>
                    </select>
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-lg-3 control-label">Guru</label>
                  <div class="col-lg-9">
                    <select data-placeholder="Pilih Kelas" name="idguru_fk" class="select guru">
                      <?php foreach ($data_get['guru'] as $key => $value): ?>
                      <option value="<?php echo $value['id_guru'] ?>"><?php echo $value['nama'] ?></option>
                      <?php endforeach ?>
                    </select>
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-lg-3 control-label">Pelajaran</label>
                  <div class="col-lg-9">
                    <select data-placeholder="Pilih matapelajaran" name="idmatapelajaran_fk" class="select mata_pelajaran">
                      <?php foreach ($data_get['mata_pelajaran'] as $key => $value): ?>
                      <option value="<?php echo $value['id_mata_pelajaran'] ?>"><?php echo $value['mata_pelajaran'] ?></option>
                      <?php endforeach ?>
                    </select>
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-lg-3 control-label">Jam Ke</label>
                  <div class="col-lg-9">
                    <select data-placeholder="Pilih jam" name="idjam_fk" class="select jam">
                      <?php foreach ($data_get['jam'] as $key => $value): ?>
                      <option value="<?php echo $value['id_jam'] ?>"><?php echo $value['nama'] ?></option>
                      <?php endforeach ?>
                    </select>
                  </div>
                </div>

                <button type="button" class="btn btn-success btn-proses">Proses</button>
            </fieldset>
		</div>
	</div>	
	<div class="col-md-8">
		<div class="panel-siswa">
        
    </div>
	</div>
</div>

</form>