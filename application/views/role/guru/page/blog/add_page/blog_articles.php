<script type="text/javascript" src="<?php echo base_url('include/ckeditor/ckeditor.js'); ?>"></script>

<div class="row">
	<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/save_articles" id="app-submit" method="POST">
		<div class="panel panel-body">
			<fieldset>
				<div class="form-group">
					<label class="col-lg-3 control-label">Judul:</label>
					<div class="col-lg-9">
						<input type="text" name="title" class="form-control" required placeholder="Input here......">
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-3 control-label">Gambar:</label>
					<div class="col-lg-9">
						<input type="file" name="img" class="form-control" required placeholder="Input here......">
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-3 control-label">Deskripsi:</label>
					<div class="col-lg-9">
						<textarea class="form-control" id="description" name="description"></textarea>
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-3 control-label">Tagline/Hastag:</label>
					<div class="col-lg-9">
						<input type="text" name="tagline" class="form-control" required placeholder="Input here......">
					</div>
				</div>
			</fieldset>

			<br>
			<button class="btn btn-success" type="submit"><i></i> Simpan</button>
		</div>
	</form>
</div>