<div class="row">
	<input type="hidden" name="idguru_fk" value="<?= $data_get['post']['id'] ?>">
	<input type="hidden" name="bulan" value="<?= $data_get['post']['bulan'] ?>">
	<input type="hidden" name="tahun" value="<?= $data_get['post']['tahun'] ?>">
	<input type="hidden" name="total" class="totalfrm">

	<div class="col-md-9">
		<table style="width: 50%;" class="table table-bordered table-xxs table-framed">
			<tr>
				<td class="bg-primary-800">Kode</td>
				<td class="bg-primary-600"><?= $data_get['guru']['kode_pegawai'] ?></td>
			</tr>
			<tr>
				<td class="bg-primary-800">Nama</td>
				<td class="bg-primary-600"><?= $data_get['guru']['nama'] ?></td>
			</tr>
		</table>
	</div>
	<div class="col-md-3">
		<div class="count-total" style="width: 100%; background: yellow;padding-top:1%; padding-bottom:1%;text-align:center;">
			<b class="total-cls" style="font-size: 3.5rem;">
				Total : 3000000
			</b>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-md-12">
		<hr>
		<b>HR</b>
		<table class="table tbl1 table-xxs table-framed">
			<thead class="bg-slate">
				<tr>
					<th>#</th>
					<th>Nama</th>
					<th width="30%">Keterangan</th>
					<th>Nom.</th>
					<th colspan="2"></th>
					<th>Total</th>
				</tr>
			</thead>
			<tbody>
				<?php
				$i = 0;
				foreach ($data_get['komponen_penggajian_debit'] as $key2=>$value): ?>
				<tr class="tr<?php echo $key2?>">
					<td width="1%"><button class="btn btn-danger btn-sm pull-right" type="button" onclick="remove_tr('<?php echo $key2?>')"><i class="icon-close2"></i></button></td>
					<td><input class="form-control" readonly="" value="<?= $value['komponen_penggajian'] ?>"></input>
					
					<input class="form-control" type="hidden" value="<?= $value['id_komponen_penggajian'] ?>" name="data[komponen][<?php echo $key2?>][idkomponenpenggajian_fk]"></input>
				</td>
				<td><input class="form-control" name="data[komponen][<?php echo $key2?>][keterangan]"></input></td>
				<td <?= ($value['is_sum'] == 0) ? 'colspan="3"' : ''; ?>>
					<div class="input-group">
						<span class="input-group-addon">Rp.</span>
						<input class="form-control jml<?php echo $key2?>" type="number" required="" name="data[komponen][<?php echo $key2?>][jumlah]" onkeyup="count_total('<?php echo $key2?>');" value="<?= $value['jumlah'] ?>"></input>
					</div>
				</td>
				<?php if ($value['is_sum'] == 1): ?>
				<td width="1%">x</td>
				<td><input class="form-control sum<?php echo $key2?>" type="number" name="data[komponen][<?php echo $key2?>][sum]" onkeyup="count_total('<?php echo $key2?>');" required="" value="1"></input></td>
				<?php endif ?>
				<td>
					<div class="input-group">
						<span class="input-group-addon">Rp.</span>
						<input class="form-control frmtotal total<?php echo $key2?>" type="number" required="" name="data[komponen][<?php echo $key2?>][total]" value="<?= $value['jumlah'] ?>"></input>
					</div>
				</td>
			</tr>
			<?php endforeach ?>
		</tbody>
		<tfoot>
		<tr>
			<td colspan="7"><button class="btn bg-slate btn-sm " type="button" onclick="addtr()"><i class="icon-plus3"></i> Tambah HR</button></td>
		</tr>
		</tfoot>
		</table>
		<br>
		<b>Potongan</b>
		<table class="table tblk11 table-xxs table-framed">
		<thead class="bg-slate">
			<tr>
				<th>#</th>
				<th>Nama</th>
				<th>Keterangan</th>
				<th>Jumlah</th>
			</tr>
		</thead>
		<tbody>
			<?php
			$i = 0;
			foreach ($data_get['komponen_penggajian_kredit'] as $key2=>$value): ?>
			<tr class="trk<?php echo $key2?>">
				<td width="1%"><button class="btn btn-danger btn-sm pull-right" type="button" onclick="remove_trk('<?php echo $key2?>')"><i class="icon-close2"></i></button></td>
				<td>
					<input class="form-control" readonly="" value="<?= $value['komponen_penggajian'] ?>"></input>
					<input class="form-control" type="hidden" value="<?= $value['id_komponen_penggajian'] ?>" name="data[komponen_kredit][<?php echo $key2?>][idkomponenpenggajian_fk]"></input>
				</td>
				<td><input name="data[komponen_kredit][<?php echo $key2?>][keterangan]" class="form-control" ></input></td>
				<td>
					<div class="input-group">
						<span class="input-group-addon">Rp.</span>
						<input class="form-control frmtanggungan" onkeyup="count_total('<?php echo $key2?>');" name="data[komponen_kredit][<?php echo $key2?>][jumlah]" value="<?= $value['jumlah'] ?>"></input>
					</div>
				</td>
			</tr>
			<?php endforeach ?>
		</tbody>
		<tfoot>
		<tr>
			<td colspan="4"><button class="btn bg-slate btn-sm " type="button" onclick="addtrk()"><i class="icon-plus3"></i> Tambah Potongan</button></td>
		</tr>
		</tfoot>
		</table>
	</div>






</div>

