<script src="<?php echo base_url('include/template/limitless/')?>global_assets/js/plugins/media/fancybox.min.js"></script>
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
	// Initialize lightbox
    $('[data-popup="lightbox"]').fancybox({
        padding: 3
    });
    
});
</script>
<style type="text/css">.fancybox-margin{margin-right:17px;}</style>
<div class="row">
	<div class="col-lg-12">
	<a href="media/add_page" class="btn app-item bg-teal-400 btn-labeled legitRipple"><b><i class="icon-plus3"></i></b> Tambah (<i>add</i>)</a>
	</div>
</div>
<hr>
<div class="row">
	<?php foreach ($data_get['media'] as $key => $value): ?>
	<div class="col-lg-3 col-sm-6">
		<div class="thumbnail">
			<div class="thumb">
				<img style="height: 200px; width: 150px;" src="<?php echo base_url('include/media/'.$value['img']) ?>" alt="">
				<div class="caption-overflow">
					<span>
						<a href="<?php echo base_url('include/media/'.$value['img']) ?>" data-popup="lightbox" class="btn border-white text-white btn-flat btn-icon btn-rounded legitRipple"><i class="icon-search4"></i></a>
						<a href="#" class="btn border-white text-white btn-flat btn-icon btn-rounded ml-5 legitRipple"><i class="icon-trash"></i></a>
					</span>
				</div>
			</div>
			<div class="caption">
				<h6 class="no-margin"><a href="#" class="text-default"><?php echo $value['title'] ?></a> <a href="#" class="text-muted"><i class="icon-three-bars pull-right"></i></a></h6>
			</div>
		</div>
	</div>
	<?php endforeach ?>
</div>