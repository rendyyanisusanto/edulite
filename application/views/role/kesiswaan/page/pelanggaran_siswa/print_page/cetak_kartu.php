<script src="<?php echo base_url('include/template/limitless/')?>/global_assets/js/plugins/forms/selects/select2.min.js"></script>

<div class="row">
	<div class="col-md-6">
		<div class="panel panel-body">
			<form class="form-horizontal" target="__blank" action="<?php echo $data_get['param']['table'] ?>/print_kartu" id="app-submit" method="POST">
				<fieldset>
					<div class="form-group">
		              <label class="col-lg-3 control-label">Siswa</label>
		              <div class="col-lg-8">
		              	<select data-placeholder="Pilih Siswa" name="idsiswa_fk" class="select siswa">
	                     
	                    </select>
		              </div>
		            </div>

	            <button class="btn btn-success" type="submit">Cetak</button>
				</fieldset>
			</form>
		</div>	
	</div>
</div>