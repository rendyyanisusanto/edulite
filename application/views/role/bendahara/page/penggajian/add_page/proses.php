<div class="col-md-12">
	<div class="panel panel-body" style="background: gray;padding: 1%">
		<?php foreach ($data_get['guru'] as $key=>$value): ?>
			<div class="col-md-12 md<?= $key ?>">
				<div class="panel panel-body">
					<button class="btn btn-danger btn-sm pull-right" type="button" onclick="remove_div(<?php echo $key?>)"><i class="icon-trash"></i> Hapus</button>
					<br>
					<div class="form-group">
		              <div class="col-lg-4">
		              	<input type="text" class="form-control nama" readonly="" value="<?= $value['nama'] ?>" placeholder="Input here......">
		              	<input type="hidden" class="form-control"  value="<?= $value['id_guru'] ?>" name="data[<?php echo $key?>][id_guru]" required placeholder="Input here......">
		              </div>
		            </div>

		            <hr>
		            <b>HR</b>
		            <table class="table tbl<?php echo $key?> table-xxs table-framed">
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
		            			<tr class="tr<?php echo $key?><?php echo $key2?>">
		            				<td width="1%"><button class="btn btn-danger btn-sm pull-right" type="button" onclick="remove_tr('<?php echo $key.$key2?>')"><i class="icon-close2"></i></button></td>
		            				<td><input class="form-control" readonly="" value="<?= $value['komponen_penggajian'] ?>"></input>
									
									<input class="form-control" type="hidden" value="<?= $value['id_komponen_penggajian'] ?>" name="data[<?php echo $key?>][komponen][<?php echo $key2?>][idkomponenpenggajian_fk]"></input>

		            				</td>
		            				<td><input class="form-control" name="data[<?php echo $key?>][komponen][<?php echo $key2?>][keterangan]"></input></td>
		            				<td <?= ($value['is_sum'] == 0) ? 'colspan="3"' : ''; ?>>
		            					<div class="input-group">
		            						<span class="input-group-addon">Rp.</span>
		            						<input class="form-control jml<?php echo $key.$key2?>" type="number" required="" name="data[<?php echo $key?>][komponen][<?php echo $key2?>][jumlah]" onkeyup="count_total('<?php echo $key.$key2?>');" value="<?= $value['jumlah'] ?>"></input>
		            					</div>
		            				</td>
		            				<?php if ($value['is_sum'] == 1): ?>
		            				<td width="1%">x</td>
		            				<td><input class="form-control sum<?php echo $key.$key2?>" type="number" name="data[<?php echo $key?>][komponen][<?php echo $key2?>][sum]" onkeyup="count_total('<?php echo $key.$key2?>');" required="" value="1"></input></td>
		            				<?php endif ?>
		            				<td>
		            					<div class="input-group">
		            						<span class="input-group-addon">Rp.</span>
		            						<input class="form-control total<?php echo $key.$key2?>" type="number" required="" name="data[<?php echo $key?>][komponen][<?php echo $key2?>][total]" value="<?= $value['jumlah'] ?>"></input>
		            					</div>
		            				</td>
		            			</tr>
		            		<?php endforeach ?>
		            	</tbody>
		            	<tfoot>
		            		<tr>
		            			<td colspan="7"><button class="btn bg-slate btn-sm " type="button" onclick="addtr('<?php echo $key?>')"><i class="icon-plus3"></i> Tambah Data</button></td>
		            		</tr>
		            	</tfoot>
		            </table>

		            <br>

		            <b>Potongan</b>
		            <table class="table tblk<?php echo $key?> table-xxs table-framed">
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
		            			<tr class="trk<?php echo $key?><?php echo $key2?>">
		            				<td width="1%"><button class="btn btn-danger btn-sm pull-right" type="button" onclick="remove_trk('<?php echo $key.$key2?>')"><i class="icon-close2"></i></button></td>
		            				<td>
		            					<input class="form-control" readonly="" value="<?= $value['komponen_penggajian'] ?>"></input>

									<input class="form-control" type="hidden" value="<?= $value['id_komponen_penggajian'] ?>" name="data[<?php echo $key?>][komponen_kredit][<?php echo $key2?>][idkomponenpenggajian_fk]"></input>

		            				</td>
		            				<td><input name="data[<?php echo $key?>][komponen_kredit][<?php echo $key2?>][keterangan]" class="form-control" ></input></td>
		            				<td>
		            					<div class="input-group">
		            						<span class="input-group-addon">Rp.</span>
		            						<input class="form-control" name="data[<?php echo $key?>][komponen_kredit][<?php echo $key2?>][jumlah]" value="<?= $value['jumlah'] ?>"></input>
		            					</div>
		            				</td>
		            			</tr>
		            		<?php endforeach ?>
		            	</tbody>
		            	<tfoot>
		            		<tr>
		            			<td colspan="4"><button class="btn bg-slate btn-sm " type="button" onclick="addtrk('<?php echo $key?>')"><i class="icon-plus3"></i> Tambah Data</button></td>
		            		</tr>
		            	</tfoot>
		            </table>
				</div>
			</div>
		<?php endforeach ?>
	</div>
</div>