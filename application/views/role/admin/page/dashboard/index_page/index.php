<div class="row">
	<div class="col-md-12">
		<button type="button"  class="btn btn-danger"><i class="icon-user"></i> <?php echo $user_groups['name'] ?></button>

		<button type="button" style="float: right;margin-left: 1%;" class="btn btn-info"><i class="icon-screen3"></i> <?php echo $this->agent->platform(); ?></button>
		<button type="button"  style="float: right;margin-left: 1%;" class="btn btn-success"><i class="icon-chrome"></i> <?php echo $this->agent->browser().' '.$this->agent->version() ?></button>
	</div>
</div>
<div class="row" style="margin-top: 5%;">
	<div class="stats"></div>
</div>