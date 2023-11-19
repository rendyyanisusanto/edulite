<div class="panel panel-body">
	<?php echo $data_get['guru']['nama'] ?>

	<hr>


<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/simpan_data" id="app-submit" method="POST">

			<fieldset>
	            <div class="form-group">
	              <label class="col-lg-2 control-label">Kritik</label>
	              <div class="col-lg-6">
	              	<textarea class="form-control"></textarea>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-2 control-label">Saran</label>
	              <div class="col-lg-6">
	              	<textarea class="form-control"></textarea>
	              </div>
	            </div>
	           
				
            </fieldset>	
</form>



</div>