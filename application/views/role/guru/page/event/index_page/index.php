<div class="row">
	<div class="panel panel-body">
		<table class="table table-framed table-bordered">
			<tr>
				<td width="20%"><b>Event</b></td>
				<td width="1%">:</td>
				<td><?php echo $data_get['event']['event'] ?></td>
			</tr>
			<tr>
				<td><b>Tanggal</b></td>
				<td width="1%">:</td>
				<td><?php echo $data_get['event']['tanggal'] ?></td>
			</tr>
			<tr>
				<td><b>File</b></td>
				<td width="1%">:</td>
				<td><?php echo $data_get['event']['file'] ?></td>
			</tr>
		</table>
		<br>
		<button type="button" class="btn btn-success btn-sbm" data-id="<?php echo $data_get['event']['id_event'] ?>">Konfirmasi Kehadiran</button>
	</div>
</div>