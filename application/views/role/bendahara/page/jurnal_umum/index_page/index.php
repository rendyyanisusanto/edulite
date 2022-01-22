<div class="row">
	<div class="col-md-12">
		<div class="col-md-6">
		<div class="panel panel-flat">
			<div class="panel-body">
				<form class="form-horizontal" action="" id="app-submit" method="POST">
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
		            <hr>
		            <button class="btn btn-success btn-find" type="button"><i class="icon-search4"></i> Cari</button>
				</form>
			</div>
		</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-flat">
			<div class="panel-body">
				<div class="jurnal-result">
					<center><b><p style="font-size: 30px">Gunakan panel pencarian untuk mencari data</p></b></center>
				</div>
			</div>
		</div>
	</div>
</div>