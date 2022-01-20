<div class="panel panel-body">
	<center>
	<h3>Akun - <?= '('.$data_get['detail_akun']['no_akun'].') '.$data_get['detail_akun']['nama'] ?></h3>
	</center>

	<form action="Coa/simpan_data" id="app-submit" method="POST">
		<input type="hidden" class="id_akun" name="id_akun">
		<input type="hidden" class="idindukakun_fk" value="<?= $data_get['detail_akun']['id_induk_akun'] ?>" name="idindukakun_fk">
		<table class="table table-bordered table-xxs">
			<tr>
				<td>No Akun</td>
				<td><input type="text" name ="no_ref" class="form-control no_ref input-xs" required =""></td>
			</tr>
			<tr>
				<td>Nama</td>
				<td><input type="text" name ="nama" class="form-control input-xs nama" required =""></td>
			</tr>
			<tr>
				<td>Saldo Normal</td>
				<td>
					<select class="form-control saldo_normal" required="" name="saldo_normal">
						<option value="D">Debit</option>
						<option value="K">Kredit</option>
					</select>
				</td>
			</tr>
		</table>
		
		<button style="margin-top: 1%;" type="submit" class="btn btn-submit btn-success btn-sm"><i class="icon-plus3"></i> Tambah data</button>
		<button style="margin-top: 1%;display: none;" type="button" class="btn btn-danger btn-batal btn-sm"><i class="icon-close2"></i> batal</button>
	</form>
	<hr>
	<table class="table table-framed table-xxs">
		<thead>
			<tr>
				<th width="1%">No</th>
				<th>Akun</th>
				<th width="2%">SN</th>
				<th width="2%">#</th>
				<th width="2%">#</th>
			</tr>
		</thead>
		<tbody>
			<?php $no = 0; ?>
			<?php foreach ($data_get['akun'] as $value): ?>
			<tr>
				<td><?= (++$no) ?></td>
				<td><?= '('.$value['no_ref'].') '.$value['nama'] ?></td>
				<td><?= ($value['saldo_normal'] == 'K' ) ? '<span class="label label-danger">Kredit</span>' : '<span class="label label-success">Debit</span>' ; ?></td>
				<td><button data-id_akun="<?= $value['id_akun'] ?>" data-saldo_normal = "<?= $value['saldo_normal'] ?>" data-no_ref="<?= $value['no_ref'] ?>" data-nama="<?= $value['nama'] ?>" class="btn btn-xs btn-edit btn-success"><i class="icon-pencil"></i></button></td>
				<td><button class="btn btn-xs btn-danger btn-delete" type="button" data-id_akun="<?= $value['id_akun'] ?>" data-nama="<?= $value['nama'] ?>"><i class="icon-trash"></i></button></td>
			</tr>
			<?php endforeach ?>
		</tbody>
	</table>
</div>