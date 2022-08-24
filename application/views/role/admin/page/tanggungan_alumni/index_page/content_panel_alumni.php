<hr>
<form action="Tanggungan_alumni/simpan_data" id="app-submit-tanggungan" method="POST">
<b>Tanggungan Alumni</b>
<br>

<button class="btn btn-xs btn-success btn-add-tanggungan" type="button"><i class="icon-plus3"></i> Tambah Tanggungan</button>
<br>
<table style="margin-top: 2%;" class="table table-xxs table-framed table-bordered">
	<thead>
		<tr>
			<th width="1%">#</th>
			<th width="1%">#</th>
			<th>Nama</th>
			<th>Jumlah</th>
		</tr>
	</thead>
	<tbody>
		<?php foreach ($data_get['tanggungan_alumni'] as $value): ?>
			<tr>
				<td><button type="button" data-text="<?= $value['keterangan'] ?>" class="btn btn-xs btn-danger btn-del-tanggungan" data-idalumni="<?= $data_get['alumni']['id_alumni'] ?>" data-id="<?= $value['id_tanggungan_alumni'] ?>"><i class="icon-trash"></i></button></td>
				<td><button type="button" 
					data-keterangan="<?= $value['keterangan'] ?>" 
					data-kas="<?= $value['kas'] ?>" 
					data-piutang="<?= $value['piutang'] ?>" 
					data-diskon="<?= $value['diskon'] ?>" 
					data-pendapatan="<?= $value['pendapatan'] ?>" 
					data-jumlah="<?= $value['jumlah'] ?>" class="btn btn-xs btn-primary btn-upd-tanggungan" 
					data-idalumni="<?= $data_get['alumni']['id_alumni'] ?>" 
					data-id="<?= $value['id_tanggungan_alumni'] ?>"><i class="icon-pencil"></i></button></td>
				<td><?= $value['keterangan'] ?></td>
				<td><?= $value['jumlah'] ?></td>
			</tr>
		<?php endforeach ?>
		
	</tbody>
</table>
</form>
</div>