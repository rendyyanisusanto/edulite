<form id="frm-set">
<div class="row">
	<div class="col-xs-6">
		<div class="panel panel-flat">
			<div class="panel-body">
				<table class="table table-bordered table-xxs">
					<tr>
						<td>Laporan</td>
						<td>
							<select class="form-control" name="laporan">
								<option> Pilih </option>
								<option value="data"> Cetak Data(Tabel) </option>
							</select>
						</td>
					</tr>

					<tr>
						<td>Jenis Data</td>
						<td>
							<select class="form-control" name="data_yg_dicetak" id="data_yg_dicetak">
		                      <option> Pilih </option>
		                      <option value="all"> Semua Data </option>
		                      <?php if ($data_get['additional_data']['sum_selected']>0): ?>
		                        <option value="pilih"> Data yg dipilih (<?php echo $data_get['additional_data']['sum_selected'] ?> data terpilih) </option>
		                      <?php endif ?>
		                      <option value="manual"> Filter manual</option>
		                    </select>
		                     <?php if ($data_get['additional_data']['sum_selected']>0): ?>
			                    <input type="hidden" value="<?php echo $data_get['additional_data']['input_selected'] ?>" name="input_selected">
			                <?php endif ?>
						</td>
					</tr>
					<tr>
						<td>Cetak</td>
						<td>
							<select class="form-control" name="tipe_laporan" id="tipe_laporan">
		                      <option> Pilih </option>
		                      <option value="pdf"> PDF </option>
		                      <option value="web"> Cetak Website </option>
		                      <option value="excel"> Excel </option>
		                    </select>
						</td>
					</tr>
					<tr style="display: none" class="posisi">
						<td>Posisi</td>
						<td>
							<select class="form-control" name="posisi" id="posisi">
		                      <option> Pilih </option>
		                      <option value="portrait"> Portrait </option>
		                      <option value="landscape"> Landscape </option>
		                    </select>
						</td>
					</tr>
				</table>
				<hr>
				<button id="cek" class="btn btn-success" type="button"><i class="icon-spinner"></i> Proses Ekspor</button>
			</div>
		</div>
	</div>
	<div class="col-xs-6">
			<div class="panel panel-flat">
				<div class="panel-body">
					<center><h4><u><b>Field yang dicetak</b></u></h4></center>
					<br>
					<?php foreach ($data_get['param']['column'] as $key => $value): ?>
						<input type="checkbox" checked="true" name="field[]" value="<?php echo $value ?>"> <?php echo $value ?>  
					<?php endforeach ?>
				</div>
			</div>
		<div class="filter" style="display: none;">

			<div class="panel panel-flat">
				<div class="panel-body">
					<center><h4><u><b>Filter</b></u></h4></center>
					<table class="table table-bordered table-xxs">
						<?php foreach ($data_get['param']['column'] as $key => $value): ?>
							<tr>
								<td width="30%"><?php echo ucfirst($value) ?></td>
								<td><input type="text" class="form-control" name="f_<?php echo $value ?>" placeholder="Tambahkan data <?php echo ucfirst($value) ?>"></td>
							</tr>
						<?php endforeach ?>
					</table>
				</div>
			</div>
		</div>
	</div>

</div>
<div class="row">
	<div class="col-xs-12">
		<div class="panel panel-flat">
			<div class="panel-body">
				<div id="display_dialog">
					<div class="alert alert-warning"><b>Info :</b> Pilih terlebih dahulu data dan format cetak data. setelah melakukan proses maka akan ditampilkan pada panel ini</div>
				</div>
			</div>
		</div>
	</div>
</div>
</form>