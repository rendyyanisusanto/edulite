

<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/simpan_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">
			<fieldset>
				<div class="form-group">
				<label class="col-lg-3 control-label">Table:</label>
				<div class="col-lg-4">
					<select class="form-control table" name="table">
					<option value="">Pilih</option>
					<option value="siswa">Siswa</option>
					<option value="guru">Guru</option>
					</select>
				</div>
				</div>
				<div class="form-group">
				<label class="col-lg-3 control-label">User:</label>
				<div class="col-lg-4">
					<div class="userget">
					<select class="form-control user" name="idtable_fk">
					<option value="">Pilih table terlebih dahulu</option>
					</select>
					</div>
				</div>
				</div>
	            
				<div style="display:none;" class="next">
					<div class="form-group">
						<label class="col-lg-3 control-label">Simpanan Wajib:</label>
						<div class="col-lg-4">
							<input type="number" class="form-control" name="jumlah_simpanan_wajib">
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-3 control-label">Simpanan Pokok:</label>
						<div class="col-lg-4">
							<input type="number" class="form-control" name="jumlah_simpanan_pokok">
						</div>
					</div>
				
	        
	            <button class="btn btn-success" type="submit">Simpan</button>
				</div>
            </fieldset>	
		</div>
	</div>
</div>
</form>

