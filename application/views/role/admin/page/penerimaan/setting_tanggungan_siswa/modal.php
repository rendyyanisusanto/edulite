<div class="modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
	<div class="panel panel-body">
		<?php if (!empty($data_get['jenis_penerimaan'])){ ?>
			
		<div class="alert alert-danger"><b>Warning ! </b>Tanggungan siswa belum di atur. untuk melanjutkan proses pembayaran tanggungan silahkan setting terlebih dahulu tanggungan siswa.</div>
		<form id="app-tanggungan" action="Penerimaan/save_tanggungan">
		<table class="table table-framed table-bordered table-xxs">
			<thead>
				<tr>
					<th>No</th>
					<th>Jenis Tanggungan</th>
					<th>Nominal</th>
				</tr>
			</thead>
			<tbody>
				<?php $no = 0; ?>
				<?php foreach ($data_get['jenis_penerimaan'] as $key => $value): ?>
					<input type="hidden" value="<?php echo $value['id_jenis_penerimaan'] ?>" name="data[<?php echo $key ?>][id_jenis_penerimaan]">
					<tr>
						<td><?php echo (++$no) ?></td>
						<td><?php echo $value['nama'] ?></td>
						<td>
							<div class="input-group">
								<span class="input-group-addon">Rp.</span>
								<input type="number" class="form-control" required="" name="data[<?php echo $key ?>][jumlah]"></td>
							</div>
							
					</tr>
				<?php endforeach ?>
			</tbody>
		</table>
		<button style="margin-top: 2%" class="btn btn-success"><i class="icon-floppy-disk"></i> Simpan Tanggungan</button>
		</form>

		<?php }else{ ?>
			<div class="alert alert-danger"><b>Warning ! </b>Jenis Tanggungan belum disetting, harap setting jenis tanggungan terlebih dahulu.</div>

			<a href="Jenis_penerimaan/get_data" class="app-item btn btn-warning"><i class="icon-stack-plus"></i> Setting Jenis Tanggungan</a>
		<?php } ?>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">Save changes</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>