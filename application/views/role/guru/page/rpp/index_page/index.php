<script src="<?php echo base_url('include/template/limitless/')?>global_assets/js/plugins/tables/datatables/datatables.min.js"></script>

<div class="row">
	<div class="col-md-6">
		<div class="panel panel-body"></div>
	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">
			<a href="<?php echo $data_get['param']['table'] ?>/add_page" class="btn app-item bg-teal-400 btn-labeled legitRipple" id="add-btn"><b><i class="icon-pencil4"></i></b> Tambah RPP</a>
			<!-- <a class="btn bg-info-400 btn-labeled legitRipple" id="upload-btn"><b><i class="icon-pencil4"></i></b> Upload File RPP</a> -->
	        <a class="btn bg-danger-400 btn-labeled legitRipple" id="del-btn"><b><i class="icon-bin"></i></b> Hapus</a>
	        <a class="btn bg-purple-400 btn-labeled legitRipple" href="<?php echo $data_get['param']['table'] ?>/cetak_struk"><b><i class="icon-printer"></i></b> Print</a>
	        <hr>
			<table class="table table-framed table-bordered table-xxs" style="border:1px grey solid;" width="100%" id="tabel-data">
	          <thead>
	            <tr>
	              <th width="1%">#</th>
	              <th>Materi</th>
	              <th>Pelajaran</th>
	              <th>Kelas</th>
	              <th>Download</th>
	            </tr>
	          </thead>
	        </table>
		</div>
	</div>
</div>