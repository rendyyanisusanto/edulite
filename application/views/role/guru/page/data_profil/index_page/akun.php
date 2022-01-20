<div class="row">
	<div class="col-md-8">
		<div class="panel panel-body">
			<form class="form-horizontal" action="Data_profil/update_akun" id="app-submit" method="POST">
				<div class="form-group">
	              <label class="col-lg-3 control-label">1. Username:</label>
	              <div class="col-lg-6">
	              	<input type="hidden" value="<?php echo $data_get['account']['id'] ?>" name="id">
	                <input type="text" name="username" required="" class="form-control" value="<?php echo $data_get['account']['username'] ?>" placeholder="Input here......">
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">2. Password Lama:</label>
	              <div class="col-lg-6">
	                <input type="password" name="old_password" required="" class="form-control" placeholder="Input here......">
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">3. Password Baru:</label>
	              <div class="col-lg-6">
	                <input type="password" name="password" required="" class="form-control" placeholder="Input here......">
	              </div>
	            </div>
	            <button class="btn btn-submit btn-success" type="submit">Simpan</button>
			</form>
		</div>
	</div>
</div>