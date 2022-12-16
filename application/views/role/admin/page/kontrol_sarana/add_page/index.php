<script type="text/javascript" src="<?php echo base_url('include/ckeditor/ckeditor.js'); ?>"></script>
<script src="<?php echo base_url('include/template/dashboard/')?>js/plugins/forms/selects/select2.min.js"></script>

<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/simpan_data" id="app-submit" method="POST">

<div class="row">
	<div class="col-md-6">
		<div class="panel panel-body">

			<center><h3><b>Kontrol Sarana</b></h3></center>
			<fieldset>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">No. Trans:</label>
	              <div class="col-lg-4">
	                <input type="text" name="no_kontrol_sarana" class="form-control no_kontrol_sarana" required placeholder="Input here......">
	              </div>
	              <div class="col-lg-3">
	              	<button class="btn btn-xs btn-success" data-toggle="tooltip" onclick="reload_table('kontrol_sarana','trans_code','no_kontrol_sarana');" data-placement="top" title="Reload Kode" type="button"><i class="icon-pencil7"></i></button>
	              	<button class="btn btn-xs btn-info" type="button" onclick="setting_table('kontrol_sarana','trans_code');" data-toggle="tooltip" data-placement="top" title="Setting Kode" ><i class="icon-cog3"></i></button>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Tanggal:</label>
	              <div class="col-lg-2">
	                <input type="date" value="<?= date('Y-m-d'); ?>" name="tanggal" class="form-control"  required="" placeholder="Input here......">
	              </div>
	            </div>
	            
	            <div class="form-group">
	              <label class="col-lg-3 control-label">Penganggung Jawab:</label>
	              <div class="col-lg-3">
	              	<div class="selectpemohon">
		              	<select class="form-control" required="" name="idguru_fk">
		              		<option value="">Pilih</option>
		              		<?php foreach ($data_get['guru'] as $value): ?>
		              			<option value="<?= $value['id_guru'] ?>"><?= $value['nama'] ?></option>
		              		<?php endforeach ?>
		              	</select>
	              	</div>
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
						<th width="10%">Jumlah Awal</th>
						<th width="10%">Jumlah SKRG</th>
						<th width="10%">Kondisi</th>
						<th width="30%">Keterangan</th>
					</tr>
				</thead>
				<tbody>
					<tr class="empty-data">
						<td colspan="6"><center><b>Data masih kosong</b></center></td>
					</tr>
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
