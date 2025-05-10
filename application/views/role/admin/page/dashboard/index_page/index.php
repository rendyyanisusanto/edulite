<script src="<?php echo base_url('include/template/dashboard/')?>/js/core/libraries/jquery_ui/widgets.min.js"></script>
<div class="row">
	<div class="col-md-12">
		<button type="button"  class="btn btn-danger"><i class="icon-user"></i> <?php echo $user_groups['name'] ?></button>
		<button type="button" style="float: right;margin-left: 1%;" class="btn btn-info"><i class="icon-screen3"></i> <?php echo $this->agent->platform(); ?></button>
		<button type="button"  style="float: right;margin-left: 1%;" class="btn btn-success"><i class="icon-chrome"></i> <?php echo $this->agent->browser().' '.$this->agent->version() ?></button>
	</div>
</div>
<div class="row" style="margin-top: 2%;">
  <div class="col-md-4 col-sm-12 col-xs-12">
    <div class="panel panel-primary">
      <div class="panel-heading">
        <strong>Pengaturan Status Pulang</strong>
      </div>
      <div class="panel-body text-center">
        <label for="status-pulang-toggle" class="control-label">
          <i class="fa fa-sign-out"></i> Status Pulang
        </label>
        <br><br>
        <input type="checkbox"
               name="status_pulang"
               id="status-pulang-toggle"
               value="1"
               <?= $data_get['status_pulang']['value'] == '1' ? 'checked' : ''; ?>
               data-toggle="toggle"
               data-on="ON"
               data-off="OFF"
               data-onstyle="success"
               data-offstyle="danger"
        >
        <br><br>
        <small class="text-muted">Klik untuk mengubah status pulang</small>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
	$(".datepicker").datepicker();

	
</script>