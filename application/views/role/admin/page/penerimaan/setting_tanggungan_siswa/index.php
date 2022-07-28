<div class="row">
	<div class="col-md-4">
		<div class="panel panel-body">
			
			<label>Kelas</label>
	        <select class="form-control idkelas" name="id_kelas">

          	<option value="">- Semua Kelas -</option>
	          <?php foreach ($data_get['kelas'] as $key => $value): ?>
	            <option value="<?php echo $value['id_kelas'] ?>"><?php echo $value['kelas'] ?></option>
	          <?php endforeach ?>
	        </select>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">
			<!-- <button class="btn btn-success btn-add-kelas">Setting 1 kelas</button>
			<button class="btn btn-primary btn-add-kelas"><i class=""></i>Setting Semua Siswa</button> -->
			<!-- <hr> -->
			<div class="data"></div>
		</div>
	</div>
</div>
