<script type="text/javascript" src="<?php echo base_url('include/ckeditor/ckeditor.js'); ?>"></script>

<div class="row">
	<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/simpan_data_biografi" id="app-submit" method="POST">
		<div class="panel panel-body">
			<fieldset>
				<div class="form-group">
					<label class="col-lg-3 control-label">Biografi Guru:</label>
					<div class="col-lg-9">
						<textarea class="form-control" id="biografi" name="biografi"><?php echo $data_get['blog_teacher']['deskripsi'] ?></textarea>
					</div>
				</div>
			</fieldset>

			<br>
			<button class="btn btn-success" type="submit"><i></i> Simpan</button>
		</div>
	</form>
</div>