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
                  <label class="col-lg-3 control-label">Guru</label>
                  <div class="col-lg-9">
                    <input type="text" value="<?php echo $data_get['guru']['nama'] ?>" class="form-control" disabled name="">
                    <input type="hidden"  name="idguru_fk" class="guru" value="<?php echo $data_get['guru']['id_guru'] ?>">
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-lg-3 control-label">Jadwal</label>
                  <div class="col-lg-9">
                  	<select data-placeholder="Pilih Kelas" name="" class="select jadwal">
                      <option value=""> -- Pilih Jadwal Kelas --</option>
                      <?php foreach ($data_get['mapel'] as $key => $value): ?>
                      <option value="<?php echo $value['id_guru_mapel'] ?>"><?php echo $value['kelas'].' - '.$value['mata_pelajaran'] ?></option>
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


                    <input type="hidden" name="idmatapelajaran_fk" class="form-control idmatapelajaran_fk mata_pelajaran">

                    <input type="hidden" name="idkelas_fk" class="form-control idkelas_fk kelas">

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