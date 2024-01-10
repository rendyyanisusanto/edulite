
<div class="panel panel-body">
	
	<table style="width: 30%;" class="table table-xxs table-framed table-bordered">
		<tr>
			<td class="bg-teal-800" width="20%">Nama</td>
			<td class="bg-teal-800"  width="1%">:</td>
			<td class="bg-teal-600" ><?= $data_get['siswa']['nama'] ?></td>
		</tr>
		<tr>
			<td class="bg-teal-800" width="20%">Tanggal</td>
			<td class="bg-teal-800"  width="1%">:</td>
			<td class="bg-teal-600" ><?= $data_get['tanggal'] ?></td>
		</tr>
		<tr>
			<td class="bg-teal-800" width="20%">Kelompok</td>
			<td class="bg-teal-800"  width="1%">:</td>
			<td class="bg-teal-600" ><?= $data_get['kelompok']['nama_kelompok'] ?></td>
		</tr>

	</table>
	<hr>
	
	<form class="form-horizontal" action="Prakerin/simpan_data_jurnal" id="app-submit-data" method="POST">
		<input type="hidden" value="<?php echo $data_get['tanggal'] ?>" name="tanggal">
		<table class="table table-xs table-framed table-bordered">
			<thead>
				<tr>
					<th width="1%">No</th>
					<th>Kegiatan</th>
					<th width="10%">Status</th>
				</tr>
			</thead>
			<tbody>
				<?php 
				$no = 0;
				foreach ($data_get['prakerin_jurnal_harian'] as $value): ?>
					<tr>
						<td><?= ++$no; ?></td>
						<td><?= $value['kegiatan'] ?></td>
						<td><b class="text-<?= (($value['status'] == 0) ? 'danger' : 'success') ?>"> <i class="icon-<?= (($value['status'] == 0) ? 'cross' : 'checkmark') ?>"></i> <?= (($value['status'] == 0) ? 'Belum Disetujui' : 'Disetujui') ?></b></td>
					</tr>
				<?php endforeach ?>
			</tbody>
			<tfoot>
				<tr>
					<th><button type="submit" class="btn btn-xs btn-success"><i class="icon-plus3"></i></button></th>
					<th colspan="2">
						<input name="kegiatan" class="form-control" placeholder="Silahkan tambahkan kegiatan anda hari ini....."></input>
					</th>
				</tr>
			</tfoot>
		</table>
	</form>
</div>

<script type="text/javascript">
	$( "#app-submit-data" ).on('submit',function( e ) {
	    e.stopImmediatePropagation();
	    e.preventDefault();
        var form_data = new FormData(this);
        send_ajax_file( $(this).attr('action'),form_data).then( function(data){        
	   	    toastr.success('Data berhasil ditambahkan, Refresh untuk melihat perubahan');
	        proses();
	    });

	    // proses();
	    return false;
	});
</script>