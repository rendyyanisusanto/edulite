<script src="<?php echo base_url('include/template/dashboard/')?>js/plugins/forms/selects/select2.min.js"></script>
<script src="<?php echo base_url('include/template/dashboard/')?>js/plugins/forms/tags/tagsinput.min.js"></script>
<script src="<?php echo base_url('include/template/dashboard/')?>js/plugins/forms/tags/tokenfield.min.js"></script>
<script src="<?php echo base_url('include/template/dashboard/')?>js/plugins/ui/prism.min.js"></script>

	<script src="<?php echo base_url('include/template/dashboard/')?>js/plugins/forms/styling/uniform.min.js"></script>
	<script src="<?php echo base_url('include/template/dashboard/')?>js/plugins/forms/styling/switchery.min.js"></script>
	<script src="<?php echo base_url('include/template/dashboard/')?>js/plugins/forms/styling/switch.min.js"></script>

<div class="row">
	<div class="col-md-12">
		<div class="col-md-6">
		<div class="panel panel-flat">
			<div class="panel-body">
				<form class="form-horizontal" action="buku_besar/akun" id="app-submit" method="POST">
					<div class="form-group">
		              <label class="col-lg-3 control-label">Mulai</label>
		              <div class="col-lg-9">
		              	<input type="date" name="mulai" value="<?php echo date('Y-m-d'); ?>"  class="form-control mulai">
		              </div>
		            </div>

					<div class="form-group">
		              <label class="col-lg-3 control-label">Sampai</label>
		              <div class="col-lg-9">
		              	<input type="date" name="sampai" value="<?php echo date('Y-m-d'); ?>"  class="form-control sampai">
		              </div>
		            </div>
		            <div class="form-group">
		              <label class="col-lg-3 control-label"></label>
		              <div class="col-lg-9">
		              	<label class="checkbox-inline">
							<input type="checkbox" value="1" class="control-warning chk-akun" name="semua_akun" checked="checked">
							Tampilkan Semua Akun
						</label>
		              </div>
		            </div>
		            
		            <div class="form-group slc" style="display: none;">
		              <label class="col-lg-3 control-label">Akun</label>
		              <div class="col-lg-9">
		              	 <select multiple="multiple" name="akun[]" readonly class="select id_akun"  data-placeholder="Pilih akun....">
		                      <?php foreach ($data_get['akun'] as $key => $value): ?>
		                      <option value="<?php echo $value['id_akun'] ?>" ><?php echo $value['no_ref'].'-'.$value['nama'] ?></option>
		                      <?php endforeach ?>
		                    </select>
		              </div>
		            </div>
		            <div class="form-group">
		              <label class="col-lg-3 control-label"></label>
		              <div class="col-lg-9">
		              	<label class="checkbox-inline">
							<input type="checkbox" value="1" class="control-warning chk-kosong" name="akun_kosong" checked="checked">
							Tampilkan akun yang kosong
						</label>
		              </div>
		            </div>
		            <hr>
		            <button class="btn btn-success" type="submit"><i class="icon-search4"></i> Cari</button>
				</form>
			</div>
		</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-flat panel-result">
			<div class="panel-body">
				<center><h4><b>LAPORAN BUKU BESAR</b></h4></center>
				<div class="buku_besar"></div>
			</div>
		</div>
	</div>
</div>