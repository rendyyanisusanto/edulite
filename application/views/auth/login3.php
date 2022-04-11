
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title><?php echo $profil_website['nama_website'] ?></title>

	<!-- Global stylesheets -->
	<link href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900" rel="stylesheet" type="text/css">
	<link href="<?php echo base_url('include/template/limitless/')?>global_assets/css/icons/icomoon/styles.css" rel="stylesheet" type="text/css">
	<link href="<?php echo base_url('include/template/limitless/')?>assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="<?php echo base_url('include/template/limitless/')?>assets/css/core.min.css" rel="stylesheet" type="text/css">
	<link href="<?php echo base_url('include/template/limitless/')?>assets/css/components.min.css" rel="stylesheet" type="text/css">
	<link href="<?php echo base_url('include/template/limitless/')?>assets/css/colors.min.css" rel="stylesheet" type="text/css">
	<!-- /global stylesheets -->
<link rel="icon" href="<?php echo base_url('include/media/'.$profil_website['logo'])?>">
	<!-- Core JS files -->
	<script src="<?php echo base_url('include/template/limitless/')?>global_assets/js/plugins/loaders/pace.min.js"></script>
	<script src="<?php echo base_url('include/template/limitless/')?>global_assets/js/core/libraries/jquery.min.js"></script>
	<script src="<?php echo base_url('include/template/limitless/')?>global_assets/js/core/libraries/bootstrap.min.js"></script>
	<script src="<?php echo base_url('include/template/limitless/')?>global_assets/js/plugins/loaders/blockui.min.js"></script>
	<script src="<?php echo base_url('include/template/limitless/')?>global_assets/js/plugins/ui/nicescroll.min.js"></script>
	<script src="<?php echo base_url('include/template/limitless/')?>global_assets/js/plugins/ui/drilldown.js"></script>
	<!-- /core JS files -->


	<!-- Theme JS files -->
	<script src="<?php echo base_url('include/template/limitless/')?>assets/js/app.js"></script>

	<script src="<?php echo base_url('include/template/limitless/')?>global_assets/js/plugins/ui/ripple.min.js"></script>
	<!-- /theme JS files -->

</head>

<body class="login-container">

	<!-- Main navbar -->
	<div class="navbar navbar-inverse bg-indigo">
		<div class="navbar-header">
			<a class="navbar-brand" href="index.html"><img max-width="100%" src="<?php echo base_url('include/media/'.$profil_website['logo'])?>" alt=""></a>

			<ul class="nav navbar-nav pull-right visible-xs-block">
				<li><a data-toggle="collapse" data-target="#navbar-mobile"><i class="icon-tree5"></i></a></li>
			</ul>
		</div>

		<div class="navbar-collapse collapse" id="navbar-mobile">
			<ul class="nav navbar-nav navbar-right">
				<li>
					<a href="#">
						<i class="icon-display4"></i> <span class="visible-xs-inline-block position-right"> Go to website</span>
					</a>
				</li>

				<li>
					<a href="#">
						<i class="icon-user-tie"></i> <span class="visible-xs-inline-block position-right"> Contact admin</span>
					</a>
				</li>

				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown">
						<i class="icon-cog3"></i>
						<span class="visible-xs-inline-block position-right"> Options</span>
					</a>
				</li>
			</ul>
		</div>
	</div>
	<!-- /main navbar -->


	<!-- Page container -->
	<div class="page-container">

		<!-- Page content -->
		<div class="page-content">

			<!-- Main content -->
			<div class="content-wrapper">

				<!-- Simple login form -->
				<?php echo form_open("auth/login");?>
					<div class="panel panel-body login-form">
						<div class="text-center">
							<div class="icon-object border-slate-300 text-slate-300"><i class="icon-reading"></i></div>
							<h5 class="content-group">Login to your account <small class="display-block">Enter your credentials below</small></h5>
						</div>

						<div class="form-group has-feedback has-feedback-left">
							<input type="text" class="form-control" name="identity" placeholder="Username">
							<div class="form-control-feedback">
								<i class="icon-user text-muted"></i>
							</div>
						</div>

						<div class="form-group has-feedback has-feedback-left">
							<input type="password" class="form-control" name="password" placeholder="Password">
							<div class="form-control-feedback">
								<i class="icon-lock2 text-muted"></i>
							</div>
						</div>

						<div class="form-group">
							<?php if (!empty($this->session->flashdata('message'))): ?>
								
							
							<center><span class="label label-danger">Warning : <?php echo $this->session->flashdata('message'); ?></span></center> 
							<?php endif ?><br>
							<button type="submit" class="btn bg-pink-400 btn-block">Sign in <i class="icon-circle-right2 position-right"></i></button>
						</div>

						<div class="text-center">
							<!-- <a href="login_password_recover.html">Forgot password?</a> -->
						</div>
					</div>
				<?php echo form_close();?>
				<!-- /simple login form -->

			</div>
			<!-- /main content -->

		</div>
		<!-- /page content -->

	</div>
	<!-- /page container -->


	<!-- Footer -->
	<div class="footer text-muted text-center">
		<?php echo $profil_website['credit_by'] ?>
	</div>
	<!-- /footer -->

</body>
</html>
