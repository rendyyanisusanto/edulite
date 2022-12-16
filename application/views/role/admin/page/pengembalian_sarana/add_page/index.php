<script type="text/javascript" src="<?php echo base_url('include/ckeditor/ckeditor.js'); ?>"></script>
<script src="<?php echo base_url('include/template/dashboard/')?>js/plugins/forms/selects/select2.min.js"></script>

<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/simpan_data" id="app-submit" method="POST">
	<div class="row">
		<div class="col-md-4">
			<div class="panel panel-body">
				<div class="form-group">
	              <label class="col-lg-3 control-label">No. Trans:</label>
	              <div class="col-lg-9">
	              	<select class="form-control no_peminjaman_sarana" required="" name="idpeminjamansarana_fk">
		              	<option value="">Pilih</option>
		            </select>
	              </div>
	            </div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			<div class="proses"></div>
		</div>
	</div>
</form>
