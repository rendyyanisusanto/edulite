<script type="text/javascript" src="<?php echo base_url('include/ckeditor/ckeditor.js'); ?>"></script>
<script src="<?php echo base_url('include/template/dashboard/')?>js/plugins/forms/selects/select2.min.js"></script>

<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/update_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-6">
		<div class="panel panel-body">

			<center><h3><b>Peminjaman Sarana</b></h3></center>
			<fieldset>
				<input type="hidden" value="<?= $data_get['peminjaman_sarana']['id_peminjaman_sarana'] ?>" name="id_peminjaman_sarana">
	            <div class="form-group">
	              <label class="col-lg-3 control-label">No. Trans:</label>
	              <div class="col-lg-4">
	                <input type="text" name="no_peminjaman_sarana" class="form-control no_peminjaman_sarana" required value="<?= $data_get['peminjaman_sarana']['no_peminjaman_sarana'] ?>" placeholder="Input here......">
	              </div>
	              <div class="col-lg-3">
	              	<button class="btn btn-xs btn-success" data-toggle="tooltip" onclick="reload_table('peminjaman_sarana','trans_code','no_peminjaman_sarana');" data-placement="top" title="Reload Kode" type="button"><i class="icon-pencil7"></i></button>
	              	<button class="btn btn-xs btn-info" type="button" onclick="setting_table('peminjaman_sarana','trans_code');" data-toggle="tooltip" data-placement="top" title="Setting Kode" ><i class="icon-cog3"></i></button>
	              </div>
	            </div>

	            <div class="form-group">
	              <label class="col-lg-3 control-label">Tanggal Mulai:</label>
	              <div class="col-lg-2">
	                <input type="date" name="tanggal_mulai" class="form-control" value="<?= $data_get['peminjaman_sarana']['tanggal_mulai'] ?>"  required="" placeholder="Input here......">
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Tanggal Selesai:</label>
	              <div class="col-lg-2">
	                <input type="date" name="tanggal_selesai" class="form-control" value="<?= $data_get['peminjaman_sarana']['tanggal_selesai'] ?>" required="" placeholder="Input here......">
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Pemohon:</label>
	              <div class="col-lg-3">
	              	<select class="form-control table_pemohon" required="" name="table_pemohon">
	              		<option value="">Pilih</option>
	              		<option <?= ($data_get['peminjaman_sarana']['table_pemohon'] == "siswa") ? "selected":""; ?> value="siswa">SISWA</option>
	              		<option <?= ($data_get['peminjaman_sarana']['table_pemohon'] == "guru") ? "selected":""; ?>  value="guru">GURU/PEGAWAI</option>
	              	</select>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Nama Pemohon:</label>
	              <div class="col-lg-3">
	              	<div class="selectpemohon">
		              	<select class="form-control idtablepemohon_fk" required="" name="idtablepemohon_fk">
		              		<option value="">Pilih</option>
		              		<option selected="" value="<?= $data_get['pemohon']['id_'.$data_get['peminjaman_sarana']['table_pemohon']]; ?>"><?= $data_get['pemohon']['nama'] ?></option>
		              	</select>
	              	</div>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Tujuan:</label>
	              <div class="col-lg-9">
	                <input type="text" name="tujuan" class="form-control" value="<?= $data_get['peminjaman_sarana']['tujuan'] ?>" required placeholder="Input here......">
	              </div>
	            </div>
            </fieldset>	
		</div>
	</div>
</div>

<div class="row">
	<div class="col-md-12">

		<div class="panel panel-body">
			<button class="btn btn-primary btn-add" type="button" style="margin-bottom: 1%;"><i class="icon-plus3"></i> Tambah data</button>
			<table class="table table-framed tbl-cart">
				<thead>
					<tr>
						<th width="2%">#</th>
						<th width="10%">Sarana</th>
						<th width="10%">Jumlah</th>
						<th width="10%">Kondisi</th>
						<th width="30%">Keterangan</th>
					</tr>
				</thead>
				<tbody>
					<?php if (empty($data_get['detail_peminjaman_sarana'])){ ?>
						<tr class="empty-data">
							<td colspan="5"><center><b>Data masih kosong</b></center></td>
						</tr>
					<?php }else{ ?>
						<?php foreach ($data_get['detail_peminjaman_sarana'] as $value): ?>
							<?php $rand = rand(0,99999); ?>
							<tr id="tr<?php echo $rand; ?>">
								<td width="1%"><button class="btn btn-xs btn-danger btn-dl-item" data-rowid="<?php echo $rand ?>" type="button"><i class="icon-trash"></i></button></td>
								<td>
									<select class="form-control select-sarana" name="detail[<?php echo $rand; ?>][idsarana_fk]" data-row="<?php echo $rand; ?>" >
										<?php foreach ($data_get['sarana'] as $value_sarana): ?>
											<option <?= ($value['sarana']['id_sarana'] == $value_sarana['id_sarana']) ? "selected" : "" ; ?> value="<?= $value_sarana['id_sarana'] ?>"><?= $value_sarana['sarana'] ?></option>
										<?php endforeach ?>
									</select>
								</td>
								<td><input type="number" required="" value="<?php echo $value['val']['jumlah']; ?>" name="detail[<?php echo $rand; ?>][jumlah]" class="form-control txtjml<?php echo $rand; ?> inp-jml" ></td>
								<td>
									<select name="detail[<?php echo $rand ?>][idkondisisarana_fk]" data-row="<?php echo $data_get['rand']; ?>" class="form-control select-kondisisarana<?php echo $rand ?>">
										<?php foreach ($data_get['kondisi_sarana'] as $value_kondisi): ?>
											<option style="color:<?= $value_kondisi['warna'] ?>;font-weight: bold;" <?= ($value_kondisi['id_kondisi_sarana'] == $value['val']['idkondisisarana_fk']) ? "selected":""; ?> value="<?= $value_kondisi['id_kondisi_sarana'] ?>"><?= $value_kondisi['kondisi_sarana'] ?></option>
										<?php endforeach ?>
									</select>
								</td>
								<td width="10%"><input type="text" required="" value="<?php echo $value['val']['keterangan']; ?>" name="detail[<?php echo $rand; ?>][keterangan]" class="form-control" class="form-control"></td>
							</tr>
						<?php endforeach ?>
					<?php }; ?>
					
					
				</tbody>
			</table>
			<hr style="border-top: 1.4px dashed  red;">
					<div class="col-md-3">
						<b>Key Map</b>
						<ul>
							<li><b>SHIFT</b> : Pencarian Produk</li>
							<li><b>F10</b> : Simpan Transaksi</li>
						</ul>
					</div>
					<div class="col-md-9" >
						<div style="float: right;">
							<a href="<?php echo $data_get['param']['table'] ?>/get_data" class="app-item btn btn-danger"><i class="icon-arrow-left7"></i> Kembali</a>
							<button type="submit" class="btn btn-success"><i class="icon-floppy-disk"></i> Simpan</button>
						</div>
					</div>
		</div>
	</div>
</div>
</form>
