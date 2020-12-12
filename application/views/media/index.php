<style>
.selected-image {
   border: 1px solid #f00;
}
</style>
<?php foreach ($data_get['galeri'] as $key => $value): ?>
	<div class="col-xs-3" >
		<img src="<?php echo base_url('include/media/'.$value['img']) ?>" style="max-height: 150px;" class="img-responsive img-galeri" data-img="<?php echo $value['img'] ?>">
	</div>
<?php endforeach ?>