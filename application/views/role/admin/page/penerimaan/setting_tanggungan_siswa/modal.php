<div class="modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Setting</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
	<div class="panel panel-body">
		<?php if (!empty($data_get['jenis_penerimaan'])){ ?>
			
		<div class="alert alert-danger"><b>Warning ! </b>Tanggungan siswa belum di atur. untuk melanjutkan proses pembayaran tanggungan silahkan setting terlebih dahulu tanggungan siswa.</div>
		<div class="contentform"></div>

		<?php }else{ ?>
			<div class="alert alert-danger"><b>Warning ! </b>Jenis Tanggungan belum disetting, harap setting jenis tanggungan terlebih dahulu.</div>

			<a href="Jenis_penerimaan/get_data" class="app-item btn btn-warning"><i class="icon-stack-plus"></i> Setting Jenis Tanggungan</a>
		<?php } ?>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>