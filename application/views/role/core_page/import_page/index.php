<div class="row">
	<div class="col-md-6">
		<div class="panel panel-flat">
			<div class="panel-body">
				<a href="<?php echo $data_get['param']['table'] ?>/download_template" >Download Template Excel</a>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<form action="<?php echo $data_get['param']['table'] ?>/process_import" class="excel-upl" id="excel-upl" enctype="multipart/form-data" method="post" accept-charset="utf-8">
      <div class="row padall">
        <div class="col-lg-6 order-lg-1">
          
          <input type="file" class="custom-file-input" id="validatedCustomFile" name="fileURL">
          <label class="custom-file-label" for="validatedCustomFile">Choose file...</label>
        </div>
        <div class="col-lg-6 order-lg-2">
          <button type="submit" name="import" class="float-right btn btn-primary">Import</button>
        </div>
      </div>
    </form>
</div>