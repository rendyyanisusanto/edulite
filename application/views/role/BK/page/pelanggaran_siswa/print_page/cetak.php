<script src="<?php echo base_url('include/template/limitless/')?>/global_assets/js/plugins/forms/selects/select2.min.js"></script>

<div class="row">
	<div class="col-md-6">
		<div class="panel panel-body">
			<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/print_pelanggaran" id="app-submit" method="POST">
				<fieldset>
					<div class="form-group">
		              <label class="col-lg-3 control-label">Cetak Laporan</label>
		              <div class="col-lg-8">
		              	<select data-placeholder="Pilih tipe laporan" name="tipe" class="select tipe">
	                     	<option value="0">Harian</option>
	                     	<option value="2">Bulanan</option>
	                     	<!-- <option value="3">Tahunan</option> -->
	                    </select>
		              </div>
		            </div>
		          <div class="p-next">
		          	<div class="form-group">
		              <label class="col-lg-3 control-label">Tanggal</label>
		              <div class="col-lg-8">
		              	<input type="date" name="tanggal" class="form-control">
		              </div>
		            </div>
        		  </div>
	            <button class="btn btn-success" type="submit">Cetak</button>
				</fieldset>
			</form>
		</div>	
	</div>
</div>
<div class="row">
	<div class="col-lg-12">
		<div class="panel-presensi"></div>
	</div>
</div>
